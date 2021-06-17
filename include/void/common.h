/**
 * @file common.h
 * @author tk-aria
 * @brief
 * @version 0.1
 * @date 2021-06-17
 *
 * @copyright Copyright (c) 2021
 *
 */
#pragma once
#ifndef VOID_COMMON_H
#define VOID_COMMON_H

#if defined(__cplusplus)
#define VOID_CXX
#else
#define VOID_C
#endif

#if defined(__cplusplus)

#define VOID_PUBLIC_API extern "C"
#define VOID_PUBLIC_API_BEGIN                                                                                                                                                                                                                                  \
    extern "C"                                                                                                                                                                                                                                                 \
    {
#define VOID_PUBLIC_API_END }

#else

#define VOID_PUBLIC_API
#define VOID_PUBLIC_API_BEGIN
#define VOID_PUBLIC_API_END

#endif // __cplusplus.

// __cdecl or __stdcall.
#ifndef VOID_CALL
#if defined(__CYGWIN32__)
#define VOID_CALL __stdcall
#elif defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(_WIN64) || defined(WINAPI_FAMILY)
#define VOID_CALL __stdcall
#elif defined(__MACH__) || defined(__ANDROID__) || defined(__linux__) || defined(LUMIN)
#define VOID_CALL
#else
#define VOID_CALL
#endif
#endif

#if defined(WIN32) || defined(_WIN32) || defined(__WIN32__) || defined(_WIN64) || defined(WINAPI_FAMILY)
#define VOID_NEWLINE "\r\n"
#else
#define VOID_NEWLINE "\n"
#endif

#endif // VOID_COMMON_H.
