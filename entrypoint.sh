#!/bin/sh -l

pip3 install poetry
python3 -m poetry config --list

# python3 -m poetry version -s $1

# echo $(poetry version)
