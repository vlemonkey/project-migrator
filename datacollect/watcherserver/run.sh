#!/bin/bash

prop=$1
if [ "$prop" == "" ]; then
        read -p "请输入properties配置文件： " prop
fi
if [ ! -f "$prop" ]; then
        echo $prop 'does not exists!'
        exit
fi

## 读取properties配置文件
getProp()
{
        cat $prop | awk -F= '/'"$1"'/{print $2}'
}

ip=`getProp ip`
port=`getProp port`
namespace=`getProp namespace`

# 执行命令的方法
function opera(){
        nohup java -Xms128m -Xmx512m -server -Dname=$2 -cp $(getLibs) $1 $ip $port $namespace > $2.log 2>&1 &
}

#获取所有jar包
getLibs() {
        libs=.
        for file in `ls ./lib`
            do
                libs=$libs:lib/$file
            done
        echo $libs
}

# 获取当前路径，作为watcher的name，以及log文件名称
getServerName() {
        path=`pwd`
        bname_tmp=${path//\//\~}
        bname=${bname_tmp#\~}
        echo $bname
}

opera com.tescomm.datacollect.filewatcher.WatcherServer $(getServerName)


# zk.properties
#ip=10.95.3.136,10.95.3.138,10.95.3.139
#port=2181
#namespace=viki/datacollect
