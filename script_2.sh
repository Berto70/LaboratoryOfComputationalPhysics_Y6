#!/bin/bash

mkdir ./bash/data

# 2.a
echo "2.a)"
grep -v '^#' ./test/data.csv | tr ',' ' ' > ./bash/data/data.txt
echo "File created"

cd ./bash/data

# 2.b
echo "2.b) even numbers count:"
awk '{for(i=1;i<=NF;i++) if($i % 2 == 0) count++} END{print count}' data.txt

# 2.c
echo "2.c) gt/lt 100*sqrt(3)/2:"
awk '{sqrt_sum=sqrt($1*$1 + $2*$2 + $3*$3); if(sqrt_sum > 100*sqrt(3)/2) count_greater++; else count_smaller++} END{print "Greater: " count_greater ", Smaller: " count_smaller}' data.txt

# 2.d
echo "2.d)"
n=$1

# checking if the user provided an input
if [ -z $1 ]
then
    echo "this script requires as input the name of the file to be created"
    exit
else 
    for ((i=1;i<=n;i++)); do
        awk -v i=$i '{for(j=1;j<=NF;j++) printf("%f ", $j/i); print ""}' data.txt > "data_$i.txt"
    done
fi

echo "Files created"
