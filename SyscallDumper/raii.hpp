#pragma once

#include <windows.h>

namespace raii {
	// RAII wrapper for HANDLE acquisitions and closing
	class Handle {
	public:
		Handle(HANDLE hin) { handle = hin; }
		~Handle() { CloseHandle(handle); };

		HANDLE getHandle() {
			return handle;
		}

	private:
		HANDLE handle;
	};
	

	class Hmodule {
	public:
		Hmodule(HMODULE hin) { handle = hin; }
		~Hmodule() { FreeLibrary(handle); };

		HANDLE getHandle() {
			return handle;
		}

	private:
		HMODULE handle;
	};
};