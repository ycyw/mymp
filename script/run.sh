#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "请在Root用户下运行安装该脚本" && exit 1
while true
do
    ps -ef | grep mymp | grep -v grep
    if [ "$?" -eq 1 ]
        then
        ./mymp
    fi
    sleep 5

done
