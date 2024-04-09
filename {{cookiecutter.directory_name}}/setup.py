from setuptools import setup, find_packages

setup(
    name="{{cookiecutter.directory_name}}",
    version="0.1",
    packages=find_packages(),
    install_requires=open("requirements.txt").readlines(),
)
