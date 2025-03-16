#!/bin/bash
export TMPDIR=/localscratch/
cd /localscratch/
uv venv .{{cookiecutter.project_name}} -p python3.12
source .{{cookiecutter.project_name}}/bin/activate
uv pip install --upgrade pip
cd /lustre/groups/hcai/workspace/can.demircan/{{cookiecutter.project_name}}
uv pip install -e . --no-cache
pre-commit install
