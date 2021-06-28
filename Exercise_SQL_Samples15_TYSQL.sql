/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第十五章*/


/*插入完整的行*/
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact,cust_email)
VALUES('1000000006', 'Toy Land', '123 Any Street', 'New York', 'NY', '111111', 'USA', NULL,NULL);


/*插入部分行*/
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country)
VALUES('1000000006', 'Toy Land', '123 Any Street', 'New York', 'NY', '111111', 'USA');


/*插入检索出的数据*/
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country)
SELECT cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country
FROM CustNew;


/*从一个表复制到另一个表*/
CREATE TABLE CustCopy AS SELECT * FROM Customers;

SELECT * INTO CustCopy FROM Customers;


/*挑战题*/
/*使用INSERT和指定的列，将你自己添加到Customers表中。明确列出要添加哪几列，且仅需列出你需要的列。*/
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact,cust_email)
VALUES(1000000042,'Ben''s Toys','123 Main Street','Oak Park','MI','48237','USA','ben@forta.com');


/*备份Orders表和OrderItems表。*/
SELECT * INTO Copy_Orders FROM Orders;
SELECT * INTO OrderItems_Orders FROM OrderItems;