/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第五章*/


/*AND操作符*/
SELECT prod_id,prod_price,prod_name
FROM Products
WHERE vend_id = 'DLL01' AND prod_price <= 4;


/*OR操作符*/
SELECT prod_id,prod_price,prod_name
FROM Products
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01';


/*求值顺序*/
SELECT prod_price,prod_name
FROM Products
WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01') AND prod_price >= 10 ;


/*IN操作符*/
SELECT prod_name,prod_price
FROM Products
WHERE vend_id IN ('DLL01' ,'BRS01')
ORDER BY prod_name;

SELECT prod_name,prod_price
FROM Products
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01'
ORDER BY prod_name;


/*NOT操作符*/
SELECT prod_name
FROM Products
WHERE NOT vend_id = 'DLL01'
ORDER BY prod_name;

SELECT prod_name,vend_id
FROM Products
WHERE vend_id != 'DLL01'
ORDER BY prod_name;


/*挑战题*/
/*从Vendors表中检索供应商名称（vend_name），仅返回加利福尼亚州的供应商（这需要按国家[USA]和州[CA]进行过滤，没准其他国家也存在一个加利福尼亚州）。*/
SELECT vend_name
FROM Vendors
WHERE vend_country = 'USA' AND vend_state = 'CA';

/*查找所有至少订购了总量100个的BR01、BR02或BR03的订单。你需要返回OrderItems表的订单号（order_num）、产品ID（prod_id）和数量，并按产品ID和数量进行过滤。*/
SELECT order_num,prod_id,quantity
FROM OrderItems
WHERE prod_id IN ('BR01','BR02','BR03') AND quantity >= 100;


/*返回所有价格在3美元到6美元之间的产品的名称（prod_name）和价格（prod_price）。使用AND，然后按价格对结果进行排序。*/
SELECT prod_name,prod_price
FROM Products
WHERE prod_price >= 3 AND prod_price <= 6
ORDER BY prod_price;