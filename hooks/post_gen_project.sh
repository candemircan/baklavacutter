#!/bin/bash

git init
pip install -e .[dev]

pre-commit install
pre-commit run --all-files