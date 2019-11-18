#!/bin/bash
#author: stanhe

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
	info*)
	    table=$(echo -e "$cmd"|awk '{print $2}')
	    runCmd "Pragma table_info($table)"
	    #count=$(echo -e "$dbBack"|wc -l)
	    echo -e "$dbBack"|awk -F '|' '{printf("%s(%s) ",$2,$3)}'|awk '{print}'
	;;
	q|exit)
	    echo -e "\n�˳���\n"
	break
	;;
	*)
	    runCmd "$cmd"
	    echo -e "\nָ���======> \n$dbBack\n"
	;;
    esac
done
