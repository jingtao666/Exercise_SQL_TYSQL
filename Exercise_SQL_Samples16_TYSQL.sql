/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第十六章*/


/*更新单个列的数据*/
UPDATE Customers
SET cust_email = 'yaonie@163.com'
WHERE cust_id = 1000000005;


/*更新多个列的数据*/
UPDATE Customers
SET cust_email = 'yaonie@163.com',
	cust_address = 'China'
WHERE cust_id = 1000000005;


/*删除某个列的值*/
UPDATE Customers
SET cust_email = NULL
WHERE cust_id = 1000000005;


/*删除单个列的数据*/
DELETE FROM Customers
WHERE cust_id = 1000000005;


/*挑战题*/
/*编写SQL语句来更新所有美国地址，包括供应商状态（Vendors表中的vend_state）和顾客状态（Customers表中的cust_state），使它们均为大写。*/
UPDATE Vendors
SET vend_state = UPPER(vend_state)
WHERE vend_country = 'USA';

UPDATE Customers
SET cust_state = UPPER(cust_state)
WHERE vend_country = 'USA';


/*第15课的挑战题1要求你将自己添加到Customers表中。现在请删除自己。确保使用WHERE子句（在DELETE中使用它之前，先用SELECT对其进行测试），否则你会删除所有顾客！*/
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact,cust_email)
VALUES(1000000042,'Ben''s Toys','123 Main Street','Oak Park','MI','48237','USA','ben@forta.com');

SELECT * FROM Customers
WHERE cust_id = 1000000042;

DELETE FROM Customers
WHERE cust_id = 1000000042;