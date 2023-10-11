#include <windows.h>
#include <iostream>
#include <iomanip>
#include <cstdint>
#include <vector>
#include <optional>


// Define a type alias for clearer code
using OptByte = std::optional<uint8_t>;

bool match_pattern(const std::vector<uint8_t>& data, const std::vector<OptByte>& pattern, size_t start_offset = 0) {
    if (pattern.empty() || data.size() < pattern.size() + start_offset) {
        return -1;
    }

    for (size_t i = start_offset; i <= data.size() - pattern.size(); ++i) {
        bool match = true;
        for (size_t j = 0; j < pattern.size(); ++j) {
            if (pattern[j] && data[i + j] != *pattern[j]) {
                match = false;
                break;
            }
        }
        if (match) {
            return true;
        }
    }
    return false;
}

// Check if the function is a syscall based on its first 4 bytes
bool is_syscall(const void* function_ptr) {
    std::vector<OptByte> syscall_sig = {
        0x4c, 0x8b, 0xd1, 0xb8, std::nullopt, std::nullopt,
        std::nullopt, std::nullopt, 0xf6, std::nullopt, std::nullopt,
        std::nullopt, std::nullopt, std::nullopt, std::nullopt, 0x01,
        0x75, std::nullopt, 0x0f, 0x05
    };

    const auto* function_bytes = static_cast<const uint8_t*>(function_ptr);
    std::vector<uint8_t> function_vec(function_bytes, function_bytes + syscall_sig.size());

    return match_pattern(function_vec, syscall_sig, 0);
}

// Load ntdll.dll and return its handle
HMODULE load_ntdll() {
    return LoadLibraryExA("C:\\Windows\\System32\\ntdll.dll", nullptr, LOAD_LIBRARY_AS_DATAFILE);
}

// Validate the DOS and NT headers of the DLL
bool validate_headers(const uint8_t* ntdll_base) {
    auto dos_header = reinterpret_cast<const IMAGE_DOS_HEADER*>(ntdll_base);
    if (dos_header->e_magic != IMAGE_DOS_SIGNATURE) {
        return false;
    }

    auto nt_header = reinterpret_cast<const IMAGE_NT_HEADERS*>(ntdll_base + dos_header->e_lfanew);
    return nt_header->Signature == IMAGE_NT_SIGNATURE;
}

// Print the syscall information
void print_syscall_info(const uint8_t* ntdll_base, const IMAGE_EXPORT_DIRECTORY* export_dir) {
    auto address_of_func = reinterpret_cast<const std::uint32_t*>(ntdll_base + export_dir->AddressOfFunctions);
    auto address_of_name = reinterpret_cast<const std::uint32_t*>(ntdll_base + export_dir->AddressOfNames);
    auto address_of_ord = reinterpret_cast<const std::uint16_t*>(ntdll_base + export_dir->AddressOfNameOrdinals);

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

            // Use std::string for safer string operations
            std::string function_name_str(function_name);

            // Skip functions that start with "Zw"
            if (function_name_str.substr(0, 2) != "Nt") {
                continue;
            }

            auto function_data = *reinterpret_cast<const std::uintptr_t*>(current_function);
            auto syscall_num = (function_data >> (8 * 4)) & 0xfff;

            std::cout << std::left
                << std::setw(10) << std::dec << i
                << std::setw(10) << std::hex << rva
                << std::setw(10) << syscall_num
                << function_name << std::endl;
        }
    }
}

int main() {
    // Load ntdll.dll
    auto mod_ntdll = load_ntdll();
    if (mod_ntdll == nullptr || mod_ntdll == INVALID_HANDLE_VALUE) {
        return GetLastError();
    }

    // Validate headers
    auto ntdll_base = reinterpret_cast<const uint8_t*>(mod_ntdll);
    if (!validate_headers(ntdll_base)) {
        return ERROR_INVALID_EXE_SIGNATURE;
    }

    // Get export directory
    auto dos_header = reinterpret_cast<const IMAGE_DOS_HEADER*>(ntdll_base);
    auto nt_header = reinterpret_cast<const IMAGE_NT_HEADERS*>(ntdll_base + dos_header->e_lfanew);
    auto export_dir = reinterpret_cast<const IMAGE_EXPORT_DIRECTORY*>(
        ntdll_base + nt_header->OptionalHeader.DataDirectory[IMAGE_DIRECTORY_ENTRY_EXPORT].VirtualAddress);

    // Validate export directory
    if (export_dir->NumberOfFunctions == 0) {
        return ERROR_INVALID_DLL;
    }

    // Print syscall information
    print_syscall_info(ntdll_base, export_dir);

    return ERROR_SUCCESS;
}
