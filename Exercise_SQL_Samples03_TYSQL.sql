/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第三章*/


/*检索单个列并按单个列排序*/
SELECT prod_name
FROM Products
ORDER BY prod_name;


/*检索多个列并按多个列排序*/
SELECT prod_id,prod_price,prod_name
FROM Products
ORDER BY prod_price,prod_name;


/*检索多个列并按列位置排序*/
SELECT prod_id,prod_price,prod_name
FROM Products
ORDER BY 2,3;

SELECT prod_id,prod_price,prod_name
FROM Products
ORDER BY 2,prod_name;


/*检索多个列并按某个列降序排列*/
SELECT prod_id,prod_price,prod_name
FROM Products
ORDER BY prod_price DESC;


/*检索多个列并按多个列排序，其中某个列需降序排列*/
SELECT prod_id,prod_price,prod_name
FROM Products
ORDER BY prod_price DESC ,prod_name;


/*挑战题*/
/*检索单个列并降序排序*/
/*从Customers中检索所有的顾客名称（cust_names），并按从Z到A的顺序显示结果*/
SELECT cust_name
FROM Customers
ORDER BY cust_name DESC;


/*检索多个列并按多个列排序，其中某个列需降序排列*/
/*从Orders表中检索顾客ID（cust_id）和订单号（order_num），并先按顾客ID对结果进行排序，再按订单日期倒序排列。*/
SELECT cust_id,order_num
FROM Orders
ORDER BY cust_id,order_date DESC;


/*检索多个列并降序排列*/
/*检索OrderItems表中的数量和价格（item_price），并按数量由多到少、价格由高到低排序。*/
SELECT quantity,item_price
FROM OrderItems
ORDER BY quantity DESC,item_price DESC;