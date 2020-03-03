#!/bin/bash
#author: stanhe
#usage: adb shell kill ps

stop(){
    PKG=`adb shell ps|grep $1 | awk '{print $NF}'`
    if [ $PKG ];then
	echo "PKG is:$PKG"
       `adb shell am force-stop $PKG`
	echo "Pid of $1 is: $PID is Killed!"
    fi
    PID=`adb shell ps|grep $1 | awk '{print $2}'`
    if [ $PID ];then
	echo "Pid is:$PID"
	`adb shell kill  $PID`
	echo "PKG of $1 is: $PKG is Stoped!"
    fi
    echo "===> Finish <==="
}
if [ -z "$1" ];
then
   echo "请带参数--> 包名，或包名强识别标志！"
else
    stop $1
fi
