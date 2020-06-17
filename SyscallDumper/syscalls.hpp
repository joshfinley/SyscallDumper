#pragma once

#include <windows.h>

BOOL isSyscall(LPCVOID pFunction) {
    LPCBYTE lpBytePtr = (LPCBYTE)pFunction;

    if (lpBytePtr[0] == 0x4C && 
        lpBytePtr[1] == 0x8B &&
        lpBytePtr[2] == 0xD1 &&
        lpBytePtr[3] == 0xB8) return TRUE;

    return FALSE;
}
