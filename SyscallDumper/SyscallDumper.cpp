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
boolean is_syscall(LPCVOID pFunction);

// Entry point
int main() {
    HANDLE mod_ntdll = LoadLibraryExA(
        "C:\\Windows\\System32\\ntdll.dll", NULL, LOAD_LIBRARY_AS_DATAFILE);
    if (!mod_ntdll || mod_ntdll == INVALID_HANDLE_VALUE)
        return GetLastError();

    auto ntdll_base = reinterpret_cast<PBYTE>(mod_ntdll);
    auto dos_header = reinterpret_cast<PIMAGE_DOS_HEADER>(ntdll_base);
    if (dos_header->e_magic != IMAGE_DOS_SIGNATURE)
        return ERROR_INVALID_EXE_SIGNATURE;

    auto nt_header = reinterpret_cast<PIMAGE_NT_HEADERS>(
        ntdll_base + dos_header->e_lfanew);
    if (nt_header->Signature != IMAGE_NT_SIGNATURE)
        return ERROR_INVALID_EXE_SIGNATURE;

    auto export_dir = reinterpret_cast<PIMAGE_EXPORT_DIRECTORY>(
        ntdll_base + nt_header->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);
    if (export_dir->NumberOfFunctions == 0)
        ERROR_INVALID_DLL;

    auto address_of_func = 
        reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(ntdll_base) + export_dir->AddressOfFunctions));
    auto address_of_name = 
        reinterpret_cast<PDWORD>((reinterpret_cast<LPBYTE>(ntdll_base) + export_dir->AddressOfNames));
    auto address_of_ord = 
        reinterpret_cast<PWORD>((reinterpret_cast<LPBYTE>(ntdll_base) + export_dir->AddressOfNameOrdinals));

    // Print column headers
    std::cout << std::left
        << std::setw(10) << "ordinal"
        << std::setw(10) << "RVA"
        << std::setw(10) << "number"
        << "name\n" << std::endl;

    for (uint64_t i = 0; i < export_dir->NumberOfFunctions; i++) {
        // Get the pointer to the function
        auto current_function = (PVOID)(
            ntdll_base + address_of_func[address_of_ord[i]]);
            
        // Identify "Nt" family functions
        if (is_syscall(current_function)) {           
            // Calculate its RVA
            DWORD rva = (DWORD)current_function - nt_header->OptionalHeader.ImageBase;
            auto function_name = (char*)(ntdll_base + address_of_name[i]);
            
            // Retrieve the syscall code number from the raw bytes
            auto function_data = *(uintptr_t*)current_function;
            auto syscall_num = (function_data >> 8 * 4);
            syscall_num = syscall_num & 0xfff;
                                           
            // Print the function's information
            std::cout << std::left
                << std::setw(10) << std::dec << i
                << std::setw(10) << std::hex << rva
                << std::setw(10) << std::hex << syscall_num
                << function_name << std::endl;            
        }
    }
    
    return ERROR_SUCCESS;
}


// Check the first four bytes of the function for operations indicating a syscall
boolean is_syscall(LPCVOID function_ptr) {
    unsigned char* byte_ptr = (unsigned char*)function_ptr;

    if (byte_ptr[0] == 0x4C &&
        byte_ptr[1] == 0x8B &&
        byte_ptr[2] == 0xD1 &&

        byte_ptr[3] == 0xB8) return true;

    return false;
}