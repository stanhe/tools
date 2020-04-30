#!/bin/bash
#author : stanhe
#usage : my cd cmd
# mcd_path is a file like this:
# 1 "..path1"
# 2 "..path2"
# 3 "..path3"

MCD_PATH="C:/Users/stan/Software/tools/.mcd_path"
if [ -z "$1" ];
then
    echo -e "===> list mcd_path :"
    cat $MCD_PATH
    echo -e "\n===> \"mcd 1\" to use dir 1, \"mcdr \" to change current dir!"
else
    CPATH=`awk '{if (NR=="'$1'") print $2}' $MCD_PATH`
    alias mcdr="cd $CPATH"
fi
