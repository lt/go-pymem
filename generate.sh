#!/bin/sh
# Generate all Go packages from CPython headers using h2go.
#
# Usage: ./generate.sh [target...]
#   With no arguments, generates all targets.
#   With arguments, generates only the named targets.
set -euo pipefail

BIN="go tool h2go"

run_version() {
  local tag="$1"
  local pkg="$2"
  echo "Generating $tag..."
  $BIN -config h2go.json "${pkg}-linux64" "${pkg}-windows64"
}

if [ $# -gt 0 ]; then
  $BIN -config h2go.json "$@"
  exit 0
fi

run_version v2.7.18  py27
run_version v3.0.1   py30
run_version v3.1.5   py31
run_version v3.2.6   py32
run_version v3.3.7   py33
run_version v3.4.10  py34
run_version v3.5.10  py35
run_version v3.6.15  py36
run_version v3.7.17  py37
run_version v3.8.20  py38
run_version v3.9.25  py39
run_version v3.10.20 py310
run_version v3.11.15 py311
run_version v3.12.13 py312
run_version v3.13.13 py313
run_version v3.14.5  py314

echo "Done."
