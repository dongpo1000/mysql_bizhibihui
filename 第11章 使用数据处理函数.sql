# 第11章 使用数据处理函数
USE mysql_bizhibihui;

# 文本处理函数
SELECT vend_name, UPPER(vend_name) AS vend_name_upcase
FROM vendors
ORDER BY vend_name;

SELECT cust_name, cust_contact
FROM customers
WHERE cust_contact = 'Y. Lie';

SELECT cust_name, cust_contact
FROM customers
WHERE SOUNDEX(cust_contact) = SOUNDEX('Y. Lie');

# 日期和时间处理函数
SELECT cust_id, order_num
FROM orders
WHERE order_date = '2005-09-01';

SELECT cust_id, order_num
FROM orders
WHERE DATE(order_date) = '2005-09-01';

SELECT cust_id, order_num
FROM orders
WHERE DATE(order_date) BETWEEN '2005-09-01' AND '2005-09-30';

SELECT cust_id, order_num
FROM orders
WHERE YEAR(order_date) = 2005 AND MONTH(order_date) = 9;

