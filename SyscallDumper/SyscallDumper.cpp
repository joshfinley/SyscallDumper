#include <windows.h>
#include <iostream>
#include <iomanip>
#include <cstdint>

// Check if the function is a syscall based on its first 4 bytes
bool is_syscall(const void* function_ptr) {
    auto byte_ptr = static_cast<const unsigned char*>(function_ptr);

    return byte_ptr[0] == 0x4C &&
        byte_ptr[1] == 0x8B &&
        byte_ptr[2] == 0xD1 &&
        byte_ptr[3] == 0xB8;
}

int main() {
    auto mod_ntdll = LoadLibraryExA("C:\\Windows\\System32\\ntdll.dll", nullptr, LOAD_LIBRARY_AS_DATAFILE);

    if (mod_ntdll == nullptr || mod_ntdll == INVALID_HANDLE_VALUE) {
        return GetLastError();
    }

    auto ntdll_base = reinterpret_cast<const uint8_t*>(mod_ntdll);
    auto dos_header = reinterpret_cast<const IMAGE_DOS_HEADER*>(ntdll_base);

    if (dos_header->e_magic != IMAGE_DOS_SIGNATURE) {
        return ERROR_INVALID_EXE_SIGNATURE;
    }

    auto nt_header = reinterpret_cast<const IMAGE_NT_HEADERS*>(ntdll_base + dos_header->e_lfanew);

    if (nt_header->Signature != IMAGE_NT_SIGNATURE) {
        return ERROR_INVALID_EXE_SIGNATURE;
    }

    auto export_dir = reinterpret_cast<const IMAGE_EXPORT_DIRECTORY*>(
        ntdll_base + nt_header->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);

    if (export_dir->NumberOfFunctions == 0) {
        return ERROR_INVALID_DLL;
    }

    auto address_of_func = reinterpret_cast<const std::uint32_t*>(ntdll_base + export_dir->AddressOfFunctions);
    auto address_of_name = reinterpret_cast<const std::uint32_t*>(ntdll_base + export_dir->AddressOfNames);
    auto address_of_ord = reinterpret_cast<const std::uint16_t*>(ntdll_base + export_dir->AddressOfNameOrdinals);

    // Print column headers
    std::cout << std::left
        << std::setw(10) << "ordinal"
        << std::setw(10) << "RVA"
        << std::setw(10) << "number"
        << "name" << std::endl;

    for (std::uint64_t i = 0; i < export_dir->NumberOfFunctions; ++i) {
        auto current_function = reinterpret_cast<const void*>(ntdll_base + address_of_func[address_of_ord[i]]);

        if (is_syscall(current_function)) {
            std::uint32_t rva = static_cast<std::uint32_t>(reinterpret_cast<const uint8_t*>(current_function) - ntdll_base);
            auto function_name = reinterpret_cast<const char*>(ntdll_base + address_of_name[i]);

            auto function_data = *reinterpret_cast<const std::uintptr_t*>(current_function);
            auto syscall_num = (function_data >> (8 * 4)) & 0xfff;

            // Print the function's information
            std::cout << std::left
                << std::setw(10) << std::dec << i
                << std::setw(10) << std::hex << rva
                << std::setw(10) << syscall_num
                << function_name << std::endl;
        }
    }

    return ERROR_SUCCESS;
}
