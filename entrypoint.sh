#!/bin/sh -l

pip3 install poetry
python3 -m poetry config --list

echo $@
