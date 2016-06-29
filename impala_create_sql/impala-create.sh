#"!/bin/bash

pre="\/user\/tescomm"
projectname=$1
if [ "$projectname" == "" ]; then
	read -p "请输入项目名称(即impala数据库名称): " projectname
fi

hdfs dfs -mkdir -p ${pre//\\/}/npno/$projectname
sudo -u hdfs hdfs dfs -chmod -R 777 ${pre//\\/}/npno/$projectname

sed -e 's/\$dbname/'"$projectname"'/g;s/\$projectname/'"$projectname"'/g;s/\$pre/'"$pre"'/g' template.sql > tmp.sql
impala-shell -f tmp.sql
rm -rf tmp.sql

