#!/bin/bash
#author: stanhe
#usage: 批量重命名文件
INPUT=(`ls`)
for i in "${!INPUT[@]}"
do
    mv ${INPUT[i]} "${1}${i}"
done
