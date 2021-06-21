/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第二章*/


/*检索单个列*/
SELECT prod_name
FROM Products;


/*检索多个列*/
SELECT prod_id,prod_name,prod_price
FROM Products;


/*检索所有列*/
SELECT *
FROM Products;


/*检索不同的值*/
/*只返回列中不同的值*/
SELECT DISTINCT vend_id
FROM Products;

SELECT DISTINCT vend_id,prod_price
FROM Products;


/*限制结果*/
/*返回不超过5行的数据*/
SELECT prod_name
FROM Products
LIMIT 5;


/*返回后面5行的数据*/
SELECT prod_name
FROM Products
LIMIT 5 OFFSET 5;


/*挑战题*/
/*从Customers表中检索所有的ID*/
SELECT cust_id
FROM Customers;


/*检索所有列，再检索某个列并注释掉*/
/*检索Customers表中所有的列，再编写另外的SELECT语句，仅检索顾客的ID。使用注释，注释掉一条SELECT语句，以便运行另一条SELECT语句。*/
SELECT *
-- SELECT cust_id
FROM Customers;


/*检索并列出已订购产品（prod_id）的清单（不用列每个订单，只列出不同产品的清单）*/
SELECT DISTINCT prod_id
FROM OrderItems;