#!/bin/sh -l

echo "parsing inputs"


echo "Hello $1"
echo "your classroom is $2"
echo "gradle version: $(gradle -version)" 
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
