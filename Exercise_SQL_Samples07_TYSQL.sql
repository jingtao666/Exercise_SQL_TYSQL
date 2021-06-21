/*这是《必知必会SQL（第五版）》书中相关的案例*/
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


/*挑战题*/
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