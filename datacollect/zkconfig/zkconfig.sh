#!/bin/bash

# 判断防火墙是否关闭 
# 防火墙开启会导致zookeeper client执行命令报错
checkIptables() {
	count=`sudo service iptables status | grep -w Table | wc -l`
	if [ $count -gt 0 ]; then
		echo "防火墙未关闭，会导致zookeeper命令无法运行，是否关闭防火墙？"
		select ch in 关闭防火墙继续运行 退出;
		do
			break
		done
		if [ "$ch" == "关闭防火墙继续运行" ]; then
			sudo service iptables stop
			sudo chkconfig iptables off
		else
			exit 0
		fi
	fi
}

checkIptables

# 选择zookeeperclient版本
echo "请选择zookeeper-client版本："
select zk in `locate zkCli.sh`;
do
	break
done

# 在zookeeper里执行命令，将配置信息保存到zookeeper里
# 不同的项目需要修改以下配置信息
$zk -server localhost:2181 << EOF
create /desc ""
set /desc "zookeeper初始化命令"
create /bao ""
create /bao/datacollect ""
set /desc "监控的根目录，与files组成完整的路径"
create /bao/datacollect/watcher_path /tescomm_bao
set /desc "上传数据的目录,和desc_files成对出现."
create /bao/datacollect/watcher_files 25
set /desc "hdfs路径"
create /bao/datacollect/dest_path hdfs://10.95.3.138:8020/user/tescomm/bao
set /desc "上传的目录，与files成对出现"
create /bao/datacollect/dest_files 25
set /desc "目的目录文件夹分区　　０－不分区　　２４－天　　　６０－小时　５／１０／３０－＿分钟，　与dest_files成对出现"
create /bao/datacollect/dest_files_part  24
set /desc "文件备份路径"
create /bao/datacollect/back_path /tescomm_bao/back
set /desc "错误日志保存路径"
create /bao/datacollect/err_path  /tescomm_bao/err
set /desc "采集数据保存周期"
create /bao/datacollect/data_time  3
set /desc "采集程序异常处理策略"
create /bao/datacollect/tactics  0
set /desc "上传文件后缀"
create /bao/datacollect/suffix  .log
set /desc "效验文件后缀"
create /bao/datacollect/check_suffix  .ok
set /desc "对外提供ftp地址，如果是ftp集群提供vls地址或其他"
create /bao/datacollect/ftpip  127.0.0
quit
EOF
