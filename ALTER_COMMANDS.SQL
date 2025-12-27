Enter password: ************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
Server version: 9.5.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| college            |
| data               |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| school             |
| student            |
| sys                |
| world              |
+--------------------+
10 rows in set (0.212 sec)

mysql> use data
Database changed
mysql> show tables;
+-------------------+
| Tables_in_data    |
+-------------------+
| tutorial_practice |
+-------------------+
1 row in set (0.443 sec)

mysql> select * from tutorial_practice;
+------+---------+
| sno  | sname   |
+------+---------+
|    1 | aravind |
|    1 | ravi    |
|    1 | ravi    |
|    2 | r       |
|    2 | s       |
|    3 | a       |
|    4 | b       |
|    5 | c       |
+------+---------+
8 rows in set (0.330 sec)

mysql> -- ADD COLUMN ---
Query OK, 0 rows affected (0.006 sec)

mysql> desc tutorial_practice;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | int         | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.371 sec)

mysql> alter table tutorial_practice
    -> add perc float;
Query OK, 0 rows affected (0.728 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc tutorial_practice;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | int         | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
| perc  | float       | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.025 sec)

mysql> --- DROP COLUMN USING ALTER ----------
    -> /C
    -> /c
    -> exit
    -> \c
mysql> alter table tutorial_practice
    -> drop column perc;
Query OK, 0 rows affected (0.134 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc tutorial_practice;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | int         | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.023 sec)

mysql> --MODIFY DATATYPE USING ALTER --
    -> \C
ERROR:
Usage: \C charset_name | charset charset_name
    -> \c
mysql> alter table tutorial_practice
    -> modify column sno float;
Query OK, 8 rows affected (0.885 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> desc tutorial_practice;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | float       | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.021 sec)

mysql> ---ADD NOT NULL ---
    -> \c
mysql> alter table tutorial_practice
    -> add perc float;
