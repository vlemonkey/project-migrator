SELECT CONCAT (
    "*3\r\n",
    '$', LENGTH(redis_cmd), '\r\n',
    redis_cmd, '\r\n',
    '$', LENGTH(redis_key), '\r\n',
    redis_key, '\r\n',
    '$', LENGTH(redis_value), '\r\n',
    redis_value, '\r'
)
FROM (
    SELECT    
    'LPUSH' AS redis_cmd,
    'buildingant_info' AS redis_key,
    CONCAT_WS(",",a.Code,a.BuildingID,b.Buildingscene,a.FloorID,c.floortype,X,Y,a.NetWorkType,b.address) AS redis_value
    FROM base_buildingant a, base_building b, base_buildingfloor c
    WHERE a.BuildingID=b.ID
    AND a.FloorID=c.id
) AS t
