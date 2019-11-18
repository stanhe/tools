#!/bin/bash
#author: stanhe

if [ -z "$1" ];then
   echo "请带参数--> 数据库名称！"
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
    echo -e "\n请输入数据库操作指令：\n"
    read cmd
    case $cmd in
	info*)
	    table=$(echo -e "$cmd"|awk '{print $2}')
	    runCmd "Pragma table_info($table)"
	    #count=$(echo -e "$dbBack"|wc -l)
	    echo -e "$dbBack"|awk -F '|' '{printf("%s(%s) ",$2,$3)}'|awk '{print}'
	;;
	q|exit)
	    echo -e "\n退出！\n"
	break
	;;
	*)
	    runCmd "$cmd"
	    echo -e "\n指令返回======> \n$dbBack\n"
	;;
    esac
done
