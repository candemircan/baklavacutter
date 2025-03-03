#!/bin/bash

git init
uv venv .{{cookiecutter.directory_name}} -p python3.12
source .{{cookiecutter.directory_name}}/bin/activate
uv pip install -e .

pre-commit install
pre-commit run --all-files
