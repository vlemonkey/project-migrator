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
    'cell_building_info' AS redis_key,
    concat_ws(",", cellid, buildingid) AS hkey,
    '' AS hvalue
    FROM base_station
) AS t
