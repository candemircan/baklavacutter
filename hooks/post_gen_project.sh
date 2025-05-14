#!/bin/bash

git init
uv venv -p python{{cookiecutter.python_version}}
source .venv/bin/activate
uv pip install -e '.[dev]'
uv pip install --no-build-isolation '.[linux]'

pre-commit install
pre-commit run --all-files

# add example* to .gitignore
echo "example*" >> .gitignore

