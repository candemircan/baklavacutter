#!/bin/bash

# Check if uv is installed
if command -v uv >/dev/null 2>&1; then
    echo "uv is already installed."
    exit 0
fi

# If uv is not installed, try to install it
if command -v curl >/dev/null 2>&1; then
    echo "installing uv using curl..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
elif command -v wget >/dev/null 2>&1; then
    echo "installing uv using wget..."
    wget -qO- https://astral.sh/uv/install.sh | sh
else
    echo "error: neither curl nor wget is installed. please install one to continue or install uv yourself before using this template." >&2
    exit 1
fi