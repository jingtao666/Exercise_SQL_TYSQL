/*这是《必知必会SQL（第五版）》书中相关的案例*/
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


/*挑战题*/
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
