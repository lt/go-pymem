#!/bin/sh
# Initialise a minimal CPython checkout containing only Include/ and the PC/ pyconfig files needed
# for Windows targets. repoun once before generate.sh.
set -euo pipefail

repoEPO="$(cd "$(dirname "$0")" && pwd)"
CPYTHON="$repoEPO/cpython"

TAGS=(
  v2.7.18
  v3.0.1
  v3.1.5
  v3.2.6
  v3.3.7
  v3.4.10
  v3.5.10
  v3.6.15
  v3.7.17
  v3.8.20
  v3.9.25
  v3.10.20
  v3.11.15
  v3.12.13
  v3.13.13
  v3.14.5
)

for tag in "${TAGS[@]}"; do
  repo="cpython-$tag"
  if git -C "$repo" rev-parse "refs/tags/$tag" >/dev/null 2>&1; then
    echo "$repo already present"
  else
    if [ ! -d "$repo/.git" ]; then
      echo "Initialising sparse $repo repo..."
      git init "$repo"
      git -C "$repo" remote add origin https://github.com/python/cpython.git
      # Pattern mode (--no-cone) lets us mix a whole directory with specific files.
      git -C "$repo" sparse-checkout init --no-cone
      git -C "$repo" sparse-checkout set '/Include/' '/PC/pyconfig.h' '/PC/pyconfig.h.in'
    fi
    echo "Fetching $repo..."
    git -C "$repo" fetch --depth=1 --filter=blob:none origin "refs/tags/$tag:refs/tags/$tag"
    git -C "$repo" checkout "$tag"
  fi
done

echo "Done."
