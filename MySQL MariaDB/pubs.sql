create database pubs;
use pubs;

CREATE TABLE STORES 
   (	STOR_ID VARCHAR(4), 
	STOR_NAME VARCHAR(40), 
	STOR_ADDRESS VARCHAR(40), 
	CITY VARCHAR(20), 
	STATE VARCHAR(2 ), 
	ZIP VARCHAR(5 ),
	primary key(STOR_ID)
   );

Insert into STORES (STOR_ID,STOR_NAME,STOR_ADDRESS,CITY,STATE,ZIP) values ('6380','Eric the Read Books','788 Catamaugus Ave.','Seattle','WA','98056');
Insert into STORES (STOR_ID,STOR_NAME,STOR_ADDRESS,CITY,STATE,ZIP) values ('7066','Barnums','567 Pasadena Ave.','Tustin','CA','92789');
Insert into STORES (STOR_ID,STOR_NAME,STOR_ADDRESS,CITY,STATE,ZIP) values ('7067','News and Brews','577 First St.','Los Gatos','CA','96745');
Insert into STORES (STOR_ID,STOR_NAME,STOR_ADDRESS,CITY,STATE,ZIP) values ('7131','Doc-U-Mat: Quality Laundry and Books','24-A Avogadro Way','Remulade','WA','98014');
Insert into STORES (STOR_ID,STOR_NAME,STOR_ADDRESS,CITY,STATE,ZIP) values ('7896','Fricative Bookshop','89 Madison St.','Fremont','CA','90019');
Insert into STORES (STOR_ID,STOR_NAME,STOR_ADDRESS,CITY,STATE,ZIP) values ('8042','Bookbeat','679 Carson St.','Portland','OR','89076');


CREATE TABLE SALES
   (	STOR_ID VARCHAR(7), 
	ORD_NUM VARCHAR(20 ), 
	ORDDATE DATE, 
	QTY int, 
	PAYTERMS VARCHAR(12), 
	TITLE_ID VARCHAR(11 )
   );

Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('6380','6871','94-9-14',5,'Net 60','BU1032');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('6380','722a','94-9-13',3,'Net 60','PS2091');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7066','A2976','93-5-24',50,'Net 30','PC8888');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7066','QA7442.3','94-9-13',75,'ON invoice','PS2091');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7067','D4482','94-9-14',10,'Net 60','PS2091');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7067','P2121','692-6-15',40,'Net 30','TC3218');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7067','P2121','92-6-15',20,'Net 30','TC4203');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7067','P2121','92-6-15',20,'Net 30','TC7777');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7131','N914008','94-9-14',20,'Net 30','PS2091');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7131','N914014','94-9-14',25,'Net 30','MC3021');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7131','P3087a','93-5-29',20,'Net 60','PS1372');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7131','P3087a','93-5-29',25,'Net 60','PS2106');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7131','P3087a','93-5-29',15,'Net 60','PS3333');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7131','P3087a','93-5-29',25,'Net 60','PS7777');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7896','QQ2299','93-10-28',15,'Net 60','BU7832');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7896','TQ456','93-12-12',10,'Net 60','MC2222');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('7896','X999','93-2-21',35,'ON invoice','BU2075');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('8042','423LL922','94-9-14',5,'ON invoice','MC3021');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('8042','423LL930','94-9-14',10,'ON invoice','BU1032');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('8042','P723','93-3-11',25,'Net 30','BU1111');
Insert into SALES (STOR_ID,ORD_NUM,ORDDATE,QTY,PAYTERMS,TITLE_ID) values ('8042','QA879.1','93-5-22',30,'Net 30','PC1035');

CREATE TABLE PUBLISHERS
   (	PUB_ID VARCHAR(5),
	PUB_NAME VARCHAR(40), 
	CITY VARCHAR(20), 
	STATE VARCHAR(5), 
	COUNTRY VARCHAR(30),
	primary key(PUB_ID)
   );

