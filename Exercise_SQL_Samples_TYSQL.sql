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


/*第六章*/
/*百分号（%）通配符*/
/*使用一个%通配符*/
SELECT prod_id,prod_name
FROM Products
WHERE prod_name LIKE 'Fish%';


/*使用多个%通配符*/
SELECT prod_id,prod_name
FROM Products
WHERE prod_name LIKE '%bean bag%';


/*把%通配符放搜索模式中间*/
SELECT prod_id,prod_name
FROM Products
WHERE prod_name LIKE 'F%y';


/*把%通配符放搜索模式中间*/
SELECT cust_name,cust_email
FROM Customers
WHERE cust_email LIKE 'j%@fun%';


/*下划线（_）通配符*/
SELECT prod_id,prod_name
FROM Products
WHERE prod_name LIKE '__ inch teddy bear';


/*方括号（[ ]）通配符*/
SELECT cust_contact
FROM Customers
WHERE cust_contact LIKE '[JM]%'
ORDER BY cust_contact;

SELECT cust_contact
FROM Customers
WHERE cust_contact LIKE '[^JM]%'
ORDER BY cust_contact;

SELECT cust_contact
FROM Customers
WHERE NOT cust_contact LIKE '[JM]%'
ORDER BY cust_contact;


/*从Products表中检索产品名称（prod_name）和描述（prod_desc），仅返回描述中包含toy一词的产品。*/
SELECT prod_name,prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%';


/*从Products表中检索产品名称（prod_name）和描述（prod_desc），仅返回描述中未出现toy一词的产品。*/
SELECT prod_name,prod_desc
FROM Products
WHERE NOT prod_desc LIKE '%toy%'
ORDER BY prod_name;


/*，从Products表中检索产品名称（prod_name）和描述（prod_desc），仅返回描述中同时出现toy和carrots的产品。*/
SELECT prod_name,prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%' AND prod_desc LIKE '%carrots%';


/*从Products表中检索产品名称（prod_name）和描述（prod_desc），仅返回在描述中以先后顺序同时出现toy和carrots的产品。*/
SELECT prod_name,prod_desc
FROM Products
WHERE prod_desc LIKE '%toy%carrots%';


/*第七章*/
/*拼接，将一个值附加到另一个值，构成单个值*/
SELECT CONCAT (vend_name, ' (',vend_city,')')
FROM Vendors
ORDER BY vend_name;


/*SQL不支持TRIM函数、RTRIM函数和LRTIM函数。待验证？*/
SELECT RTRIM (vend_name)+ ' ('+RTRIM (vend_city)+')'
FROM Vendors
ORDER BY vend_name;

SELECT CONCAT (vend_name, ' (',vend_city,')')
FROM Vendors
ORDER BY vend_name;


/*支持列别名*/
SELECT CONCAT (vend_name, ' (',vend_city,')') AS vend_title
FROM Vendors
ORDER BY vend_name;


/*执行算术计算*/
SELECT prod_id,quantity,item_price
FROM OrderItems
WHERE order_num = 20008;

SELECT prod_id,
		quantity,
		item_price,
		quantity*item_price AS expand_price
FROM OrderItems
WHERE order_num = 20008;


/*从Vendors表中检索vend_id、vend_name、vend_address和vend_city，将vend_name重命名为vname，将vend_city重命名为vcity，将vend_address重命名为vaddress。按供应商名称对结果进行排序（可以使用原始名称或新的名称）。*/
SELECT vend_id,
		vend_name AS Vname,
		vend_address AS vaddress,
		vend_city AS vcity
FROM Vendors
ORDER BY vend_name;


/*从Products表中返回prod_id、prod_price和sale_price。sale_price是一个包含促销价格的计算字段。提示：可以乘以0.9，得到原价的90%（即10%的折扣）。*/
SELECT prod_id,
		prod_price,
		prod_price*0.9 AS sale_price
FROM Products;


/*第八章*/
/*使用UPPER()函数*/
SELECT order_num
FROM Orders
WHERE YEAR(order_date) = 2020 ;


/*返回顾客ID（cust_id）、顾客名称（customer_name）和登录名（user_login），其中登录名全部为大写字母，并由顾客联系人的前两个字符（cust_contact）和其所在城市的前三个字符（cust_city）组成。*/
SELECT cust_id,
		cust_name,
		CONCAT(UPPER(LEFT(cust_contact, 2)), UPPER(LEFT(cust_city, 3))) AS user_login
FROM Customers;


/*返回2020年1月的所有订单的订单号（order_num）和订单日期（order_date），并按订单日期排序。*/
SELECT order_num,order_date
FROM Orders
WHERE YEAR(order_date) = 2020 AND MONTH(order_date)= 1
ORDER BY order_date;


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




















