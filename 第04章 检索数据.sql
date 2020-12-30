# 第4章 检索数据

USE mysql_bizhibihui;

# 检索单个列
SELECT prod_name FROM products;

# 检索多个列
SELECT prod_id, prod_name, prod_price
FROM products;

# 检索所有列
SELECT * FROM products;

# 检索不同的行
SELECT vend_id FROM products;
SELECT DISTINCT vend_id FROM products;
SELECT DISTINCT vend_id, prod_price FROM products;

# 限制结果
SELECT prod_name FROM products LIMIT 5; -- 检索出的第一行为行0而不是行1
SELECT prod_name FROM products LIMIT 3, 5; -- 从行3(第四行)开始的5行

# 使用完全限定的表名
SELECT products.`prod_name` FROM products;
SELECT products.`prod_name` FROM mysql_bizhibihui.`products`;









