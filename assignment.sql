USE assignment;


CREATE TABLE salespeople
    -> (snum INT Primary key,
    -> sname VARCHAR(20) Unique,
    -> city VARCHAR(20)
    -> );


CREATE TABLE customer
    -> (cnum INT Primary key,
    -> cname VARCHAR(20),
    -> city VARCHAR(20) NOT NULL,
    -> snum INT,
    -> FOREIGN KEY(snum)REFERENCES salespeople(snum) ON DELETE SET NULL
    -> );



 CREATE TABLE orders
    -> (onum INT Primary key,
    -> Amt INT,
    -> Odate DATE,
    -> cnum INT,
    -> snum INT,
    -> FOREIGN KEY(cnum) REFERENCES customer(cnum) ON DELETE SET NULL,
    -> FOREIGN KEY(snum) REFERENCES salespeople(snum) ON DELETE SET NULL
    -> );

 SHOW TABLES;
+----------------------+
| Tables_in_assignment |
+----------------------+
| customer             |
| orders               |
| salespeople          |
+----------------------+


 INSERT INTO salespeople VALUES
    -> (1001,"Peel","London"),
    -> (1002,"Serres","Sanjose"),
    -> (1004,"Motika","London"),
    -> (1007,"Rifkin","Barcelona"),
    -> (1003,"Axelrod","Newyork")
    -> ;

 SELECT * FROM salespeople;
+------+---------+-----------+
| snum | sname   | city      |
+------+---------+-----------+
| 1001 | Peel    | London    |
| 1002 | Serres  | Sanjose   |
| 1003 | Axelrod | Newyork   |
| 1004 | Motika  | London    |
| 1007 | Rifkin  | Barcelona |
+------+---------+-----------+



 INSERT INTO customer VALUES
    -> (2001,"Hoffman","London",1001),
    -> (2002,"Giovanni","Rome",1003),
    -> (2003,"Liu","Sanjose",1002),
    -> (2004,"Grass","Berlin",1002),
    -> (2006,"Clemens","London",1001),
    -> (2008,"Cisneros","Sanjos",1007),
    -> (2007,"Pereira","Rome",1004)
    -> ;


 SELECT * FROM customer;
+------+----------+---------+------+
| cnum | cname    | city    | snum |
+------+----------+---------+------+
| 2001 | Hoffman  | London  | 1001 |
| 2002 | Giovanni | Rome    | 1003 |
| 2003 | Liu      | Sanjose | 1002 |
| 2004 | Grass    | Berlin  | 1002 |
| 2006 | Clemens  | London  | 1001 |
| 2007 | Pereira  | Rome    | 1004 |
| 2008 | Cisneros | Sanjos  | 1007 |
+------+----------+---------+------+



 INSERT INTO orders VALUES
    -> (3001,18.69,"1990-10-3",2008,1007),
    -> (3003,767.19,"1990-10-3",2001,1001),
    -> (3002,1900.10,"1990-10-3",2007,1004),
    -> (3005,5160.45,"1990-10-3",2003,1002),
    -> (3006,1098.16,"1990-10-3",2008,1007),
    -> (3009,1713.23,"1990-10-4",2002,1003),
    -> (3007,75.75,"1990-10-4",2004,1002),
    -> (3008,4273.00,"1990-10-5",2006,1001),
    -> (3010,1309.95,"1990-10-6",2004,1002),
    -> (3011,9891.88,"1990-10-6",2006,1001)
    -> ;
   

 SELECT * FROM orders;
+------+------+------------+------+------+
| onum | Amt  | Odate      | cnum | snum |
+------+------+------------+------+------+
| 3001 |   19 | 1990-10-03 | 2008 | 1007 |
| 3002 | 1900 | 1990-10-03 | 2007 | 1004 |
| 3003 |  767 | 1990-10-03 | 2001 | 1001 |
| 3005 | 5160 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098 | 1990-10-03 | 2008 | 1007 |
| 3007 |   76 | 1990-10-04 | 2004 | 1002 |
| 3008 | 4273 | 1990-10-05 | 2006 | 1001 |
| 3009 | 1713 | 1990-10-04 | 2002 | 1003 |
| 3010 | 1310 | 1990-10-06 | 2004 | 1002 |
| 3011 | 9892 | 1990-10-06 | 2006 | 1001 |
+------+------+------------+------+------+


###QUESTION.1.

SELECT COUNT(*) FROM salespeople WHERE sname LIKE "a%" OR "A%";
+----------+
| COUNT(*) |
+----------+
|        1 |
+----------+

 SELECT sname ,COUNT(*) FROM salespeople WHERE sname LIKE "a%" OR "A%";
+---------+----------+
| sname   | COUNT(*) |
+---------+----------+
| Axelrod |        1 |
+---------+----------+


###QUESTION.2.

 SELECT snum FROM orders WHERE Amt>2000;
+------+
| snum |
+------+
| 1002 |
| 1001 |
| 1001 |
+------+


 SELECT sname FROM salespeople WHERE snum BETWEEN 1001 AND 1002;
+--------+
| sname  |
+--------+
| Peel   |
| Serres |
+--------+

###QUESTION.3.

 SELECT COUNT(sname) FROM salespeople WHERE city="Newyork";
+--------------+
| COUNT(sname) |
+--------------+
|            1 |
+--------------+
 SELECT sname,city, COUNT(sname) FROM salespeople WHERE city="Newyork";
+---------+---------+--------------+
| sname   | city    | COUNT(sname) |
+---------+---------+--------------+
| Axelrod | Newyork |            1 |
+---------+---------+--------------+

###QUESTION.4.

 SELECT COUNT(*) FROM salespeople WHERE city="London";
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+

SELECT sname, COUNT(*) FROM salespeople WHERE city="Paris";
+-------+----------+
| sname | COUNT(*) |
+-------+----------+
| NULL  |        0 |
+-------+----------+


###QUESTION.5.

 SELECT snum,COUNT(*),Odate FROM orders GROUP BY snum;
+------+----------+------------+
| snum | count(*) | Odate      |
+------+----------+------------+
| 1001 |        3 | 1990-10-03 |
| 1002 |        3 | 1990-10-03 |
| 1003 |        1 | 1990-10-04 |
| 1004 |        1 | 1990-10-03 |
| 1007 |        2 | 1990-10-03 |
+------+----------+------------+


