/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第十一章*/


/*利用子查询进行过滤*/
SELECT order_num
FROM OrderItems
WHERE prod_id = 'RGAN01';

SELECT cust_id
FROM Orders
WHERE order_num IN(20007,20008);

SELECT cust_name,cust_contact
FROM Customers
WHERE cust_id IN(1000000004,1000000005);


SELECT cust_id
FROM Orders
WHERE order_num IN(SELECT order_num
					FROM OrderItems
					WHERE prod_id = 'RGAN01'
					);

SELECT cust_name,cust_contact
FROM Customers
WHERE cust_id IN (SELECT cust_id
					FROM Orders
					WHERE order_num IN (SELECT order_num
										FROM OrderItems
										WHERE prod_id = 'RGAN01'
										)
				)


/*作为计算字段使用子查询*/
SELECT cust_id,
		COUNT(order_num)
FROM Orders
GROUP BY cust_id;

SELECT cust_name,cust_contact
FROM Customers
WHERE cust_id IN ('1000000001','1000000002','1000000004','1000000005');

SELECT COUNT(*) AS orders
FROM Orders
WHERE cust_id = '1000000001';

SELECT cust_name,
		cust_state,
		(SELECT COUNT(*)
			FROM Orders
			WHERE Orders.cust_id =Customers.cust_id) AS orders
FROM Customers
ORDER BY cust_name;


/*挑战题*/
/*使用子查询，返回购买价格为10美元或以上产品的顾客列表。你需要使用OrderItems表查找匹配的订单号（order_num），然后使用Order表检索这些匹配订单的顾客ID（cust_id）。*/
SELECT cust_id
FROM Orders
WHERE order_num IN (SELECT order_num
						FROM OrderItems
						WHERE item_price >=10);


/*使用子查询来确定哪些订单（在OrderItems中）购买了prod_id为BR01的产品，然后从Orders表中返回每个产品对应的顾客ID（cust_id）和订单日期（order_date）。按订购日期对结果进行排序。*/
SELECT cust_id,order_date
FROM Orders
WHERE order_num IN (SELECT order_num
					FROM OrderItems
					WHERE prod_id = 'BR01')
ORDER BY order_date;


/*在上一个挑战题，返回购买prod_id为BR01的产品的所有顾客的电子邮件（Customers表中的cust_email）。提示：这涉及SELECT语句，最内层的从OrderItems表返回order_num，中间的从Customers表返回cust_id。*/
SELECT cust_email
FROM Customers
WHERE cust_id IN (SELECT cust_id
					FROM Orders
					WHERE order_num IN (SELECT order_num
											FROM OrderItems
											WHERE prod_id = 'BR01'));


/*我们需要一个顾客ID列表，其中包含他们已订购的总金额。编写SQL语句，返回顾客ID（Orders表中的cust_id），并使用子查询返回total_ordered以便返回每个顾客的订单总数。将结果按金额从大到小排序。提示：你之前已经使用SUM()计算订单总数。*/
SELECT cust_id,
		(SELECT SUM(item_price*quantity)
			FROM OrderItems
			WHERE Orders.order_num=OrderItems.order_num
		) AS total_ordered
FROM Orders
ORDER BY total_ordered DESC;


/*编写SQL语句，从Products表中检索所有的产品名称（prod_name），以及名为quant_sold的计算列，其中包含所售产品的总数（在OrderItems表上使用子查询和SUM(quantity)检索）。*/
SELECT prod_name,
		(SELECT SUM(quantity)
			FROM OrderItems
			WHERE Products.prod_id=OrderItems.prod_id
		) AS quant_sold
FROM Products;