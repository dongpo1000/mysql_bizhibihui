########################################
# MySQL Crash Course
# http://www.forta.com/books/0672327120/
# Example table creation scripts
########################################


########################
# Create customers table
########################
CREATE TABLE customers	-- 顾客表
(
  cust_id      INT       NOT NULL AUTO_INCREMENT,	-- 唯一的顾客ID
  cust_name    CHAR(50)  NOT NULL,			-- 顾客名
  cust_address CHAR(50)  NULL,				-- 顾客的地址
  cust_city    CHAR(50)  NULL,				-- 顾客的城市
  cust_state   CHAR(5)   NULL,				-- 顾客的州
  cust_zip     CHAR(10)  NULL,				-- 顾客的邮政编码
  cust_country CHAR(50)  NULL,				-- 顾客的国家
  cust_contact CHAR(50)  NULL,				-- 顾客的联系名
  cust_email   CHAR(255) NULL,				-- 顾客的联系Email地址
  PRIMARY KEY (cust_id)
) ENGINE=INNODB;

#########################
# Create orderitems table
#########################
CREATE TABLE orderitems	-- 订单明细表
(
  order_num  INT          NOT NULL,	-- 订单号（关联到orders表的order_num）
  order_item INT          NOT NULL,	-- 订单物品号（在某个订单中的顺序）
  prod_id    CHAR(10)     NOT NULL,	-- 产品ID（关联到products表的prod_id）
  quantity   INT          NOT NULL,	-- 物品数量
  item_price DECIMAL(8,2) NOT NULL,	-- 物品价格
  PRIMARY KEY (order_num, order_item)
) ENGINE=INNODB;


#####################
# Create orders table
#####################
CREATE TABLE orders	-- 订单表
(
  order_num  INT      NOT NULL AUTO_INCREMENT,	-- 唯一订单号
  order_date DATETIME NOT NULL,			-- 订单日期
  cust_id    INT      NOT NULL,			-- 订单顾客 ID（ 关系到 customers 表的 cust_id）
  PRIMARY KEY (order_num)
) ENGINE=INNODB;

#######################
# Create products table
#######################
CREATE TABLE products	-- 产品表
(
  prod_id    CHAR(10)      NOT NULL,	-- 唯一的产品ID
  vend_id    INT           NOT NULL,	-- 产品供应商ID（关联到vendors表中的vend_id）
  prod_name  CHAR(255)     NOT NULL,	-- 产品名
  prod_price DECIMAL(8,2)  NOT NULL,	-- 产品价格
  prod_desc  TEXT          NULL,	-- 产品描述
  PRIMARY KEY(prod_id)
) ENGINE=INNODB;

######################
# Create vendors table
######################
CREATE TABLE vendors -- 供应商表
(
  vend_id	INT 		NOT NULL AUTO_INCREMENT, -- 唯一的供应商ID
  vend_name	CHAR(50) 	NOT NULL,		 -- 供应商名
  vend_address	CHAR(50)	NULL,			 -- 供应商的地址
  vend_city	CHAR(50)	NULL,			 -- 供应商的城市
  vend_state	CHAR(5)		NULL,			 -- 供应商的州
  vend_zip	CHAR(10)	NULL,			 -- 供应商的邮政编码
  vend_country	CHAR(50)	NULL,			 -- 供应商的国家
  PRIMARY KEY (vend_id)
) ENGINE=INNODB;

###########################
# Create productnotes table
###########################
CREATE TABLE productnotes	-- 产品注释
(
  note_id    INT           NOT NULL AUTO_INCREMENT,	-- 唯一注释ID
  prod_id    CHAR(10)      NOT NULL,			-- 产品ID（对应于products表中的prod_id）
  note_date DATETIME       NOT NULL,			-- 增加注释的日期
  note_text  TEXT          NULL,			-- 注释文本
  PRIMARY KEY(note_id),
  FULLTEXT(note_text)
) ENGINE=MYISAM;


#####################
# Define foreign keys
#####################
ALTER TABLE orderitems ADD CONSTRAINT fk_orderitems_orders FOREIGN KEY (order_num) REFERENCES orders (order_num);
ALTER TABLE orderitems ADD CONSTRAINT fk_orderitems_products FOREIGN KEY (prod_id) REFERENCES products (prod_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_customers FOREIGN KEY (cust_id) REFERENCES customers (cust_id);
ALTER TABLE products ADD CONSTRAINT fk_products_vendors FOREIGN KEY (vend_id) REFERENCES vendors (vend_id);