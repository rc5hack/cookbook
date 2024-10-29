#!/usr/bin/env bash
set -euo pipefail

for SOURCE_FILE in *.tar.gz; do
    if [[ -f "$SOURCE_FILE" ]]; then
        echo "Processing file: $SOURCE_FILE"
        local TARGET_FILE="${SOURCE_FILE%.tar.gz}.tar.bz2"
        gunzip < "$SOURCE_FILE" | lbzip2 > "$TARGET_FILE"
        touch -r "$SOURCE_FILE" "$TARGET_FILE"
        lbzip2 -t "$TARGET_FILE"
        echo "Re-packed to: $TARGET_FILE"
        rm -v -- "$SOURCE_FILE"
    else
        echo "No .tar.gz files to process."
    fi
done
