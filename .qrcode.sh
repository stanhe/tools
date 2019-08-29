#!/bin/bash
#author : stanhe
#usage : 生产二维码
echo $1 |curl -F-=\<- qrenco.de
