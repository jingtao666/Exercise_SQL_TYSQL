/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第十章*/


/*使用GROUP BY*/
SELECT COUNT(*) AS num_prods
FROM Products
WHERE vend_id = 'DLL01';

SELECT vend_id,
		COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id;


/*使用HAVING子句*/
SELECT cust_id,
		COUNT(*) AS orders
FROM Orders
GROUP BY cust_id
HAVING COUNT(*) >=2;


/*同时使用WHERE子句和HAVING子句*/
SELECT vend_id,
		COUNT(*) AS num_prods
FROM Products
WHERE prod_price >=4
GROUP BY vend_id
HAVING COUNT(*) >=2;

SELECT vend_id,
		COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id
HAVING COUNT(*) >=2;


/*同时使用GROUP子句和ORDER子句*/
SELECT order_num,
		COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >=3;

SELECT order_num,
		COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >=3
ORDER BY items,order_num;


/*挑战题*/
/*返回每个订单号（order_num）各有多少行数（order_lines），并按order_lines对结果进行排序。*/
SELECT order_num,
		COUNT(order_num) AS order_lines
FROM OrderItems
GROUP BY order_num
ORDER BY order_lines;


/*返回名为cheapest_item的字段，该字段包含每个供应商成本最低的产品（使用Products表中的prod_price），然后从最低成本到最高成本对结果进行排序。*/
SELECT vend_id,
		MIN(prod_price) AS cheapest_item
FROM Products
GROUP BY vend_id
ORDER BY cheapest_item;


/*返回至少含100项的所有订单的订单号（OrderItems表中的order_num）。*/
SELECT order_num
FROM OrderItems
GROUP BY order_num
HAVING SUM(quantity) >= 100
ORDER BY order_num;


/*返回总价至少为1000的所有订单的订单号（OrderItems表中的order_num）。提示：需要计算总和（item_price乘以quantity）。按订单号对结果进行排序。*/
SELECT order_num
FROM OrderItems
GROUP BY order_num
HAVING SUM(item_price*quantity) >= 1000
ORDER BY order_num;