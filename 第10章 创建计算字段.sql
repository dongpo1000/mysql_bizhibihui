# 第10章 创建计算字段

# 拼接字段
SELECT CONCAT(vend_name, ' (', vend_country, ')')
FROM vendors
ORDER BY vend_name;

SELECT CONCAT(RTRIM(vend_name), ' (', RTRIM(vend_country), ')')
FROM vendors
ORDER BY vend_name;

SELECT CONCAT(RTRIM(vend_name), ' (', RTRIM(vend_country), ')') AS vend_title
FROM vendors
ORDER BY vend_name;

# 执行算数计算
SELECT prod_id, quantity, item_price
FROM orderitems
WHERE order_num = 20005;

SELECT 
  prod_id,
  quantity,
  item_price,
  quantity*item_price AS expanded_price 
FROM
  orderitems 
WHERE order_num = 20005 ;

# 测试计算
SELECT 3*2;
SELECT TRIM('abc');
SELECT NOW();

