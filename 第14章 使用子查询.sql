# 第14章 使用子查询

# 利用子查询进行过滤
SELECT order_num
FROM orderitems
WHERE prod_id = 'TNT2';

SELECT cust_id 
FROM orders
WHERE order_num IN (20005, 20007);

SELECT 
  cust_id 
FROM
  orders 
WHERE order_num IN 
  (SELECT 
    order_num 
  FROM
    orderitems 
  WHERE prod_id = 'TNT2') ;
  
SELECT cust_name, cust_contact
FROM customers
WHERE cust_id IN (10001, 10004);

SELECT 
  cust_name,
  cust_contact 
FROM
  customers 
WHERE cust_id IN 
  (SELECT 
    cust_id 
  FROM
    orders 
  WHERE order_num IN 
    (SELECT 
      order_num 
    FROM
      orderitems 
    WHERE prod_id = 'TNT2')) ;

# 作为计算字段使用子查询
SELECT COUNT(*) AS orders
FROM orders
WHERE cust_id = 10001;

SELECT 
  cust_name,
  cust_contact,
  (SELECT 
    COUNT(*) 
  FROM
    orders 
  WHERE customers.`cust_id` = orders.`cust_id`) AS orders 
FROM
  customers 
ORDER BY cust_name ;

SELECT 
  cust_name,
  cust_contact,
  (SELECT 
    COUNT(*) 
  FROM
    orders 
  WHERE `cust_id` =  `cust_id`) AS orders 
FROM
  customers 
ORDER BY cust_name ;

