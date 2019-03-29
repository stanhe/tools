#!/bin/bash
INPUT=(`ls`)
for i in "${!INPUT[@]}"
do
    mv ${INPUT[i]} "${1}${i}"
done
