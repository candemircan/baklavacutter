#!/bin/bash

set -e

for file in "$@"; do
    if [[ "$file" != {{cookiecutter.directory_name}}/*.py ]]; then
        continue 
    fi
    module_base=$(echo "$file" | sed -E 's/^{{cookiecutter.directory_name}}\/(.*)\.py$/\1/')
    module_name="{{cookiecutter.directory_name}}.${module_base}"
    uv run -m "$module_name"
done
