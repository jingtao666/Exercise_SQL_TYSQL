/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第九章*/


/*使用AVG()函数求平均值*/
SELECT AVG(prod_price) AS avg_price
FROM Products;

SELECT AVG(prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';


/*使用COUNT()函数计数*/
SELECT COUNT(*) AS num_cust
FROM Customers;

SELECT COUNT(cust_email) AS num_cust
FROM Customers;


/*使用MAX()函数求最大值*/
SELECT MAX(prod_price) AS max_price
FROM Products;


/*使用MIN()函数求最小值*/
SELECT MIN(prod_price) AS min_price
FROM Products;


/*使用SUM()函数求和*/
SELECT SUM(quantity) AS items_ordered
FROM OrderItems
WHERE order_num = 20005;

SELECT SUM(item_price*quantity) AS total_price
FROM OrderItems
WHERE order_num = 20005;


/*使用AVG()函数,指定DISTINCT参数*/
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';


/*使用多个聚集函数*/
SELECT COUNT(*) AS num_items,
		MIN(prod_price) AS price_min,
		MAX(prod_price) AS price_max,
		AVG(prod_price) AS price_avg
FROM Products;


/*挑战题*/
/*确定已售出产品的总数（使用OrderItems中的quantity列）*/
SELECT SUM(quantity) AS items_ordered
FROM OrderItems;


/*确定已售出产品项（prod_id）BR01的总数。*/
SELECT SUM(quantity) AS items_ordered
FROM OrderItems
WHERE prod_id = 'BR01';


/*确定Products表中价格不超过10美元的最贵产品的价格（prod_price）。将计算所得的字段命名为max_price。*/
SELECT MAX(prod_price) AS max_price
FROM Products
WHERE prod_price <= 10;