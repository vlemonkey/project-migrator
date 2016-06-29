copy-project.sh
	
用    途：	根据npnotemplate模板，创建新项目的oozie流程
限定条件：	需要在集群hdfs节点上执行 -- 例如公司测试集群中的10.95.3.136节点
手动修改：	修改 npnotemplate/config-default.xml 中相关信息
运    行：	./copy-project.sh npnoxxx


replace-time.sh

用    途：	补数据流程，修改job.properties里面的时间，运行指定日期的oozie流程
限定条件：	需要在集群oozie节点上执行 -- 例如公司测试集群中的10.95.3.136节点
手动修改：	无
运    行：	./replace-time.sh npnoxxx 20160604
