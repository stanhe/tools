#!/bin/bash
#author: stanhe
#usage: adb 截屏并保存到当前文件夹下

INDEX=`adb shell ls mnt/sdcard/screencaps |wc -l`
NAME="pic$INDEX.png"
LOCAL_PATH="mnt/sdcard/screencaps/$NAME"
`adb shell screencap -p $LOCAL_PATH`
echo "screencap : $LOCAL_PATH"
`adb pull $LOCAL_PATH $PWD/$NAME`
