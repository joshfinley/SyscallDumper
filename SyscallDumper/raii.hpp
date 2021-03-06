#pragma once

#include <windows.h>

namespace raii {
	// RAII wrapper for HANDLE acquisitions and closing
	class Hmodule {
	public:
		Hmodule(HMODULE hIn) { hMod = hIn; }
		~Hmodule() { FreeLibrary(hMod); };

		HMODULE get() {
			return hMod;
		}

	private:
		HMODULE hMod;
	};
};