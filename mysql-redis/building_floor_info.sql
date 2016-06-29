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
    'building_floor_info' AS redis_key,
    concat(buildingid,",",id) AS hkey,
    concat_ws(",",name,floornum,gridcount,floortype) AS hvalue
    FROM base_buildingfloor
) AS t
