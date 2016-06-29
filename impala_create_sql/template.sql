create database if not exists $dbname;
use $dbname;
--p_m_build_net_mr
drop table if exists p_m_build_net_mr;
create table p_m_build_net_mr(
stattime int,
ProvinceID int,
PROVINCENAME string,
cityID int,
CITYNAME string,
AreaID int,
AreaName string,
BuildingID string,
Cname string,
BuildingScene int,
Lng int,
Lat int,
NetWorkType int,
CellID string,
NearCellID string,
RSRPTotal decimal(10,2),
RSRPCount int,
RSRPAvg decimal(10,2),
RSRPPassCount int,
RSRPNGCount int,
RSRPPassRate decimal(4,2),
RSRPNGRate decimal(4,2),
RSRQTotal decimal(10,2),
RSRQCount int,
RSRQAvg decimal(4,2),
RSRQPassCount int,
RSRQNGCount int,
RSRQPassRate decimal(4,2),
RSRQNGRate decimal(4,2),
SINRTotal decimal(10,2),
SINRCount int,
SINRAvg decimal(4,2),
SINRPassCount int,
SINRNGCount int,
SINRPassRate decimal(4,2),
SINRNGRate decimal(4,2),
OuterRecordCount int,
InnerRecordCount int,
Difference int,
RecordCount int
);

--p_m_build_mr
drop table if exists p_m_build_mr;
create table p_m_build_mr (
stattime int,
ProvinceID int,
PROVINCENAME string,
cityID int,
CITYNAME string,
AreaID int,
AreaName string,
BuildingID string,
Cname string,
BuildingScene int,
Lng int,
Lat int,
CellID string,
NearCellID string,
RSRPTotal decimal(10,2),
RSRPCount int,
RSRPAvg decimal(10,2),
RSRPPassCount int,
RSRPNGCount int,
RSRPPassRate decimal(4,2),
RSRPNGRate decimal(4,2),
RSRQTotal decimal(10,2),
RSRQCount int,
RSRQAvg decimal(4,2),
RSRQPassCount int,
RSRQNGCount int,
RSRQPassRate decimal(4,2),
RSRQNGRate decimal(4,2),
SINRTotal decimal(10,2),
SINRCount int,
SINRAvg decimal(4,2),
SINRPassCount int,
SINRNGCount int,
SINRPassRate decimal(4,2),
SINRNGRate decimal(4,2),
OuterRecordCount int,
InnerRecordCount int,
Difference int,
RecordCount int
);

--p_m_build_net_mr
drop table if exists p_d_build_net_mr;
create table p_d_build_net_mr(
stattime int,
ProvinceID int,
PROVINCENAME string,
cityID int,
CITYNAME string,
AreaID int,
AreaName string,
BuildingID string,
Cname string,
BuildingScene int,
Lng int,
Lat int,
NetWorkType int,
CellID string,
NearCellID string,
RSRPTotal decimal(10,2),
RSRPCount int,
RSRPAvg decimal(10,2),
RSRPPassCount int,
RSRPNGCount int,
RSRPPassRate decimal(4,2),
RSRPNGRate decimal(4,2),
RSRQTotal decimal(10,2),
RSRQCount int,
RSRQAvg decimal(4,2),
RSRQPassCount int,
RSRQNGCount int,
RSRQPassRate decimal(4,2),
RSRQNGRate decimal(4,2),
SINRTotal decimal(10,2),
SINRCount int,
SINRAvg decimal(4,2),
SINRPassCount int,
SINRNGCount int,
SINRPassRate decimal(4,2),
SINRNGRate decimal(4,2),
OuterRecordCount int,
InnerRecordCount int,
Difference int,
RecordCount int
);

