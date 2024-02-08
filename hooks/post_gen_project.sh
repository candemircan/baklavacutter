#!/bin/bash

cd {{cookiecutter.directory_name}}
pip install -e .[dev]

pre-commit install
pre-commit run --all-files