/*+===================================================================
  File:      SyscallDumper.cpp
  Summary:   Given an ntdll.dll file in the local directory, dump the
             names and RVAs of all exports

  Origin:    Inspired by information security research dependence on 
             j00ru's Syscall Tables

// References:
//  https://resources.infosecinstitute.com/the-export-directory/
//  http://www.rohitab.com/discuss/topic/40594-parsing-pe-export-table/
//  https://j00ru.vexillium.org/syscalls/nt/64/
//  https://www.geoffchappell.com/studies/windows/win32/ntdll/index.htm
//  https://stackoverflow.com/questions/1128150/win32-api-to-enumerate-dll-export-functions

===================================================================+*/

#include <windows.h>
#include <assert.h>
#include <iostream>
#include <memory>
#include <iomanip>

// Function Prototypes
BOOL is_syscall(LPCVOID pFunction);

// Entry Point
int main(int argc, char *argv[])
{
    DWORD status;

    // Load ntdll
    HMODULE ntdll = LoadLibraryEx(L"C:\\Windows\\System32\\ntdll.dll", NULL, LOAD_LIBRARY_AS_DATAFILE);
    if (!ntdll) {
        status = GetLastError();
        std::cout << "Error: " << status;
        return status;
    }

    // Extract the dos header
    auto dos_header = reinterpret_cast<PIMAGE_DOS_HEADER>(ntdll);
    assert(dos_header->e_magic == IMAGE_DOS_SIGNATURE);

    // Extract the nt header
    auto ntHeader = reinterpret_cast<PIMAGE_NT_HEADERS>(
        reinterpret_cast<BYTE*>(ntdll) + reinterpret_cast<PIMAGE_DOS_HEADER>(ntdll)->e_lfanew);

    // Extract the export directory
    auto exports = reinterpret_cast<PIMAGE_EXPORT_DIRECTORY>((BYTE*)ntdll + ntHeader->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);
    assert(exports->AddressOfNames != 0);

    // Set variables for export directory members
    auto addr = reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfFunctions));
    auto name = reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfNames));
    auto ord = reinterpret_cast<PWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfNameOrdinals));

    // Print column headers
    std::cout << std::left
        << std::setw(10) << "ordinal"
        << std::setw(10) << "RVA"
        << std::setw(10) << "number"
        << "name\n" << std::endl;

    // Loop over exports
    for (uint64_t i = 0; i < exports->NumberOfFunctions; i++) {
        // Get the pointer to the function
        PVOID funcaddr = reinterpret_cast<PVOID>(
            reinterpret_cast<LPBYTE>(ntdll) + addr[ord[i]]);

        // Identify "Nt" family functions
        if (is_syscall(funcaddr)) {
            // Continue if not Zw
            std::string funcname = (char*)ntdll + name[i];
            if (strncmp(funcname.c_str(), (char*)"Nt", 2)) continue;

            // Calculate its RVA
            auto rva = (uint64_t)funcaddr - ntHeader->OptionalHeader.ImageBase;

            // Retrieve the syscall code number from the raw bytes
            auto objectcode = *(uintptr_t*)funcaddr;
            auto syscallcode = (objectcode >> 8 * 4) & 0xfff;
                               
            // Print the function's information
            std::cout << std::left
                << std::setw(10) << std::dec << i
                << std::setw(10) << std::hex << rva
                << std::setw(10) << std::hex << syscallcode
                << funcname << std::endl;   
        }
    }

    return ERROR_SUCCESS;
}

// Check the first four bytes of the function for operations indicating a syscall
BOOL is_syscall(LPCVOID pFunction) {
    LPCBYTE lpBytePtr = (LPCBYTE)pFunction;

    if (lpBytePtr[0] == 0x4C &&
        lpBytePtr[1] == 0x8B &&
        lpBytePtr[2] == 0xD1 &&
        lpBytePtr[3] == 0xB8) return TRUE;

    return FALSE;
}
