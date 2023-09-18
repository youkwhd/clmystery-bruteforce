#!/bin/bash

people_file="people"
encoded_file="encoded"

while read line; do
    person=$(echo ${line} | cut -d " " -f1,2)
    hash=$(echo "${person}" | md5sum)

    echo "TRYING: ${person} :: ${hash}"
    grep -q "${hash}" "${encoded_file}" && echo "FOUND: ${person} :: ${hash}" && [[ "$1" == "-a" ]] && exit 0
done < "${people_file}"
