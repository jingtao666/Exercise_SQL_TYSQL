/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第四章*/


/*简单的相等检验*/
SELECT prod_name,prod_price
FROM Products
WHERE prod_price = 3.49;


/*检查单个值*/
SELECT prod_name,prod_price
FROM Products
WHERE prod_price <= 10;


/*不匹配检查*/
SELECT vend_id,prod_name
FROM Products
WHERE vend_id != 'DLL01';

SELECT vend_id,prod_name
FROM Products
WHERE vend_id <> 'DLL01';


/*范围值检查*/
SELECT prod_name,prod_price
FROM Products
WHERE prod_price BETWEEN 5 AND 10;


/*空值检查*/
SELECT prod_name,prod_price
FROM Products
WHERE prod_price IS NULL;

SELECT cust_name
FROM Customers
WHERE cust_email IS NULL;


/*挑战题*/
/*从Products表中检索产品ID（prod_id）和产品名称（prod_name），只返回价格为9.49美元的产品*/
SELECT prod_id,prod_name
FROM Products
WHERE prod_price = 9.49;


/*从Products表中检索产品ID（prod_id）和产品名称（prod_name），只返回价格为9美元或更高的产品*/
SELECT prod_id,prod_name
FROM Products
WHERE prod_price >= 9;


/*返回Products表中所有价格在3美元到6美元之间的产品的名称（prod_name）和价格（prod_price），然后按价格对结果进行排序*/
SELECT prod_name,prod_price
FROM Products
WHERE prod_price BETWEEN 3 AND 6
ORDER BY prod_price;


/*从OrderItems表中检索出所有不同订单号（order_num），且销量包含100个或更多的产品。*/
SELECT DISTINCT order_num
FROM OrderItems
WHERE quantity >= 100;