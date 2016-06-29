SELECT CONCAT (
    "*4\r\n",
    '$', LENGTH(redis_cmd), '\r\n',
    redis_cmd, '\r\n',
    '$', LENGTH(redis_key), '\r\n',
    redis_key, '\r\n',
    '$', LENGTH(hkey), '\r\n',
    hkey, '\r\n',
    '$', LENGTH(hvalue), '\r\n',
    hvalue, '\r'
)
FROM (
    SELECT    
    'HSET' AS redis_cmd,
    'building_info' AS redis_key,
    id AS hkey,
    concat_ws(",",provinceid,provincename,cityid,cityname,areaid,areaname,cname,buildingscene,address) AS hvalue
    FROM base_building
) AS t
