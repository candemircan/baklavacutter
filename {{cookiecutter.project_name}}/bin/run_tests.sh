#!/bin/bash

set -e

for file in "$@"; do
    if [[ "$file" != {{cookiecutter.project_name}}/*.py ]]; then
        continue 
    fi
    module_base=$(echo "$file" | sed -E 's/^{{cookiecutter.project_name}}\/(.*)\.py$/\1/')
    module_name="{{cookiecutter.project_name}}.${module_base}"
    uv run -m "$module_name"
done
