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

echo "github.workspace ${{ github.workspace }}"
echo ls -la .


echo "$(java --version)"
echo "$(docker ps)"
echo "$(docker run hello-world)"

echo $@
/./testing.sh $@
# /./detect.sh $@