Insert into PUBLISHERS (PUB_ID,PUB_NAME,CITY,STATE,COUNTRY) values ('736  ','New Moon Books','Boston','MA','USA');
Insert into PUBLISHERS (PUB_ID,PUB_NAME,CITY,STATE,COUNTRY) values ('877  ','Binnet and Hardley','Washington','DC','USA');
Insert into PUBLISHERS (PUB_ID,PUB_NAME,CITY,STATE,COUNTRY) values ('1389','Algodata Infosystems','Berkeley','CA','USA');
Insert into PUBLISHERS (PUB_ID,PUB_NAME,CITY,STATE,COUNTRY) values ('1622','Five Lakes Publishing','Chicago','IL','USA');
Insert into PUBLISHERS (PUB_ID,PUB_NAME,CITY,STATE,COUNTRY) values ('1756','Ramona Publishers','Dallas','TX','USA');
Insert into PUBLISHERS (PUB_ID,PUB_NAME,CITY,STATE,COUNTRY) values ('9901','GGG and G','Mìnchen',NULL,'Germany');
Insert into PUBLISHERS (PUB_ID,PUB_NAME,CITY,STATE,COUNTRY) values ('9952','Scootney Books','New York','NY','USA');
Insert into PUBLISHERS (PUB_ID,PUB_NAME,CITY,STATE,COUNTRY) values ('9999','Lucerne Publishing','Paris',NULL,'France');
 
CREATE TABLE titleauthor 
   (	AU_ID VARCHAR(11), 
	TITLE_ID VARCHAR(7), 
	AU_ORD int, 
	ROYALTYPER int
   );

Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('172-32-1176','PS3333',1,100);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('213-46-8915','BU1032',2,40);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('213-46-8915','BU2075',1,100);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('238-95-7766','PC1035',1,100);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('267-41-2394','BU1111',2,40);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('267-41-2394','TC7777',2,30);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('274-80-9391','BU7832',1,100);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('409-56-7008','BU1032',1,60);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('427-17-2319','PC8888',1,50);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('472-27-2349','TC7777',3,30);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('486-29-1786','PC9999',1,100);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('486-29-1786','PS7777',1,100);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('648-92-1872','TC4203',1,100);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('672-71-3249','TC7777',1,40);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('712-45-1867','MC2222',1,100);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('722-51-5454','MC3021',1,75);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('724-80-9391','BU1111',1,60);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('724-80-9391','PS1372',2,25);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('756-30-7391','PS1372',1,75);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('807-91-6654','TC3218',1,100);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('846-92-7186','PC8888',2,50);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('899-46-2035','MC3021',2,25);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('899-46-2035','PS2091',2,50);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('998-72-3567','PS2091',1,50);
Insert into titleauthor (AU_ID,TITLE_ID,AU_ORD,ROYALTYPER) values ('998-72-3567','PS2106',1,100);

