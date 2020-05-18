#!/bin/bash
#author : stanhe
#usage : my cd cmd
# mcd_path is a file like this:
# 1 "..path1"
# 2 "..path2"
# 3 "..path3"

MCD_PATH="C:/Users/`whoami`/tools/.mcd_path"
arr=()
if [ -e $MCD_PATH ];then
echo -e "===> list custom path : $MCD_PATH"
cat $MCD_PATH
echo -e "\n===> how to use? \n \".1\" to use dir 1 \n \"mcdt\" to change to today's test dir! \n \"start .\" to open current dir!"
mapfile -t arr < $MCD_PATH # file lines to array
for i in ${!arr[@]}
do
    strArray=(${arr[i]}) #string to stringArray
    alias ".${strArray[0]}"="cd ${strArray[1]}"
done
fi
