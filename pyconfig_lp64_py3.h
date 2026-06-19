/* pyconfig.h for CPython 3.x x86-64 Linux.
 * Contains only defines that affect struct layout.
 */
#ifndef Py_PYCONFIG_H
#define Py_PYCONFIG_H

/* primitive sizes */
#define SIZEOF_VOID_P           8
#define SIZEOF_SIZE_T           8
#define SIZEOF_LONG             8
#define SIZEOF_INT              4
#define SIZEOF_SHORT            2
#define SIZEOF_LONG_LONG        8
#define SIZEOF_WCHAR_T          4

/* stdint */
#define HAVE_STDINT_H           1
#define HAVE_INTTYPES_H         1
#define HAVE_UINT32_T           1
#define HAVE_UINT64_T           1
#define HAVE_INT32_T            1
#define HAVE_INT64_T            1
#define HAVE_LONG_LONG          1
#define PY_LONG_LONG            long long
#define PY_FORMAT_LONG_LONG     "ll"

/* unicode - py3.0-3.2 require explicit Py_UNICODE_SIZE; py3.3+ redefine it
 * from SIZEOF_WCHAR_T above (harmless, suppressed by -Wno-macro-redefined). */
#define Py_UNICODE_SIZE         4

/* threading - _POSIX_THREADS satisfies pythread.h's native TSS check */
#define _POSIX_THREADS
#define HAVE_PTHREAD_H          1
#define SIZEOF_PTHREAD_T        8
#define SIZEOF_PTHREAD_KEY_T    4

/* HAVE_DLOPEN gates the dlopenflags field in PyInterpreterState */
#define HAVE_DLOPEN             1

#endif /* Py_PYCONFIG_H */
