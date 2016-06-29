#!/bin/bash
## 读取properties配置文件
getProp()
{
	cat $prop | awk -F= '/'"$1"'/{print $2}'
}


## 同步数据 从mysql到redis
syncRedis()
{
	isdelete=`getProp isdelete`
	if [ "$isdelete" == "1" ]; then 
		/usr/local/redis/redis-cli -h $redisIp -p $redisPort del $1
	fi
	mysql $mysqlDatabase -h$mysqlIp -u$mysqlUsername -p$mysqlPassword -N -r --default-character-set=utf8 < $1.sql  | /usr/local/redis/redis-cli -h $redisIp -p $redisPort --pipe
}

#syncRedis $1

## 读取所有需要初始化的表
init() 
{
	prop=$1
	if [ "$prop" == "" ]; then
		read -p "请输入properties配置文件： " prop
	fi
	if [ ! -f "$prop" ]; then 
		echo $prop 'does not exists!'
		exit
	fi

	redisIp=`getProp redis.ip`
	redisPort=`getProp redis.port`
	mysqlIp=`getProp mysql.ip`
	mysqlPort=`getProp mysql.port`
	mysqlUsername=`getProp mysql.username`
	mysqlPassword=`getProp mysql.password`
	mysqlDatabase=`getProp mysql.database`
	initTables=`getProp init.tables`

	if [ "$#" == "2" ]; then
		initTables=$2
	fi

	if [ "$initTables" != "" ]; then
		arr=${initTables//,/ }
		for table in $arr
		do
			echo $table
			syncRedis $table
			echo '--------------------------------------'
		done
	else
		echo 'init.tables is null!'
	fi
}

init $@

