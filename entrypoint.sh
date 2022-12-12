#!/bin/sh -l

# fail script if error
set -eo pipefail

echo "parsing inputs"


echo "Hello $1"
echo "your classroom is $2"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT

echo "ls -la $(ls -la)"
echo "ls -la / $(ls -la /)"
echo "pwd $(pwd)"
echo "whoami $(whoami)"

echo "$(java --version)"
echo "$(docker ps)"

echo $@
/./testing.sh $@
# /./detect.sh $@
