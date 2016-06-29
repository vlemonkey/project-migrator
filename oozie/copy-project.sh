#/bin/sh

projectName=$1
if [ "$projectName" == "" ]; then
	read -p "请输入项目名称: " projectName
fi
shortName=${projectName/npno/}
echo -e "项目名称为：$projectName\t简称为：$shortName"

echo
echo "--------------------------------------------------"
echo "拷贝项目中......"
cp -r npnotemplate $projectName
echo "拷贝完成！"
echo "--------------------------------------------------"

echo
echo "--------------------------------------------------"
echo "替换配置信息中......"
find . -name "*.xml" -or -name "*.properties" | xargs sed -i "s/\${projectName}/$projectName/g;s/\${shortName}/$shortName/g"
for F in manual/antEmulation/ manual/antfault/ manual/antpegging/ manual/outdoorinfil/ npnoday/ npnomon/ wireauto/ 
do 
	cp $projectName/config-default.xml $projectName/$F
done
echo "替换配置信息完成！"
echo "--------------------------------------------------"

echo
echo "--------------------------------------------------"
echo "上传至hdfs npno/$projectName/ 中......"
hdfs dfs -put -f $projectName  npno/
echo "上传至hdfs完成！"
echo "--------------------------------------------------"
