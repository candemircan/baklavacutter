#!/bin/bash

cd "${0%/*}/.."
pip install -e .[dev]

pre-commit install
pre-commit run --all-files