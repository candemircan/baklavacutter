#!/bin/bash

git init
uv pip install -e .

pre-commit install
pre-commit run --all-files
