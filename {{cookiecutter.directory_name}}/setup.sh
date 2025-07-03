#!/bin/bash

# Check if uv is available
if command -v uv &> /dev/null; then
    echo "Using uv for environment setup"
    CREATE_VENV="uv venv -p {{cookiecutter.python_version}}"
    INSTALL_PIP="uv pip install"
    export UV_TORCH_BACKEND=auto
else
    echo "uv not found, falling back to venv and pip"
    CREATE_VENV="python{{cookiecutter.python_version}} -m venv"
    INSTALL_PIP="pip install"
fi

# Check if --disposable flag is provided
if [[ "$1" == "--disposable" ]]; then
    export TMPDIR=/localscratch/
    cd /localscratch/
    $CREATE_VENV .{{cookiecutter.directory_name}}
    source .{{cookiecutter.directory_name}}/bin/activate
    cd /lustre/groups/hcai/workspace/can.demircan/{{cookiecutter.directory_name}}
else
    $CREATE_VENV .venv
    source .venv/bin/activate
fi

$INSTALL_PIP -e '.[dev]'
$INSTALL_PIP --no-build-isolation '.[linux]'
pre-commit install
pre-commit run --all-files

# add example* to .gitignore
echo "example*" >> .gitignore

