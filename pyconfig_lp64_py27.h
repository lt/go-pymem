/* pyconfig.h for CPython 2.7.x x86-64 Linux.
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

/* stdint  */
#define HAVE_STDINT_H           1
#define HAVE_INTTYPES_H         1
#define HAVE_INT32_T            1
#define HAVE_INT64_T            1
#define HAVE_UINT32_T           1
#define HAVE_UINT64_T           1

/* unicode - gates PyUnicodeObject and PyUnicodeErrorObject */
#define Py_USING_UNICODE        1
#define Py_UNICODE_SIZE         2
#define PY_UNICODE_TYPE         unsigned short

/* threading */
#define HAVE_PTHREAD_H          1
#define SIZEOF_PTHREAD_T        8

/* HAVE_DLOPEN gates the dlopenflags field in PyInterpreterState */
#define HAVE_DLOPEN             1

#endif /* Py_PYCONFIG_H */
