#!python
# -*- coding: utf-8 -*-
#author : stanhe

import sys
import sqlite3

if len(sys.argv)<2:
    print('请输入参数---> 数据库名称！')
    sys.exit()

dbName=sys.argv[1]

def runDb(name,arg):
    try:
        conn = sqlite3.connect(name)
        cursor = conn.cursor()
        cursor.execute(arg)
        value = cursor.fetchall()
        cursor.close()
        return value
    except :
        print("指令异常！\n")

def showTb(name):
    try:
        conn = sqlite3.connect(name)
        cursor = conn.cursor()
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
        value = cursor.fetchall()
        cursor.close()
        return value
    except :
        print("获取tables异常！\n")
    
while 1:
    cmd = input("\n===> 数据库指令: \n")
    if cmd == 'q':
        sys.exit()
    elif (cmd == 'tab' or cmd == '.tables' or cmd == '.tab'):
        result=showTb(dbName)
        if result!=None:
            table="Tables===>: \n"
            for i in range(len(result)):
                j = i+1
                if (j%4 == 0):
                    info="{} \n".format(result[i][0])
                    info.strip()
                    info=f'{info:>30}'
                else:
                    info="{} ".format(result[i][0])
                    info.strip()
                    info=f'{info:>30}|'
                table+=info
            print(table,"\n")
    elif cmd.startswith('info'):
        try:
            cmd = "Pragma table_info({})".format(cmd.split()[1])
            result=runDb(dbName,cmd)
            if result!=None:
                table="表字段===>: \n"
                for i in range(len(result)):
                    j = i+1
                    if (j%4 == 0):
                        info = "{}({}) \n".format(result[i][1],result[i][2])
                        info.strip()
                        info=f'{info:>30}'
                    else:
                        info = "{}({}) ".format(result[i][1],result[i][2])
                        info.strip()
                        info=f'{info:>30}|'
                    table.strip()
                    table+=info
                print(table,"\n")
        except IndexError:
            print("Index Error!")
    else:
        result=runDb(dbName,cmd)
        if result!=None:
            print(result,"\n")
