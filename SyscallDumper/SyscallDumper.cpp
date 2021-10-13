/*
*    File:      SyscallDumper.cpp
*
*    Summary:   Given an ntdll.dll file in the local directory, dump the
*               names and RVAs of all exports
*
*    Origin:    Inspired by information security research dependence on 
*               j00ru's Syscall Tables
*
*    References:
*       https://resources.infosecinstitute.com/the-export-directory/
*       http://www.rohitab.com/discuss/topic/40594-parsing-pe-export-table/
*       https://j00ru.vexillium.org/syscalls/nt/64/
*       https://www.geoffchappell.com/studies/windows/win32/ntdll/index.htm
*       https://stackoverflow.com/questions/1128150/win32-api-to-enumerate-dll-export-functions
*
*/

#include <windows.h>
#include <iostream>
#include <iomanip>

// Function prototypes
BOOL IsSyscall(LPCVOID pFunction);

// Entry point
DWORD main() {
    HANDLE hDll = LoadLibraryExA(
        "C:\\Windows\\System32\\ntdll.dll", NULL, LOAD_LIBRARY_AS_DATAFILE);
    if (!hDll || hDll == INVALID_HANDLE_VALUE)
        return GetLastError();

    auto pModuleBase = reinterpret_cast<PBYTE>(hDll);
    auto pDosHeader = reinterpret_cast<PIMAGE_DOS_HEADER>(pModuleBase);
    if (pDosHeader->e_magic != IMAGE_DOS_SIGNATURE)
        return ERROR_INVALID_EXE_SIGNATURE;

    auto pNtHeader = reinterpret_cast<PIMAGE_NT_HEADERS>(
        pModuleBase + pDosHeader->e_lfanew);
    if (pNtHeader->Signature != IMAGE_NT_SIGNATURE)
        return ERROR_INVALID_EXE_SIGNATURE;

    auto pExportDir = reinterpret_cast<PIMAGE_EXPORT_DIRECTORY>(
        pModuleBase + pNtHeader->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);
    if (pExportDir->NumberOfFunctions == 0)
        ERROR_INVALID_DLL;

    auto pdwAddressOfFunc = 
        reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(pModuleBase) + pExportDir->AddressOfFunctions));
    auto pdwAddressOfName = 
        reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(pModuleBase) + pExportDir->AddressOfNames));
    auto pwAddressOfOrd = 
        reinterpret_cast<PWORD>((reinterpret_cast<LPBYTE>(pModuleBase) + pExportDir->AddressOfNameOrdinals));

    // Print column headers
    std::cout << std::left
        << std::setw(10) << "ordinal"
        << std::setw(10) << "RVA"
        << std::setw(10) << "number"
        << "name\n" << std::endl;

    for (uint64_t i = 0; i < pExportDir->NumberOfFunctions; i++) {
        // Get the pointer to the function
        auto pCurrentFunction = (PVOID)(
            pModuleBase + pdwAddressOfFunc[pwAddressOfOrd[i]]);
            
        // Identify "Nt" family functions
        if (IsSyscall(pCurrentFunction)) {           
            // Calculate its RVA
            DWORD dwRva = (DWORD)pCurrentFunction - pNtHeader->OptionalHeader.ImageBase;
            auto szFunctionName = (char*)(pModuleBase + pdwAddressOfName[i]);
            
            // Retrieve the syscall code number from the raw bytes
            auto pFunctionCode = *(uintptr_t*)pCurrentFunction;
            auto syscallNum = (pFunctionCode >> 8 * 4);
            syscallNum = syscallNum & 0xfff;
                                           
            // Print the function's information
            std::cout << std::left
                << std::setw(10) << std::dec << i
                << std::setw(10) << std::hex << dwRva
                << std::setw(10) << std::hex << syscallNum
                << szFunctionName << std::endl;            
        }
    }

    BOOL bStatus = FreeLibrary((HMODULE)hDll);
    if (!bStatus) 
        return GetLastError();
    
    return ERROR_SUCCESS;
}


// Check the first four bytes of the function for operations indicating a syscall
BOOL IsSyscall(LPCVOID pFunction) {
    LPCBYTE pBytePtr = (LPCBYTE)pFunction;

    if (pBytePtr[0] == 0x4C &&
        pBytePtr[1] == 0x8B &&
        pBytePtr[2] == 0xD1 &&
        pBytePtr[3] == 0xB8) return TRUE;

    return FALSE;
}