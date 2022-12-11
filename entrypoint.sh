#!/bin/sh -l

echo "parsing inputs"


echo "Hello $1"
echo "your classroom is $2"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT

curl -O https://detect.synopsys.com/detect8.sh

chmod u+x detect8.sh
./detect8.sh -h

echo "$(ls -la)"
