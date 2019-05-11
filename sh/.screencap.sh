#!/bin/bash
#author: stanhe
#usage: adb 截屏并保存到当前文件夹下

createFolder(){
    FOLDER=`adb shell ls mnt/sdcard | grep screencaps`
    if [ ! $FOLDER ];
    then
	adb shell mkdir mnt/sdcard/screencaps
	echo "===> mkdir screencaps!"
    fi
}
startCap(){
    INDEX=`adb shell ls mnt/sdcard/screencaps |wc -l`
    NAME="pic$INDEX.png"
    LOCAL_PATH="mnt/sdcard/screencaps/$NAME"
    `adb shell screencap -p $LOCAL_PATH`
    echo "===> get : $LOCAL_PATH"
    $(adb pull $LOCAL_PATH $PWD/$NAME)
}

# check interval <200ms，screencaps take 1~2s,so check every time also acceptability

createFolder
startCap
