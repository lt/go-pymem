# go-pymem

Go packages mirroring CPython's struct layouts exactly, for use when analysing
core dumps or process image snapshots.

One package per ABI/Python version. Each type carries its true C name, source
location, and per-field byte-offset annotations:

```go
// PyDictObject mirrors the C struct _dictobject (size 248; dictobject.h:69).
type PyDictObject struct {
	PyObjectHEAD                // +0
	MaFill       int64          // +16 Py_ssize_t ma_fill
	MaUsed       int64          // +24 Py_ssize_t ma_used
    // ...
	MaSmalltable [8]PyDictEntry // +56 PyDictEntry[8] ma_smalltable
}
```

Union types are backed by a `[N]byte` array with accessor methods.

## Installation

Each package is an independent Go module. Import only the one you need.

```bash
go get github.com/lt/go-py-/linux64/py312@latest
```

## Regenerating

The packages are generated from CPython headers by [h2go](https://github.com/lt/h2go).

Regeneration requires:
* clang (libclang)
* mingw-w64-headers (for windows64 ABI)
* cpython sources (`./clone.sh`)

Fetch the CPython headers (one shallow clone per tag):

```bash
./clone.sh
```

Regenerate all packages:

```bash
./generate.sh
```

Regenerate a single target:

```bash
./generate.sh py312-linux64
```
