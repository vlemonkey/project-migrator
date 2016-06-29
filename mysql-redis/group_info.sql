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
    'group_info' AS redis_key,
    b.buildingid AS hkey,
    concat_ws(",",a.GroupID,a.GroupName,a.GroupType,a.SchemeID,a.ProvinceId,a.ProvinceName,a.CityId,a.CityName) AS hvalue
    FROM base_group a ,base_group_building b
    WHERE a.groupid = b.groupid
) AS t
