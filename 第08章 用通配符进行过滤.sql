# 第8章 用通配符进行过滤

# 百分号 % 通配符
SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE 'jet%';

SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE '%anvil%';

SELECT prod_name
FROM products
WHERE prod_name LIKE 's%e';

# 下划线 _ 通配符
SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE '_ ton anvil';

SELECT prod_id, prod_name
FROM products
WHERE prod_name LIKE '% ton anvil';