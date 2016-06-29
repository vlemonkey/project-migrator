#/bin/sh
#$1：项目名称,$2：数据时间:20160604
projectName=$1
pdate=$2
if [ "$projectName" == "" ]; then
	read -p "请输入项目名称： " projectName
fi

if [ "$pdate" == "" ]; then
	read -p "请输入日期，格式为yyyymmdd： "  pdate
fi

echo 
echo "--------------------------------------------------"
echo "开始替换......"
inDate=`date -d "$2" +%Y%m%d`
today=`date -d "1 days $inDate" +%Y%m%d`
lastMon=${inDate:0:6}
thisMon=`date -d "1 month $inDate" +%Y%m`
find $1 -name "job.properties" |xargs sed -r -i "s/(YESTERDAY|startDay)=.*$/\1=$2/g" 
find $1 -name "job.properties" |xargs sed -r -i "s/(TODAY|endDay)=.*$/\1=$today/g" 
find $1 -name "job.properties" |xargs sed -i "s/LASTMON=.*$/LASTMON=$lastMon/g" 
find $1 -name "job.properties" |xargs sed -i "s/THISMON=.*$/THISMON=$thisMon/g" 
echo "替换完成，工作愉快！"
echo "--------------------------------------------------"
