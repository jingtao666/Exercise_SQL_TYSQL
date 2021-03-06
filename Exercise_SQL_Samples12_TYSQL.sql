/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第十二章*/


/*创建联结*/
SELECT vend_name,prod_name,prod_price
FROM Vendors,Products
WHERE Vendors.vend_id = Products.vend_id;


/*内联结，或者等值联结*/
SELECT vend_name,prod_name,prod_price
FROM Vendors
	INNER JOIN Products ON Vendors.vend_id = Products.vend_id;


/*联结多个表*/
SELECT prod_name,vend_name,prod_price,quantity
FROM OrderItems,Products,Vendors
WHERE Products.vend_id = Vendors.vend_id
	AND OrderItems.prod_id = Products.prod_id
	AND order_num = 20007;


/*联结多个表*/
SELECT cust_name,cust_contact
FROM Customers
WHERE cust_id IN (SELECT cust_id
					FROM Orders
					WHERE order_num IN (SELECT order_num
										FROM OrderItems
										WHERE prod_id = 'RGAN01'))

SELECT cust_name,cust_contact
FROM Customers,Orders,OrderItems
WHERE Orders.order_num = OrderItems.order_num
	AND Customers.cust_id = Orders.cust_id
	AND prod_id = 'RGAN01'

/*挑战题*/
/*返回Customers表中的顾客名称（cust_name）和Orders表中的相关订单号（order_num），并按顾客名称再按订单号对结果进行排序。
尝试两次，一次使用简单的等联结语法，一次使用INNER JOIN。*/
SELECT cust_name,order_num
FROM Customers,Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name,order_num;

SELECT cust_name,order_num
FROM Customers
	INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
ORDER BY cust_name,order_num;


/*来让上一题变得更有用些。除了返回顾客名称和订单号，添加第三列OrderTotal，其中包含每个订单的总价。
有两种方法可以执行此操作：使用OrderItems表的子查询来创建OrderTotal列，或者将OrderItems表与现有表联结并使用聚合函数。提示：请注意需要使用完全限定列名的地方。*/
SELECT cust_name,
		order_num,
		(SELECT SUM(item_price*quantity) 
			FROM OrderItems
			WHERE Orders.order_num = OrderItems.order_num) AS OrderTotal
FROM Customers,Orders
WHERE Customers.cust_id = Orders.cust_id
ORDER BY cust_name,order_num;

SELECT cust_name,
		Orders.order_num,
		SUM(item_price*quantity) AS OrderTotal
FROM Customers,Orders,OrderItems
WHERE Customers.cust_id = Orders.cust_id
	AND Orders.order_num = OrderItems.order_num
GROUP BY cust_name,order_num
ORDER BY cust_name,order_num;


/*检索订购产品BR01的日期，这一次使用联结和简单的等联结语法。输出应该与第11课的输出相同。*/
SELECT cust_id,order_date
FROM Orders,OrderItems
WHERE Orders.order_num = OrderItems.order_num
	AND prod_id = 'BR01'
ORDER BY order_date;


/*重新创建为第11课挑战题3编写的SQL语句，这次使用ANSI的INNER JOIN语法。在之前编写的代码中使用了两个嵌套的子查询。要重新创建它，需要两个INNER JOIN语句，每个语句的格式类似于本课讲到的INNER JOIN示例，而且不要忘记WHERE子句可以通过prod_id进行过滤。*/
SELECT cust_email
FROM Customers
WHERE cust_id IN (SELECT cust_id
					FROM Orders
					WHERE order_num IN (SELECT order_num
											FROM OrderItems
											WHERE prod_id = 'BR01'));

SELECT cust_email
FROM Customers
	INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
	INNER JOIN OrderItems ON Orders.order_num = OrderItems.order_num
WHERE prod_id = 'BR01';


/*再让事情变得更加有趣些，我们将混合使用联结、聚合函数和分组。准备好了吗？回到第10课，当时的挑战是要求查找值等于或大于1000的所有订单号。这些结果很有用，但更有用的是订单数量至少达到这个数的顾客名称。
因此，编写SQL语句，使用联结从Customers表返回顾客名称（cust_name），并从OrderItems表返回所有订单的总价。
提示：要联结这些表，还需要包括Orders表（因为Customers表与OrderItems表不直接相关，Customers表与Orders表相关，而Orders表与OrderItems表相关）。不要忘记GROUP BY和HAVING，并按顾客名称对结果进行排序。你可以使用简单的等联结或ANSI的INNER JOIN语法。或者，如果你很勇敢，请尝试使用两种方式编写。*/
SELECT order_num
FROM OrderItems
GROUP BY order_num
HAVING SUM(item_price*quantity) >= 1000
ORDER BY order_num;

SELECT cust_name,
		SUM(item_price*quantity) AS total_price
FROM Customers
	INNER JOIN Orders ON Customers.cust_id = Orders.cust_id 
	INNER JOIN OrderItems ON Orders.order_num = OrderItems.order_num
GROUP BY cust_name
HAVING SUM(item_price*quantity) >= 1000
ORDER BY cust_name;

SELECT cust_name,
		SUM(item_price*quantity) AS total_price
FROM Customers,Orders,OrderItems
WHERE Customers.cust_id = Orders.cust_id 
	AND Orders.order_num = OrderItems.order_num
GROUP BY cust_name
HAVING SUM(item_price*quantity) >= 1000
ORDER BY cust_name;