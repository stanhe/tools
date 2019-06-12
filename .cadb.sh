#!/bin/bash
#author : stanhe
#usage : 直接使用adb连接 访问了当前设备热点的安卓设备

set_connect(){
    INPUT=(`arp -a`)
    INDEX=0
    PREFIX=192.168.137.
    LOCAL=192.168.137.255

    for i in "${!INPUT[@]}"
    do
	CURRENT=${INPUT[i]}
	if [[ $CURRENT =~ $PREFIX([2-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-4]) && $CURRENT != $LOCAL ]];then
	    CONNECT=$CURRENT
	    break
	fi
    done
}
if [ $1 ];
then
    CONNECT=192.168.137.$1
else
    set_connect
fi
echo " ===> start connect : $CONNECT"
adb connect $CONNECT
