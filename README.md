# Syscall Dumper

This is an implementation of a simple (less than 100 lines) C++ program which dumps system call information from `ntdll.dll`.

---

`ntdll.dll` is the interface through which user-mode applications access the Windows kernel. `ntdll.dll` exports functions for every fundamental activity requring access to the domain of the kernel. Examples include interacting with the filesystem, virtual memory, physical devices, and more.

These functions are are esentially thin wrappers for passing information to the kernel for execution. With each syscall, `ntddl.dll` sets up the information that the kernel needs, including placing the relevant _number_ of the system call into register `eax`. Following this, control is diverted to the kernel using the `syscall` instruction. A more complete description of this instruction can be found [here](https://www.felixcloutier.com/x86/syscall).

The following image shows an example of the disassembly of an `ntdll.dll` sytem call export:

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

          9    0 0000C4D0 A_SHAFinal
... (truncated)
       2388  94B 00092220 wcstoul
          8      0007C8C0 [NONAME]

  Summary

        1000 .00cfg
        C000 .data
        4000 .mrdata
        F000 .pdata
       47000 .rdata
        1000 .reloc
       70000 .rsrc
      116000 .text
        1000 RT
```

For almost any legitimate, day-to-day activities, a programmer will not interact with `ntdll.dll` directly, but instead will interact with other layers of wrappers around these fundamental system call functions as defined in libraries and subsystem APIs. But for research, malware, and anti-malware purposes, more precise details about the system call numbers are sometimes needed.

## Extracting System Call Numbers From `ntdll.dl`

Extracting the system calls from `ntdll.dll` is more an exercise in manual mapping than anything else. First, `ntdll.dll` is loaded with the `LOAD_LIBRARY_AS_DATAFILE` flag:

```c++
// load ntdll
HMODULE ntdll = LoadLibraryEx(L"C:\\Windows\\System32\\ntdll.dll", NULL, LOAD_LIBRARY_AS_DATAFILE);
if (!ntdll) {
    status = GetLastError();
    std::cout << "Error: " << status;
    return status;
}
```

Without the`LOAD_LIBRARY_AS_DATAFILE` flag, `DllMain` would be called upon loading. In this siutation, this needs to be avoidied, and by using this flag, the library to simply be loaded as raw data.

With the raw data of `ntdll.dll` available, it can be parsed for exports:

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
- find functions with names matching system calls
- extract the system call number:

```c++
// loop over exports
for (uint64_t i = 0; i < exports->AddressOfFunctions; i++) {
    std::string funcname = (char*)ntdll + name[i];

    // identify "Nt" family functions
    if (funcname.rfind("Nt", 0) == 0) {
        try {
            // get the pointer to the function and calculate its RVA
            PVOID funcaddr = reinterpret_cast<PVOID>(
                reinterpret_cast<LPBYTE>(ntdll) + addr[ord[i]]);
            auto rva = (uint64_t)funcaddr - ntHeader->OptionalHeader.ImageBase;

            if (!isSyscall(funcname))
                continue;

            // retrieve the syscall code number from the address
            auto objectcode = *(uintptr_t*)funcaddr;
            auto syscallcode = (objectcode >> 8 * 4) & 0xfff;
                            
            // print the function's information
            std::cout << std::left
                << std::setw(10) << std::dec << i
                << std::setw(10) << std::hex << rva
                << std::setw(10) << std::hex << syscallcode
                << funcname << std::endl;
        }
        catch (char *e) {
            std::cout << "Exception: " << e << std::endl;
            continue;
        }
    }
}
```

The result is a program which will enumerate the system calls of `ntdll.dll`

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