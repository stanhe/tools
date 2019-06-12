#!python
# -*- coding: utf-8 -*-
#author : stanhe
#usage : 拉去指定包名下的数据库到桌面
import os
import sys
import getpass

desk_path = "c:/Users/"+getpass.getuser()+"/Desktop/"

def runADBSu(code):
    exec_db_string = "adb shell su -c \'"+code+"\'"
    os.system(exec_db_string)

def getDB(path,fileName):
    runADBSu("rm -rf mnt/sdcard/temp_dbs")
    os.system("rm -rf "+fileName)
    runADBSu("cp -rf data/data/%s"%(path)+"/database mnt/sdcard/temp_dbs")
    print(fileName)
    os.system("adb pull mnt/sdcard/temp_dbs "+fileName)

if len(sys.argv)<3:
    print("Input args with package and dbName!")
else:
    getDB(sys.argv[1],desk_path+sys.argv[2])

