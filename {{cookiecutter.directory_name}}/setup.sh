#!/bin/bash

# Check if uv is installed
if command -v uv >/dev/null 2>&1; then
    echo "uv is already installed."

# If uv is not installed, try to install it
elif command -v curl >/dev/null 2>&1; then
    echo "installing uv using curl..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
elif command -v wget >/dev/null 2>&1; then
    echo "installing uv using wget..."
    wget -qO- https://astral.sh/uv/install.sh | sh
else
    echo "error: neither curl nor wget is installed. please install one to continue or install uv yourself before carrying on" >&2
    exit 1
fi


export UV_TORCH_BACKEND=auto
uv venv -p {{cookiecutter.python_version}}
source .venv/bin/activate
uv sync --all-extras
pre-commit install
pre-commit run --all-files


echo -e "\nexample*" >> .gitignore