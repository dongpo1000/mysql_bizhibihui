########################################
# MySQL Crash Course
# http://www.forta.com/books/0672327120/
# Example table creation scripts
########################################


########################
# Create customers table
########################
DROP TABLE IF EXISTS customers;
CREATE TABLE customers	
(
  cust_id      INT          NOT NULL AUTO_INCREMENT COMMENT '唯一的顾客ID',
  cust_name    VARCHAR(50)  NOT NULL COMMENT '顾客名',	
  cust_address VARCHAR(50)  NULL COMMENT '顾客的地址',	
  cust_city    VARCHAR(50)  NULL COMMENT '顾客的城市',	
  cust_state   VARCHAR(5)   NULL COMMENT '顾客的州',	
  cust_zip     VARCHAR(10)  NULL COMMENT '顾客的邮政编码',	
  cust_country VARCHAR(50)  NULL COMMENT '顾客的国家',	
  cust_contact VARCHAR(50)  NULL COMMENT '顾客的联系名',	
  cust_email   VARCHAR(255) NULL COMMENT '顾客的联系Email地址',	
  PRIMARY KEY (cust_id)
) ENGINE=INNODB COMMENT='顾客表';

#########################
# Create orderitems table
#########################
DROP TABLE IF EXISTS orderitems;
CREATE TABLE orderitems	
(
  order_num  INT          NOT NULL COMMENT '订单号（关联到orders表的order_num）',
  order_item INT          NOT NULL COMMENT '订单物品号（在某个订单中的顺序）',
  prod_id    VARCHAR(10)  NOT NULL COMMENT '产品ID（关联到products表的prod_id）',
  quantity   INT          NOT NULL COMMENT '物品数量',
  item_price DECIMAL(8,2) NOT NULL COMMENT '物品价格',
  PRIMARY KEY (order_num, order_item)
) ENGINE=INNODB COMMENT='订单明细表';


#####################
# Create orders table
#####################
DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
  order_num  INT      NOT NULL AUTO_INCREMENT COMMENT '唯一订单号',
  order_date DATETIME NOT NULL COMMENT '订单日期',
  cust_id    INT      NOT NULL COMMENT '订单顾客 ID（ 关联到 customers 表的 cust_id）',	
  PRIMARY KEY (order_num)
) ENGINE=INNODB COMMENT='订单表';

#######################
# Create products table
#######################
DROP TABLE IF EXISTS products;
CREATE TABLE products
(
  prod_id    VARCHAR(10)   NOT NULL COMMENT '唯一的产品ID',	-- 
  vend_id    INT           NOT NULL COMMENT '产品供应商ID（关联到vendors表中的vend_id）',
  prod_name  VARCHAR(255)  NOT NULL COMMENT '产品名',
  prod_price DECIMAL(8,2)  NOT NULL COMMENT '产品价格',
  prod_desc  TEXT          NULL COMMENT '产品描述',
  PRIMARY KEY(prod_id)
) ENGINE=INNODB COMMENT='产品表';

######################
# Create vendors table
######################
DROP TABLE IF EXISTS vendors;
CREATE TABLE vendors
(
  vend_id	INT 		NOT NULL AUTO_INCREMENT COMMENT '唯一的供应商ID',
  vend_name	VARCHAR(50) 	NOT NULL COMMENT '供应商名',
  vend_address	VARCHAR(50)	NULL COMMENT '供应商的地址',
  vend_city	VARCHAR(50)	NULL COMMENT '供应商的城市',
  vend_state	VARCHAR(5)	NULL COMMENT '供应商的州',
  vend_zip	VARCHAR(10)	NULL COMMENT '供应商的邮政编码',
  vend_country	VARCHAR(50)	NULL COMMENT '供应商的国家',
  PRIMARY KEY (vend_id)
) ENGINE=INNODB COMMENT='供应商表';

###########################
# Create productnotes table
###########################
DROP TABLE IF EXISTS productnotes;
CREATE TABLE productnotes
(
  note_id    INT           NOT NULL AUTO_INCREMENT COMMENT '唯一注释ID',
  prod_id    VARCHAR(10)   NOT NULL COMMENT '产品ID（对应于products表中的prod_id）',
  note_date  DATETIME      NOT NULL COMMENT '增加注释的日期',	
  note_text  TEXT          NULL COMMENT '注释文本',
  PRIMARY KEY(note_id),
  FULLTEXT(note_text)
) ENGINE=MYISAM COMMENT='产品注释';


#####################
# Define foreign keys
#####################
ALTER TABLE orderitems ADD CONSTRAINT fk_orderitems_orders FOREIGN KEY (order_num) REFERENCES orders (order_num);
ALTER TABLE orderitems ADD CONSTRAINT fk_orderitems_products FOREIGN KEY (prod_id) REFERENCES products (prod_id);
ALTER TABLE orders ADD CONSTRAINT fk_orders_customers FOREIGN KEY (cust_id) REFERENCES customers (cust_id);
ALTER TABLE products ADD CONSTRAINT fk_products_vendors FOREIGN KEY (vend_id) REFERENCES vendors (vend_id);