CREATE TABLE authors
   (
	au_id VARCHAR(11) NOT NULL,
	au_lname VARCHAR(40),
	au_fname VARCHAR(20),
	phone VARCHAR(12),
	address VARCHAR(40),
	city VARCHAR(20),
	state VARCHAR(2),
	zip VARCHAR(7),
	contract int, 
	primary key(au_id)
   );

Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('172-32-1176','White','Johnson','408 496-7223','10932 Bigge Rd.','Menlo Park','CA','94 025 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('213-46-8915','Green','Marjorie','415 986-7020','309 63rd St. #411','Oakland','CA','94 618 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('238-95-7766','Carson','Cheryl','415 548-7723','589 Darwin Ln.','Berkeley','CA','94 705 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('274-80-9391','Straight','Dean','415 834-2919','5420 College Av.','Oakland','CA','94 609 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('341-22-1782','Smith','Meander','913 843-0462','10 Mississippi Dr.','Lawrence','KS','66 044 ',0);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('409-56-7008','Bennet','Abraham','415 658-9932','6223 Bateman St.','Berkeley','CA','94 705 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('427-17-2319','Dull','Ann','415 836-7128','3410 Blonde St.','Palo Alto','CA','94 301 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('472-27-2349','Gringlesby','Burt','707 938-6445','PO Box 792','Covelo','CA','95 428 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('486-29-1786','Locksley','Charlene','415 585-4620','18 Broadway Av.','San Francisco','CA','94 130 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('527-72-3246','Greene','Morningstar','615 297-2723','22 Graybar House Rd.','Nashville','TN','37 215 ',0);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('648-92-1872','Blotchet-Halls','Reginald','503 745-6402','55 Hillsdale Bl.','Corvallis','OR','97 330 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('672-71-3249','Yokomoto','Akiko','415 935-4228','3 Silver Ct.','Walnut Creek','CA','94 595 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('712-45-1867','del Castillo','Innes','615 996-8275','2286 Cram Pl. #86','Ann Arbor','MI','48 105 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('722-51-5454','DeFrance','Michel','219 547-9982','3 Balding Pl.','Gary','IN','46 403 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('724-08-9931','Stringer','Dirk','415 843-2991','5420 Telegraph Av.','Oakland','CA','94 609 ',0);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('724-80-9391','MacFeather','Stearns','415 354-7128','44 Upland Hts.','Oakland','CA','94 612 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('756-30-7391','Karsen','Livia','415 534-9219','5720 McAuley St.','Oakland','CA','94 609 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('807-91-6654','Panteley','Sylvia','301 946-8853','1956 Arlington Pl.','Rockville','MD','20 853 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('846-92-7186','Hunter','Sheryl','415 836-7128','3410 Blonde St.','Palo Alto','CA','94 301 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('893-72-1158','McBadden','Heather','707 448-4982','301 Putnam','Vacaville','CA','95 688 ',0);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('899-46-2035','Ringer','Anne','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84 152 ',1);
Insert into AUTHORS (AU_ID,AU_LNAME,AU_FNAME,PHONE,ADDRESS,CITY,STATE,ZIP,CONTRACT) values ('998-72-3567','Ringer','Albert','801 826-0752','67 Seventh Av.','Salt Lake City','UT','84 152 ',1);

CREATE TABLE TITLES
   (	TITLE_ID VARCHAR(7), 
	TITLE VARCHAR(80), 
	TYPE VARCHAR(14), 
	pub_id VARCHAR(5), 
	PRICE int, 
	ADVANCE int, 
	ROYALTY int, 
	YTD_SALES int, 
	NOTES VARCHAR(200), 
	PUBDATE DATE,
	primary key(TITLE_ID)
   );

insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('BU1032','The Busy Executives Database Guide','business    ','1389',20,5000,10,4095,'An overview of available database systems with emphasis on common business applications. Illustrated.','1991-6-16');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('BU1111','Cooking with Computers: Surreptitious Balance Sheets','business    ','1389',12,5000,10,3876,'Helpful hints on how to use your electronic resources to the best advantage.','1991-6-9');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('BU7832','Straight Talk About Computers','business    ','1389',20,5000,10,4095,'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.','1991-6-22');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('MC2222','Silicon Valley Gastronomic Treats','mod_cook    ','877',20,0,12,2032,'Favorite recipes for quick, easy, and elegant meals.','1991-6-9');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('MC3021','The Gourmet Microwave','mod_cook    ','877',3,15000,24,22246,'Traditional French gourmet recipes adapted for modern microwave cooking.','1991-6-18');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('PC1035','But Is It User Friendly?','popular_comp','1389',23,7000,16,8780,'A survey of software for the naive user, focusing on the friendliness of each.','1991-6-30');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('PC8888','Secrets of Silicon Valley','popular_comp','1389',20,8000,10,4095,'Muckraking reporting on the worlds largest computer hardware and software manufacturers.','1994-6-12');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('PS1372','Computer Phobic AND Non-Phobic Individuals: Behavior Variations','psychology  ','877',216,7000,10,375,'A must for the specialist, this book examines the difference between those who hate and fear computers and those who dont.','1991-10-21');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('PS2091','Is Anger the Enemy?','psychology  ','736',11,2275,12,2045,'Carefully researched study of the effects of strong emotions on the body. Metabolic charts included.','1991-6-15');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('PS2106','Life Without Fear','psychology  ','736',7,6000,10,111,'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience. Sample menus included, exercise video available separately.','1991-10-5');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('PS3333','Prolonged Data Deprivation: Four Case Studies','psychology  ','736',20,2000,10,4072,'What happens when the data runs dry?  Searching evaluations of information-shortage effects.','1991-6-12');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('PS7777','Emotional Security: A New Algorithm','psychology  ','736',8,4000,10,3336,'Protecting yourself and your loved ones from undue emotional stress in the modern world. Use of computer and nutritional aids emphasized.','1991-6-12');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('TC3218','Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean','trad_cook   ','877',21,7000,10,375,'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.','1991-10-21');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('TC4203','Fifty Years in Buckingham Palace Kitchens','trad_cook   ','877',12,4000,14,15096,'More anecdotes from the Queens favorite cook describing life among English royalty. Recipes, techniques, tender vignettes.','1991-06-12');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('TC7777','Sushi, Anyone?','trad_cook   ','877',15,8000,10,4095,'Detailed instructions on how to make authentic Japanese sushi in your spare time.','1991-6-12');
insert into TITLES (TITLE_ID,TITLE,TYPE,pub_id,PRICE,ADVANCE,ROYALTY,YTD_SALES,NOTES,PUBDATE) VALUES('BU2075','You Can Combat Computer Stress!','business    ','736',3,10125,24,18722,'The latest medical and psychological techniques for living with the electronic office. Easy-to-understand explanations.','1991-6-30');