Query OK, 0 rows affected (0.474 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table tutorial_practice
    -> modify perc float not null;
ERROR 1138 (22004): Invalid use of NULL value
mysql> alter table tutorial_practice
    -> modify perc float NOT NULL;
ERROR 1138 (22004): Invalid use of NULL value
mysql> select * from tutorial_practice;
+------+---------+------+
| sno  | sname   | perc |
+------+---------+------+
|    1 | aravind | NULL |
|    1 | ravi    | NULL |
|    1 | ravi    | NULL |
|    2 | r       | NULL |
|    2 | s       | NULL |
|    3 | a       | NULL |
|    4 | b       | NULL |
|    5 | c       | NULL |
+------+---------+------+
8 rows in set (0.009 sec)

mysql> insert into tutorial_practice perc=30;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'perc=30' at line 1
mysql> INSERT INTO tutorial_practice
    -> SET perc = 30;
Query OK, 1 row affected (0.038 sec)

mysql> select * from tutorial_practice;
+------+---------+------+
| sno  | sname   | perc |
+------+---------+------+
|    1 | aravind | NULL |
|    1 | ravi    | NULL |
|    1 | ravi    | NULL |
|    2 | r       | NULL |
|    2 | s       | NULL |
|    3 | a       | NULL |
|    4 | b       | NULL |
|    5 | c       | NULL |
| NULL | NULL    |   30 |
+------+---------+------+
9 rows in set (0.009 sec)

mysql> UPDATE tutorial_practice
    -> SET perc = 30
    -> WHERE sno = 1;
Query OK, 3 rows affected (0.357 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> UPDATE tutorial_practice
    -> SET perc = 30;
Query OK, 5 rows affected (0.351 sec)
Rows matched: 9  Changed: 5  Warnings: 0

mysql> select * from tutorial_practice;
+------+---------+------+
| sno  | sname   | perc |
+------+---------+------+
|    1 | aravind |   30 |
|    1 | ravi    |   30 |
|    1 | ravi    |   30 |
|    2 | r       |   30 |
|    2 | s       |   30 |
|    3 | a       |   30 |
|    4 | b       |   30 |
|    5 | c       |   30 |
| NULL | NULL    |   30 |
+------+---------+------+
9 rows in set (0.008 sec)

mysql> delete from tutorial_practice where sno="NULL";
ERROR 1292 (22007): Truncated incorrect DOUBLE value: 'NULL'
mysql> DELETE FROM tutorial_practice
    -> WHERE sno IS NULL;
Query OK, 1 row affected (0.074 sec)

mysql> select * from tutorial_practice;
+------+---------+------+
| sno  | sname   | perc |
+------+---------+------+
|    1 | aravind |   30 |
|    1 | ravi    |   30 |
|    1 | ravi    |   30 |
|    2 | r       |   30 |
|    2 | s       |   30 |
|    3 | a       |   30 |
|    4 | b       |   30 |
|    5 | c       |   30 |
+------+---------+------+
8 rows in set (0.008 sec)

mysql> ALTER TABLE TUTORIAL_PRACTICE
    -> MODIFY PERC FLOAT NOT NULL;
Query OK, 0 rows affected (2.092 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC TUTORIAL_PRACTICE;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | float       | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
| PERC  | float       | NO   |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.022 sec)

mysql> --ADD CONSTRAINTS UNIQUE--
    -> \C
ERROR:
Usage: \C charset_name | charset charset_name
    -> \]c
ERROR:
Unknown command '\]'.
    -> \c
mysql> ALTER TABLE TUTORIAL_PRACTICE
    -> ADD EMAIL VARCHAR(40);
Query OK, 0 rows affected (0.445 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC TUTORAIL_PRACTICE;
ERROR 1146 (42S02): Table 'data.tutorail_practice' doesn't exist
mysql> DESC TUTORIAL_PRACTICE;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | float       | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
| PERC  | float       | NO   |     | NULL    |       |
| EMAIL | varchar(40) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.022 sec)

mysql> ALTER TABLE TUTORIAL_PRACTICE
    -> ADD CONSTRAINT UNIQUE(EMAIL);
Query OK, 0 rows affected (1.191 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> --ADD PRIMARY KEY CONSTRAINT--
    -> \c
mysql> ALTER TABLE TUTORIAL_PRACTICE
    -> ADD CONSTRAINT PRIAMRY KEY(SNO);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'KEY(SNO)' at line 2
mysql> ALTER TABLE TUTORIAL_PRACTICE
    -> ADD CONSTRAINT PRIAMRY KEY(sno);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'KEY(sno)' at line 2
mysql> ALTER TABLE tutorial_practice
    -> ADD PRIMARY KEY (sno);
ERROR 1062 (23000): Duplicate entry '2' for key 'tutorial_practice.PRIMARY'
mysql> desc tutorail_practice;
ERROR 1146 (42S02): Table 'data.tutorail_practice' doesn't exist
mysql> desc tutorial_practice;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | float       | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
| PERC  | float       | NO   |     | NULL    |       |
| EMAIL | varchar(40) | YES  | UNI | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.022 sec)

mysql> select * from tutorial_practice;
+------+---------+------+-------+
| sno  | sname   | PERC | EMAIL |
+------+---------+------+-------+
|    1 | aravind |   30 | NULL  |
|    1 | ravi    |   30 | NULL  |
|    1 | ravi    |   30 | NULL  |
|    2 | r       |   30 | NULL  |
|    2 | s       |   30 | NULL  |
|    3 | a       |   30 | NULL  |
|    4 | b       |   30 | NULL  |
|    5 | c       |   30 | NULL  |
+------+---------+------+-------+
8 rows in set (0.010 sec)

mysql> alter table tutorial_practice
    -> add s_id int;
Query OK, 0 rows affected (0.489 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from tutorial_practice;
+------+---------+------+-------+------+
| sno  | sname   | PERC | EMAIL | s_id |
+------+---------+------+-------+------+
|    1 | aravind |   30 | NULL  | NULL |
|    1 | ravi    |   30 | NULL  | NULL |
|    1 | ravi    |   30 | NULL  | NULL |
|    2 | r       |   30 | NULL  | NULL |
|    2 | s       |   30 | NULL  | NULL |
|    3 | a       |   30 | NULL  | NULL |
|    4 | b       |   30 | NULL  | NULL |
|    5 | c       |   30 | NULL  | NULL |
+------+---------+------+-------+------+
8 rows in set (0.008 sec)

mysql> alter table tutorial_practice
    -> add constraint primary key (s_id);
ERROR 1138 (22004): Invalid use of NULL value
mysql> update table tutorial_practice
    -> set s_id=109810 where sname="aravind";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table tutorial_practice
set s_id=109810 where sname="aravind"' at line 1
mysql> UPDATE tutorial_practice
    -> SET s_id = 109810
    -> WHERE sname = 'aravind';
Query OK, 1 row affected (0.378 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from tutorial_practice;
+------+---------+------+-------+--------+
| sno  | sname   | PERC | EMAIL | s_id   |
+------+---------+------+-------+--------+
|    1 | aravind |   30 | NULL  | 109810 |
|    1 | ravi    |   30 | NULL  |   NULL |
|    1 | ravi    |   30 | NULL  |   NULL |
|    2 | r       |   30 | NULL  |   NULL |
|    2 | s       |   30 | NULL  |   NULL |
|    3 | a       |   30 | NULL  |   NULL |
|    4 | b       |   30 | NULL  |   NULL |
|    5 | c       |   30 | NULL  |   NULL |
+------+---------+------+-------+--------+
8 rows in set (0.008 sec)

mysql> alter table tutorial_practice
    -> modify s_id int NOT NULL AUTO INCREMENT;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO INCREMENT' at line 2
mysql> UPDATE tutorial_practice
    -> SET s_id = NULL;
Query OK, 1 row affected (0.406 sec)
Rows matched: 8  Changed: 1  Warnings: 0

mysql> select * from tutorial_practice;
+------+---------+------+-------+------+
| sno  | sname   | PERC | EMAIL | s_id |
+------+---------+------+-------+------+
|    1 | aravind |   30 | NULL  | NULL |
|    1 | ravi    |   30 | NULL  | NULL |
|    1 | ravi    |   30 | NULL  | NULL |
|    2 | r       |   30 | NULL  | NULL |
|    2 | s       |   30 | NULL  | NULL |
|    3 | a       |   30 | NULL  | NULL |
|    4 | b       |   30 | NULL  | NULL |
|    5 | c       |   30 | NULL  | NULL |
+------+---------+------+-------+------+
8 rows in set (0.010 sec)

mysql> ALTER TABLE tutorial_practice
    -> MODIFY s_id INT AUTO_INCREMENT;
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> SHOW KEYS FROM tutorial_practice;
+-------------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table             | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| tutorial_practice |          0 | EMAIL    |            1 | EMAIL       | A         |           1 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+-------------------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
1 row in set (0.086 sec)

mysql> --ADD CONSTRAINT CHECK--
    -> \C
ERROR:
Usage: \C charset_name | charset charset_name
    -> \c
mysql> alter table tutorial_practice
    -> add constraint check (age>18);
ERROR 1054 (42S22): Unknown column 'age' in 'check constraint tutorial_practice_chk_1 expression'
mysql> select * from tutorial_practice;
+------+---------+------+-------+------+
| sno  | sname   | PERC | EMAIL | s_id |
+------+---------+------+-------+------+
|    1 | aravind |   30 | NULL  | NULL |
|    1 | ravi    |   30 | NULL  | NULL |
|    1 | ravi    |   30 | NULL  | NULL |
|    2 | r       |   30 | NULL  | NULL |
|    2 | s       |   30 | NULL  | NULL |
|    3 | a       |   30 | NULL  | NULL |
|    4 | b       |   30 | NULL  | NULL |
|    5 | c       |   30 | NULL  | NULL |
+------+---------+------+-------+------+
8 rows in set (0.009 sec)

mysql> alter table tutorial_practice
    -> add age int ;
Query OK, 0 rows affected (0.203 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table tutorial_practice
    -> add constraint check (age>18);
Query OK, 8 rows affected (0.513 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> desc tutorial_practice;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | float       | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
| PERC  | float       | NO   |     | NULL    |       |
| EMAIL | varchar(40) | YES  | UNI | NULL    |       |
| s_id  | int         | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
6 rows in set (0.021 sec)

mysql> --DROP CONSTRAINT --
    -> \c
mysql> alter table tutorial_practice
    -> drop index EMAIL;
Query OK, 0 rows affected (0.180 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> --above example is drop constraint for unique keys example
    -> \c
mysql> select * from tutorial_practice
    -> ;
+------+---------+------+-------+------+------+
| sno  | sname   | PERC | EMAIL | s_id | age  |
+------+---------+------+-------+------+------+
|    1 | aravind |   30 | NULL  | NULL | NULL |
|    1 | ravi    |   30 | NULL  | NULL | NULL |
|    1 | ravi    |   30 | NULL  | NULL | NULL |
|    2 | r       |   30 | NULL  | NULL | NULL |
|    2 | s       |   30 | NULL  | NULL | NULL |
|    3 | a       |   30 | NULL  | NULL | NULL |
|    4 | b       |   30 | NULL  | NULL | NULL |
|    5 | c       |   30 | NULL  | NULL | NULL |
+------+---------+------+-------+------+------+
8 rows in set (0.010 sec)

mysql> desc tutorial_practice;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | float       | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
| PERC  | float       | NO   |     | NULL    |       |
| EMAIL | varchar(40) | YES  |     | NULL    |       |
| s_id  | int         | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
6 rows in set (0.021 sec)

mysql> --drop primary key--
    -> \c
mysql> alter table tutorial_practice
    -> drop primary key;
ERROR 1091 (42000): Can't DROP 'PRIMARY'; check that column/key exists
mysql> alter table tutorial_practice
    -> add constraint primary key (s_id);
ERROR 1138 (22004): Invalid use of NULL value
mysql> update tutorial_practice
    -> add s_id= 0 where sname="aravind";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'add s_id= 0 where sname="aravind"' at line 2
mysql> update tutorial_practice
    -> set s_id= 0 where sname="aravind";
Query OK, 1 row affected (0.108 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from tutorial_practice;
+------+---------+------+-------+------+------+
| sno  | sname   | PERC | EMAIL | s_id | age  |
+------+---------+------+-------+------+------+
|    1 | aravind |   30 | NULL  |    0 | NULL |
|    1 | ravi    |   30 | NULL  | NULL | NULL |
|    1 | ravi    |   30 | NULL  | NULL | NULL |
|    2 | r       |   30 | NULL  | NULL | NULL |
|    2 | s       |   30 | NULL  | NULL | NULL |
|    3 | a       |   30 | NULL  | NULL | NULL |
|    4 | b       |   30 | NULL  | NULL | NULL |
|    5 | c       |   30 | NULL  | NULL | NULL |
+------+---------+------+-------+------+------+
8 rows in set (0.009 sec)

mysql> update tutorial_practice
    -> modify s_id int auto increment;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 's_id int auto increment' at line 2
mysql> ALTER TABLE tutorial_practice
    -> MODIFY s_id INT AUTO_INCREMENT;
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> alter table tutorial_practice
    -> add constraint primary key (s_id);
ERROR 1138 (22004): Invalid use of NULL value
mysql> drop table tutorial_practice where sname ="ravi";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where sname ="ravi"' at line 1
mysql> DELETE FROM tutorial_practice
    -> WHERE sname = 'ravi';
Query OK, 2 rows affected (0.994 sec)

mysql> update tutorial_practice
    -> set s_id = 1 where sname = "r",
    -> set s_id =2 where sname ="s" ,
    -> set s_id =3 where sname ="a",
    -> set s_id = 4 where sname ="b" ,
    -> set s_id =5 where sname ="c" ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',
set s_id =2 where sname ="s" ,
set s_id =3 where sname ="a",
set s_id = 4 wher' at line 2
mysql> UPDATE tutorial_practice SET s_id = 1 WHERE sname = 'r';
Query OK, 1 row affected (0.109 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE tutorial_practice SET s_id = 2 WHERE sname = 's';
Query OK, 1 row affected (0.019 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE tutorial_practice SET s_id = 3 WHERE sname = 'a';
Query OK, 1 row affected (0.018 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE tutorial_practice SET s_id = 4 WHERE sname = 'b';
Query OK, 1 row affected (0.055 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE tutorial_practice SET s_id = 5 WHERE sname = 'c';
Query OK, 1 row affected (0.018 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from tutorial_practice;
+------+---------+------+-------+------+------+
| sno  | sname   | PERC | EMAIL | s_id | age  |
+------+---------+------+-------+------+------+
|    1 | aravind |   30 | NULL  |    0 | NULL |
|    2 | r       |   30 | NULL  |    1 | NULL |
|    2 | s       |   30 | NULL  |    2 | NULL |
|    3 | a       |   30 | NULL  |    3 | NULL |
|    4 | b       |   30 | NULL  |    4 | NULL |
|    5 | c       |   30 | NULL  |    5 | NULL |
+------+---------+------+-------+------+------+
6 rows in set (0.008 sec)

mysql> alter table tutorial_practice
    -> add constraint primary key (s_id);
Query OK, 0 rows affected (0.563 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc tutorial_practice;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | float       | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
| PERC  | float       | NO   |     | NULL    |       |
| EMAIL | varchar(40) | YES  |     | NULL    |       |
| s_id  | int         | NO   | PRI | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
6 rows in set (0.020 sec)

mysql> --now drop primary key---
    -> \c
mysql> alter table tutorial_practice
    -> drop constraint primary key(s_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primary key(s_id)' at line 2
mysql> alter table tutorial_practice
    -> drop constraint primary key (s_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'primary key (s_id)' at line 2
mysql> ALTER TABLE tutorial_practice
    -> DROP PRIMARY KEY;
Query OK, 6 rows affected (0.344 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql>
