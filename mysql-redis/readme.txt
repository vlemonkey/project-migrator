run.sh
	
用    途：	从mysql同步基础表数据到redis
限定条件：	需要在集群mysql-client, redis节点上执行 -- 例如公司测试集群中的10.95.3.138节点
手动修改：	修改npno.properties中相关信息，也可新建一个npnoxxx.properties
运    行：	./run.sh npno.properties
