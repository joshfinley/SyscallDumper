#pragma once

#include <windows.h>
#include <iostream>
#include <vector>

#define MAX_SYSCALL_ORD 655

BOOL isSyscall(LPCVOID pFunction) {
    LPCBYTE lpBytePtr = (LPCBYTE)pFunction;

    if (lpBytePtr[0] == 0x4C && lpBytePtr[1] == 0x8B) return TRUE;

    return FALSE;
}