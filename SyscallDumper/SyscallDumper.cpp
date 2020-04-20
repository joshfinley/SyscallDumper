/*+===================================================================
  File:      SyscallDumper.cpp
  Summary:   Given an ntdll.dll file in the local directory, dump the
             names and RVAs of all exports

  Classes:   Classes declared or used (in source files).
  Functions: Functions exported (in source files).
  Origin:    Inspired by tooling changes needed by introduction of 
             Windows 1909.

// References:
//  https://resources.infosecinstitute.com/the-export-directory/
//  http://www.rohitab.com/discuss/topic/40594-parsing-pe-export-table/
//  https://j00ru.vexillium.org/syscalls/nt/64/
//  https://www.geoffchappell.com/studies/windows/win32/ntdll/index.htm
//  https://stackoverflow.com/questions/1128150/win32-api-to-enumerate-dll-export-functions

===================================================================+*/

#include <windows.h>
#include <iostream>
#include <assert.h>
#include <intrin.h>

#include <vector>
#include <iomanip>

// local includes
#include "syscalls.hpp"

int main(int argc, char *argv[])
{
    DWORD status;

    // load ntdll
    HMODULE ntdll = LoadLibraryEx(L"C:\\Windows\\System32\\ntdll.dll", NULL, LOAD_LIBRARY_AS_DATAFILE);
    if (!ntdll) {
        status = GetLastError();
        std::cout << "Error: " << status;
        return status;
    }

    // extract the dos header
    auto dosHeader = reinterpret_cast<PIMAGE_DOS_HEADER>(ntdll);
    assert(dosHeader->e_magic == IMAGE_DOS_SIGNATURE);

    // extract the nt header
    auto ntHeader = reinterpret_cast<PIMAGE_NT_HEADERS>(
        reinterpret_cast<BYTE*>(ntdll) + reinterpret_cast<PIMAGE_DOS_HEADER>(ntdll)->e_lfanew);

    // extract the export directory
    auto exports = reinterpret_cast<PIMAGE_EXPORT_DIRECTORY>((BYTE*)ntdll + ntHeader->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);
    assert(exports->AddressOfNames != 0);

    // set variables for export directory members
    auto addr = reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfFunctions));
    auto name = reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfNames));
    auto ord = reinterpret_cast<PWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfNameOrdinals));

    // print column headers
    std::cout << std::left
        << std::setw(10) << "ordinal"
        << std::setw(10) << "RVA"
        << std::setw(10) << "number"
        << std::setw(15) << "bytes"
        << "name\n" << std::endl;

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
                    << std::setw(15) << std::hex << _byteswap_ulong(objectcode)
                    << funcname << std::endl;
            }
            catch (char *e) {
                std::cout << "Exception: " << e << std::endl;
                continue;
            }
        }
    }

    return ERROR_SUCCESS;
}