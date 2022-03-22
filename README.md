# Syscall Dumper

This is an implementation of a simple (less than 100 lines) C++ program which dumps system call information from `ntdll.dll`.

---

## 0. Introduction

`ntdll.dll` is the interface through which user-mode applications access the Windows kernel. `ntdll.dll` exports functions for every fundamental activity requring access to the domain of the kernel. Examples include interacting with the filesystem, virtual memory, physical devices, and more.

These functions are are esentially thin wrappers for passing information to the kernel for execution. With each syscall, `ntddl.dll` sets up the information that the kernel needs, including placing the relevant _number_ of the system call into register `eax`. Following this, control is diverted to the kernel using the `syscall` instruction. A more complete description of this instruction can be found [here](https://www.felixcloutier.com/x86/syscall).

The following image shows an example of the disassembly of an `ntdll.dll` system call export:

![resourcse system call disasm](resources/ntdll_syscall_wrapper.png)

`ntdll.dll` itself exports over 2000 functions. On Windows 1909, 464 of these are these system call wrappers. The exports of a given executable can quickly be dumped using `dumpbin.exe` as follows:

```
C:\>dumpbin /exports C:\Windows\System32\ntdll.dll
Microsoft (R) COFF/PE Dumper Version 14.24.28316.0
Copyright (C) Microsoft Corporation.  All rights reserved.

Dump of file C:\Windows\System32\ntdll.dll

File Type: DLL
  Section contains the following exports for ntdll.dll
    00000000 characteristics
     C1BB301 time date stamp
        0.00 version
           8 ordinal base
        2381 number of functions
        2380 number of names

    ordinal hint RVA      name
          9    0 00040230 A_SHAFinal
         10    1 00041060 A_SHAInit
        ...    (truncated)
```

`ntdll.dll` is not intended to be accessed directly, but instead used as defined in other libraries and subsystem APIs (such as `kernel32.dll`). These ordinarily abstract much of the gritty details of system call invocation, but for many reasons they are sometimes even used directly, as in the case in some offensive security tools and malware. 

## 1. Extracting System Call Numbers From `ntdll.dl`

Whatever the reason, it is fairly simple to search through the data of `ntdll.dll` and pick out the system call numbers. To start, a pointer to the DLL data in memory is needed:

```c++
// load ntdll
HMODULE ntdll = LoadLibraryEx(L"C:\\Windows\\System32\\ntdll.dll", NULL, LOAD_LIBRARY_AS_DATAFILE);
if (!ntdll) {
    status = GetLastError();
    std::cout << "Error: " << status;
    return status;
}
```

You can call LoadLibrary to load `ntdll.dll`, but it is also implicitly loaded in every new process. Additionally the raw unmapped file can just be read from disk into memory without mapping. 

With a pointer to the module, it can then be parsed for exports:

```c++
// extract the dos header
auto dosHeader = reinterpret_cast<PIMAGE_DOS_HEADER>(ntdll);

// extract the nt header
auto ntHeader = reinterpret_cast<PIMAGE_NT_HEADERS>(
    reinterpret_cast<BYTE*>(ntdll) + reinterpret_cast<PIMAGE_DOS_HEADER>(ntdll)->e_lfanew);

// extract the export directory
auto exports = reinterpret_cast<PIMAGE_EXPORT_DIRECTORY>((BYTE*)ntdll + ntHeader->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);

// set variables for export directory members
auto addr = reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfFunctions));
auto name = reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfNames));
auto ord = reinterpret_cast<PWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfNameOrdinals));
```

From here, the exports can simply be looped over to:
- find functions matching system calls
- extract the system call number:

```c++
for (uint64_t i = 0; i < export_dir->NumberOfFunctions; i++) {
    auto current_function = (PVOID)(
        ntdll_base + address_of_func[address_of_ord[i]]);

    // skip functions without matching byte signature
    if (is_syscall(current_function)) {           
        //  get the function's name
        DWORD rva = (DWORD)current_function - nt_header->OptionalHeader.ImageBase;
        auto function_name = (char*)(ntdll_base + address_of_name[i]);

        // get the syscall code number from the raw bytes
        auto function_data = *(uintptr_t*)current_function;
        auto syscall_num = (function_data >> 8 * 4) & 0xfff;
    }
}
```

The result is a program which will enumerate the system calls of `ntdll.dll`:

```
C:\>SyscallDumper.exe
ordinal   RVA       code      name

190       9c0a0     2         NtAcceptConnectPort
191       9c060     0         NtAccessCheck
192       9c580     29        NtAccessCheckAndAuditAlarm
... (truncated)
653       9cb40     57        NtWriteRequestData
654       9c7a0     3a        NtWriteVirtualMemory
655       9c920     46        NtYieldExecution
```

## 2. Conclusion

The output of the binary generated from this project's source does just this. Going through the output of system call numbers and their names reveals a lot of information about what the Windows operating system makes available to the user. In addition to offering facilities for opening files, working with memory, and executing code, there are syscalls for querying the boot order, obtaining power information, enumerating drivers, writing text to the screen (before GUI load) and even running a virtual DOS environment. Many of these utilities are either poorly documented or completely undocumented. Digging in and reverse engineering undocumented system calls to understand their purpose and particularities is an underexplored opportunity for community contributions to the public knowledge of the Windows operating system. With that being said, I hope this writeup was useful to the reader.

---

For future work, some provocative security related questions might include:

- What syscalls allow a user to open handles without common and potentially monitored means?
- Do any system calls allow a user (privileged or otherwise) to disrupt the availability of the system or proccesses and services that are considered ordinarily inaccessible from that context?
- Do any system calls offer alternative means of data or execution persistence?
- What vulnerabilities exist in undocumented and poorly documented system call handlers (defined in the kernel)?

## References
- ['Hello World' from boot screen](https://munin.uit.no/bitstream/handle/10037/7810/thesis.pdf?sequence=2)
- [J00ru's System Call Tables](https://j00ru.vexillium.org/syscalls/nt/64/)
