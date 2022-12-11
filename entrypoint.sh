#!/bin/sh -l

echo "parsing inputs"


echo "Hello $1"
echo "your classroom is $2"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT

echo "$(ls -la)"
echo "$(ls -la /)"
echo "$(pwd)"
echo "$(whoami)"

echo "$(java --version)"
echo "$(docker ps)"
