/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第十三章*/


/*使用表别名*/
SELECT CONCAT (vend_name, ' (',vend_city,')') AS vend_title
FROM Vendors
ORDER BY vend_name;

SELECT cust_name,cust_contact
FROM Customers AS C,Orders AS O,OrderItems AS OI
WHERE C.cust_id = O.cust_id
	AND OI.order_num = O.order_num
	AND prod_id = 'RGAN01';


/*使用不同类型的联结*/
/*自联结*/
SELECT cust_id,cust_name,cust_contact
FROM Customers
WHERE cust_name = (SELECT cust_name
					FROM Customers
					WHERE cust_contact = 'Jim Jones');

SELECT c1.cust_id,c1.cust_name,c1.cust_contact
FROM Customers AS c1,Customers AS c2
WHERE c1.cust_name=c2.cust_name
	AND c2.cust_contact = 'Jim Jones';


/*自然联结*/
SELECT C.*,O.order_num,O.order_date,OI.prod_id,OI.quantity,OI.item_price
FROM Customers AS C,Orders AS O,OrderItems AS OI
WHERE C.cust_id = O.cust_id
	AND OI.order_num = O.order_num
	AND prod_id = 'RGAN01';


/*外联结*/
/*简单的内联结*/
SELECT Customers.cust_id,Orders.order_num
FROM Customers 
	INNER JOIN Orders ON Customers.cust_id = Orders.cust_id;

/*简单的外联结*/
SELECT Customers.cust_id,Orders.order_num
FROM Customers 
	LEFT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;

SELECT Customers.cust_id,Orders.order_num
FROM Customers 
	RIGHT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;


/*使用带聚集函数的联结*/
SELECT Customers.cust_id,
		COUNT(Orders.order_num) AS num_ord
FROM Customers 
	INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;


SELECT Customers.cust_id,
		COUNT( Orders.order_num) AS num_ord
FROM Customers 
	LEFT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;


/*挑战题*/
/*使用INNER JOIN编写SQL语句，以检索每个顾客的名称（Customers表中的cust_name）和所有的订单号（Orders表中的order_num）。*/
SELECT cust_name, order_num
FROM Customers 
	JOIN Orders ON Customers.cust_id = Orders.cust_id
ORDER BY cust_name;


/*修改刚刚创建的SQL语句，仅列出所有顾客，即使他们没有下过订单。*/
SELECT cust_name,order_num
FROM Customers 
	LEFT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id
ORDER BY cust_name;


/*使用OUTER JOIN联结Products表和OrderItems表，返回产品名称（prod_name）和与之相关的订单号（order_num）的列表，并按商品名称排序。*/
SELECT prod_name,order_num
FROM Products 
	LEFT OUTER JOIN OrderItems ON Products.prod_id = OrderItems.prod_id
ORDER BY prod_name;


/*修改上一题中创建的SQL语句，使其返回每一项产品的总订单数（不是订单号）。*/
SELECT prod_name,COUNT(order_num) AS num_ord
FROM Products 
	LEFT OUTER JOIN OrderItems ON Products.prod_id = OrderItems.prod_id
GROUP BY prod_name
ORDER BY prod_name;


/*列出供应商（Vendors表中的vend_id）及其可供产品的数量，包括没有产品的供应商。你需要使用OUTER JOIN和COUNT()聚合函数来计算Products表中每种产品的数量。注意：vend_id列会显示在多个表中，因此在每次引用它时都需要完全限定它。*/
SELECT Vendors.vend_id,COUNT(prod_id) AS vend_prod
FROM Vendors
	LEFT OUTER JOIN Products ON Products.vend_id = Vendors.vend_id
GROUP BY Vendors.vend_id;