--p_d_build_mr
drop table if exists p_d_build_mr;
create table p_d_build_mr (
stattime int,
ProvinceID int,
PROVINCENAME string,
cityID int,
CITYNAME string,
AreaID int,
AreaName string,
BuildingID string,
Cname string,
BuildingScene int,
Lng int,
Lat int,
CellID string,
NearCellID string,
RSRPTotal decimal(10,2),
RSRPCount int,
RSRPAvg decimal(10,2),
RSRPPassCount int,
RSRPNGCount int,
RSRPPassRate decimal(4,2),
RSRPNGRate decimal(4,2),
RSRQTotal decimal(10,2),
RSRQCount int,
RSRQAvg decimal(4,2),
RSRQPassCount int,
RSRQNGCount int,
RSRQPassRate decimal(4,2),
RSRQNGRate decimal(4,2),
SINRTotal decimal(10,2),
SINRCount int,
SINRAvg decimal(4,2),
SINRPassCount int,
SINRNGCount int,
SINRPassRate decimal(4,2),
SINRNGRate decimal(4,2),
OuterRecordCount int,
InnerRecordCount int,
Difference int,
RecordCount int
);

drop table if exists p_m_building_f_g_net;
create external table p_m_building_f_g_net (
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
FLOORID string,
CNAME string,
BuildingScene int,
FLOORNAME string,
FLOORNUM int,
FLOORTYPE int,
NetWorkType int,
X int,
Y int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
InnerCount bigint,
OutterCount bigint,
Difference bigint,
RecordCount bigint,
CellID int,
IsInDoor int,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_m_building_f_g_net';


drop table if exists p_m_building_f_g;
create external table p_m_building_f_g(
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
FLOORID string,
CNAME string,
BuildingScene int,
FLOORNAME string,
FLOORNUM int,
FLOORTYPE int,
X int,
Y int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
InnerCount bigint,
OutterCount bigint,
Difference bigint,
RecordCount bigint,
CellID int,
IsInDoor int,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_m_building_f_g';


drop table if exists p_m_building_f_net;
create external table p_m_building_f_net(
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
FLOORID string,
CNAME string,
BuildingScene int,
FLOORNAME string,
FLOORNUM int,
FLOORTYPE int,
NetWorkType int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
ValidCount bigint,
VoidCount bigint,
InnerGridCount bigint,
OutterGridCount bigint,
RSRPGridPassCount bigint,
RSRPGridNGCount bigint,
RSRQGridPassCount bigint,
RSRQGridNGCount bigint,
SINRGridPassCount bigint,
SINRGridNGCount bigint,
SiganlPercent double,
RecordCount bigint,
GridCount bigint,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_m_building_f_net';

drop table if exists p_m_building_f;
create external table  p_m_building_f(
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
FLOORID string,
CNAME string,
BuildingScene int,
FLOORNAME string,
FLOORNUM int,
FLOORTYPE int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
ValidCount bigint,
VoidCount bigint,
InnerGridCount bigint,
OutterGridCount bigint,
RSRPGridPassCount bigint,
RSRPGridNGCount bigint,
RSRQGridPassCount bigint,
RSRQGridNGCount bigint,
SINRGridPassCount bigint,
SINRGridNGCount bigint,
SiganlPercent double,
RecordCount bigint,
GridCount bigint,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_m_building_f';


drop table if exists p_m_building_net;
create external table p_m_building_net(
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
CNAME string,
BuildingScene int,
NetWorkType int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
ValidCount bigint,
VoidCount bigint,
InnerGridCount bigint,
OutterGridCount bigint,
RSRPGridPassCount bigint,
RSRPGridNGCount bigint,
RSRQGridPassCount bigint,
RSRQGridNGCount bigint,
SINRGridPassCount bigint,
SINRGridNGCount bigint,
SiganlPercent double,
RecordCount bigint,
GridCount bigint,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_m_building_net';


drop table if exists p_m_building;
create external table p_m_building(
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
CNAME string,
BuildingScene int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
ValidCount bigint,
VoidCount bigint,
InnerGridCount bigint,
OutterGridCount bigint,
RSRPGridPassCount bigint,
RSRPGridNGCount bigint,
RSRQGridPassCount bigint,
RSRQGridNGCount bigint,
SINRGridPassCount bigint,
SINRGridNGCount bigint,
SiganlPercent double,
RecordCount bigint,
GridCount bigint,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_m_building';


drop table if exists p_d_building_f_g_net;
create external table p_d_building_f_g_net (
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
FLOORID string,
CNAME string,
BuildingScene int,
FLOORNAME string,
FLOORNUM int,
FLOORTYPE int,
NetWorkType int,
X int,
Y int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
InnerCount bigint,
OutterCount bigint,
Difference bigint,
RecordCount bigint,
CellID string,
IsInDoor int,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_d_building_f_g_net';


drop table if exists p_d_building_f_g;
create external table p_d_building_f_g(
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
FLOORID string,
CNAME string,
BuildingScene int,
FLOORNAME string,
FLOORNUM int,
FLOORTYPE int,
X int,
Y int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
InnerCount bigint,
OutterCount bigint,
Difference bigint,
RecordCount bigint,
CellID string,
IsInDoor int,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_d_building_f_g';


drop table if exists p_d_building_f_net;
create external table p_d_building_f_net(
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
FLOORID string,
CNAME string,
BuildingScene int,
FLOORNAME string,
FLOORNUM int,
FLOORTYPE int,
NetWorkType int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
ValidCount bigint,
VoidCount bigint,
InnerGridCount bigint,
OutterGridCount bigint,
RSRPGridPassCount bigint,
RSRPGridNGCount bigint,
RSRQGridPassCount bigint,
RSRQGridNGCount bigint,
SINRGridPassCount bigint,
SINRGridNGCount bigint,
SiganlPercent double,
RecordCount bigint,
GridCount bigint,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_d_building_f_net';

drop table if exists p_d_building_f;
create external table  p_d_building_f(
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
FLOORID string,
CNAME string,
BuildingScene int,
FLOORNAME string,
FLOORNUM int,
FLOORTYPE int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
ValidCount bigint,
VoidCount bigint,
InnerGridCount bigint,
OutterGridCount bigint,
RSRPGridPassCount bigint,
RSRPGridNGCount bigint,
RSRQGridPassCount bigint,
RSRQGridNGCount bigint,
SINRGridPassCount bigint,
SINRGridNGCount bigint,
SiganlPercent double,
RecordCount bigint,
GridCount bigint,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_d_building_f';


drop table if exists p_d_building_net;
create external table p_d_building_net(
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
CNAME string,
BuildingScene int,
NetWorkType int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
ValidCount bigint,
VoidCount bigint,
InnerGridCount bigint,
OutterGridCount bigint,
RSRPGridPassCount bigint,
RSRPGridNGCount bigint,
RSRQGridPassCount bigint,
RSRQGridNGCount bigint,
SINRGridPassCount bigint,
SINRGridNGCount bigint,
SiganlPercent double,
RecordCount bigint,
GridCount bigint,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_d_building_net';


drop table if exists p_d_building;
create external table p_d_building(
STATTIME int,
PROVINCEID int,
PROVINCENAME string,
CITYID int,
CITYNAME string,
AREAID int,
AREANAME string,
BUILDINGID string,
CNAME string,
BuildingScene int,
serviceprovider int,
RSRPTotal double,
RSRPCount bigint,
RSRPAvg double,
RSRPPassCount bigint,
RSRPNGCount bigint,
RSRPPassRate double,
RSRPNGRate double,
RSRQTotal double,
RSRQCount bigint,
RSRQAvg double,
RSRQPassCount bigint,
RSRQNGCount bigint,
RSRQPassRate double,
RSRQNGRate double,
SINRTotal double,
SINRCount bigint,
SINRAvg double,
SINRPassCount bigint,
SINRNGCount bigint,
SINRPassRate double,
SINRNGRate double,
ValidCount bigint,
VoidCount bigint,
InnerGridCount bigint,
OutterGridCount bigint,
RSRPGridPassCount bigint,
RSRPGridNGCount bigint,
RSRQGridPassCount bigint,
RSRQGridNGCount bigint,
SINRGridPassCount bigint,
SINRGridNGCount bigint,
SiganlPercent double,
RecordCount bigint,
GridCount bigint,
GroupID int,
GroupName string,
GroupType int
)
PARTITIONED BY (                                                     
   date_id string                                                
 )
row format delimited fields terminated by ','
STORED AS TEXTFILE                                                      
LOCATION '$pre/npno/$projectname/tmpoutput/p_d_building';


