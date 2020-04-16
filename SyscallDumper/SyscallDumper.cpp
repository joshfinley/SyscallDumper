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

// Examples:
//  https://stackoverflow.com/questions/1128150/win32-api-to-enumerate-dll-export-functions
===================================================================+*/

#include <windows.h>
#include <iostream>
#include <assert.h>

#include <vector>

// local includes
#include "json.hpp"

// prototypes
void usage();
void printSyscall(std::string syscallname, uint64_t syscalloffset);



int main(int argc, char *argv[])
{
    // set file name
    HMODULE ntdll = LoadLibraryEx(L"./ntdll.dll", NULL, DONT_RESOLVE_DLL_REFERENCES);
    if (!ntdll) {
        printf("Error: %d", GetLastError());
        return ERROR_FUNCTION_FAILED;
    }

    auto dosHeader = reinterpret_cast<PIMAGE_DOS_HEADER>(ntdll);
    assert(dosHeader->e_magic == IMAGE_DOS_SIGNATURE);

    auto ntHeader = reinterpret_cast<PIMAGE_NT_HEADERS>(
        reinterpret_cast<BYTE*>(ntdll) + reinterpret_cast<PIMAGE_DOS_HEADER>(ntdll)->e_lfanew);

    auto exports = reinterpret_cast<PIMAGE_EXPORT_DIRECTORY>((BYTE*)ntdll + ntHeader->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);
    assert(exports->AddressOfNames != 0);

    auto addr = reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfFunctions));
    auto name = reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfNames));
    auto ord = reinterpret_cast<PWORD>((reinterpret_cast<LPBYTE>(ntdll) + exports->AddressOfNameOrdinals));

    using json = nlohmann::json;

    json syscalldump;

    for (uint64_t i = 0; i < exports->AddressOfFunctions; i++) {
        std::string funcname;
        try {
            // break on access violation
            funcname = (char*)ntdll + name[i];
        }
        catch (...) {
            std::cout << "end of exports" << std::endl;
            break;
        }
        
        if (funcname.rfind("Nt", 0) == 0) {
            PVOID funcaddr = reinterpret_cast<PVOID>(
                reinterpret_cast<LPBYTE>(ntdll) + addr[ord[i]]);

            if (!funcaddr)
                continue;
            auto offset = (uint64_t)funcaddr - ntHeader->OptionalHeader.ImageBase;
            syscalldump.emplace(funcname, (uint64_t)funcaddr);
            std::cout << "syscall: " << funcname << "offset: " << std::hex << offset << std::endl;
        }
    }


    return 0;
}

void printSyscall(std::string syscallname, uint64_t syscalloffset) {
    std::cout << "syscall: " << syscallname << "offset: " << syscalloffset << std::endl;
    std::cout.flush();
}

void usage()
{
    const char* banner =
        "\nUsage: SycallDumper.exe           \n"
        "\tntdll must be in the current dir\n\n";

    printf(banner);
}