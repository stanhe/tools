#!/bin/bash
#author: stanhe
#usage: adb ���������浽��ǰ�ļ�����


if [ -z "$1" ];then
   echo "�������--> ���ݿ����ƣ�"
   exit 0
fi

db="$1"

function runCmd(){
dbBack=`sqlite3 "$db" <<EOF 
$1 
EOF`
}

while :
do
    echo -e "\n���������ݿ����ָ�\n"
    read cmd
    case $cmd in
	eof|EOF|q|exit)
	    echo -e "\n�˳���\n"
	break
	;;
	*)
	    runCmd "$cmd"
	    echo -e "\nָ���======> \n$dbBack\n"
	;;
    esac
done
