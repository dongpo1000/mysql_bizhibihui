# 第5章 排序检索数据
USE mysql_bizhibihui;

# 排序数据
SELECT prod_name FROM products;
SELECT prod_name FROM products ORDER BY prod_name;

# 按多个列排序
SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY prod_price, prod_name;

# 指定排序方向
SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY prod_price DESC;

SELECT prod_id, prod_price, prod_name
FROM products
ORDER BY prod_price DESC, prod_name;

# 最高价格
SELECT prod_price
FROM products
ORDER BY prod_price DESC
LIMIT 1;