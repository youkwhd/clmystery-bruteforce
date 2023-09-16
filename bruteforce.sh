#!/bin/bash

while read line; do
    person=$(echo ${line} | cut -d " " -f1,2)
    hash=$(echo "${person}" | md5sum)

    echo "TRYING: ${person} :: ${hash}"
    grep -q "${hash}" "encoded" && echo "FOUND: ${person}" && [[ "$1" == "-a" ]] && exit 0
done < "people"
