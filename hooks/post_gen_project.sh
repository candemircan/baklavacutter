#!/bin/bash

git init
uv venv .{{cookiecutter.directory_name}} -p python{{cookiecutter.python_version}}
source .{{cookiecutter.directory_name}}/bin/activate
uv pip install -e .[dev] --no-cache

pre-commit install
pre-commit run --all-files
