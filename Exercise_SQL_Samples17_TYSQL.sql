/*这是《必知必会SQL（第五版）》书中相关的案例*/
/*第十七章*/


/*创建表*/
CREATE TABLE Products(
  prod_id    char(10)      NOT NULL ,
  vend_id    char(10)      NOT NULL ,
  prod_name  char(255)     NOT NULL ,
  prod_price decimal(8,2)  NOT NULL ,
  prod_desc  text          NULL 
);


/*更新表*/
ALTER TABLE Vendors
ADD vend_phone CHAR(20);


/*删除表*/
DROP TABLE CustCopy;


/*挑战题*/
/*在Vendors表中添加一个网站列（vend_web）。你需要一个足以容纳URL的大文本字段。*/
ALTER TABLE Vendors
ADD vend_web CHAR(1024);


/*使用UPDATE语句更新Vendor记录，以便加入网站（你可以编造任何地址）。*/

UPDATE Vendors
SET vend_web = 'https://google.com/'
WHERE vend_id = 'DLL01';