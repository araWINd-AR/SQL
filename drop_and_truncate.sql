Enter password: ************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 9.5.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database drop_turncate_example;
Query OK, 1 row affected (0.145 sec)

mysql> use drop_turncate_example;
Database changed
mysql> create table data
    -> (sid int,
    -> sname varchar(30)
    -> perc float);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'perc float)' at line 4
mysql> create table data(
    -> sid int,
    -> sname varchar(30),
    -> perc float);
Query OK, 0 rows affected (0.242 sec)

mysql> show tables;
+---------------------------------+
| Tables_in_drop_turncate_example |
+---------------------------------+
| data                            |
+---------------------------------+
1 row in set (0.030 sec)

mysql> desc data;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sid   | int         | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
| perc  | float       | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
3 rows in set (0.029 sec)

mysql> insert into data values( 1, "aravind" ,99 ),
    -> (2, "gani", 98);
Query OK, 2 rows affected (0.104 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> --now use drop --
    -> \c
mysql> drop table data;
Query OK, 0 rows affected (0.198 sec)

mysql> select * from data;
ERROR 1146 (42S02): Table 'drop_turncate_example.data' doesn't exist
mysql> show tables;
Empty set (0.023 sec)

mysql>  create table data(
    ->     -> sid int,
    ->     -> sname varchar(30),
    ->     -> perc float);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> sid int,
    -> sname varchar(30),
    -> perc float)' at line 2
mysql>  create table data(
    ->  sid int,
    ->  sname varchar(30);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> CREATE TABLE data (
    ->     sid INT,
    ->     sname VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.167 sec)

mysql> show tables;
+---------------------------------+
| Tables_in_drop_turncate_example |
+---------------------------------+
| data                            |
+---------------------------------+
1 row in set (0.017 sec)

mysql> insert into data values( 1, "aravind" ,99 ),
    -> (2, "gani", 98);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into data values (1, "aravind" ,99),
    ->
    ->
    ->
    ->
    ->
    ->
    ->
    ->
    ->
    -> (2, "gani" ,90
    -> );
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO data VALUES
    -> (1, 'aravind'),
    -> (2, 'gani');
Query OK, 2 rows affected (0.074 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from data;
+------+---------+
| sid  | sname   |
+------+---------+
|    1 | aravind |
|    2 | gani    |
+------+---------+
2 rows in set (0.008 sec)

mysql> desc data;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sid   | int         | YES  |     | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.019 sec)

mysql> truncate table data;
Query OK, 0 rows affected (0.311 sec)

mysql> show tables;
+---------------------------------+
| Tables_in_drop_turncate_example |
+---------------------------------+
| data                            |
+---------------------------------+
1 row in set (0.017 sec)

mysql> select * from data;
Empty set (0.015 sec)

mysql>
