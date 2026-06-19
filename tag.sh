#!/bin/sh
version="${1:?Usage: $0 <version>}"
for dir in {linux64,windows64}/py*; do
  if [ -d "$dir" ]; then
    tag="${dir}/${version}"
    echo "Tagging $tag"
    git tag "$tag"
  fi
done
