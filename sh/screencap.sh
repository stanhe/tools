#!/bin/bash
INDEX=`adb shell ls mnt/sdcard/screencaps |wc -l`
NAME="pic$INDEX.png"
echo $NAME
echo $PWD
`adb shell screencap -p mnt/sdcard/screencaps/$NAME`
`adb pull mnt/sdcard/screencaps/$NAME $PWD/$NAME`
