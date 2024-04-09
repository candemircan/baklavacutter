#!/bin/bash

git init
pip install -e .

pre-commit install
pre-commit run --all-files
