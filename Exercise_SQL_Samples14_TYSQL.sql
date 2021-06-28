/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第十四章*/


/*使用UNION*/
SELECT cust_name,cust_contact,cust_email
FROM Customers
WHERE cust_state IN('IL','IN','MI');

SELECT cust_name,cust_contact,cust_email
FROM Customers
WHERE cust_name = 'Fun4All';

SELECT cust_name,cust_contact,cust_email
FROM Customers
WHERE cust_state IN('IL','IN','MI')
UNION
SELECT cust_name,cust_contact,cust_email
FROM Customers
WHERE cust_name = 'Fun4All';


/*使用UNION ALL*/
SELECT cust_name,cust_contact,cust_email
FROM Customers
WHERE cust_state IN('IL','IN','MI')
UNION ALL
SELECT cust_name,cust_contact,cust_email
FROM Customers
WHERE cust_name = 'Fun4All';


/*对组合查询结果排序*/
SELECT cust_name,cust_contact,cust_email
FROM Customers
WHERE cust_state IN('IL','IN','MI')
UNION ALL
SELECT cust_name,cust_contact,cust_email
FROM Customers
WHERE cust_name = 'Fun4All'
ORDER BY cust_name,cust_contact;


/*挑战题*/
/*将两个SELECT语句结合起来，以便从OrderItems表中检索产品ID（prod_id）和quantity。其中，一个SELECT语句过滤数量为100的行，另一个SELECT语句过滤ID以BNBG开头的产品。按产品ID对结果进行排序。*/
SELECT prod_id,quantity
FROM OrderItems
WHERE quantity = 100
UNION
SELECT prod_id,quantity
FROM OrderItems
WHERE prod_id Like 'BNBG%'
ORDER BY prod_id;


/*重写刚刚创建的SQL语句，仅使用单个SELECT语句。*/
SELECT prod_id,quantity
FROM OrderItems
WHERE quantity = 100 OR prod_id Like 'BNBG%'
ORDER BY prod_id;


/*组合Products表中的产品名称（prod_name）和Customers表中的顾客名称（cust_name）并返回，然后按产品名称对结果进行排序。*/
SELECT prod_name
FROM Products
UNION
SELECT cust_name
FROM Customers
ORDER BY prod_name;