# project-migrator

假设：
cloud138符合以下条件：
1. hdfs节点
2. impala节点
3. mysql-client
4. redis-client

则，可以依次执行如下脚本
cd impala_create_sql && ./impala-create.sh && cd ../mysql-redis && ./run.sh npno.properties && cd ../oozie/copy-project.sh
