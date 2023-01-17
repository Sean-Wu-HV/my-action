#!/bin/sh -l

pip3 install poetry
python3 -m poetry config --list

echo $@

python3 -m poetry version -s $1
echo $(poetry version)
