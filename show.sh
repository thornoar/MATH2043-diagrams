#!/usr/bin/env bash

for num in $(seq -w 25); do
    for file in ./slide-$num/*.pdf; do
        if [ "$(basename $file)" != "lecture.pdf" ]; then
            zathura "$file" &
        fi
    done
done
