Enter password: ************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
Server version: 9.5.0 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database data;
Query OK, 1 row affected (0.410 sec)

mysql> use data;
Database changed
mysql> show data;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'data' at line 1
mysql> show tables;
Empty set (0.029 sec)

mysql> create table tutorial_practice(
    -> sno int,
    -> sname varchar(30);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 3
mysql> create table tutorial_practice(
    -> sno int,
    -> sname varchar(30));
Query OK, 0 rows affected (0.587 sec)

mysql> select sno , sname FROM tutorial_practice;
Empty set (0.020 sec)

mysql> insert into tutorial_practice values(1, 'aravind');
Query OK, 1 row affected (0.428 sec)

mysql> select sno , sname FROM tutorial_practice;
+------+---------+
| sno  | sname   |
+------+---------+
|    1 | aravind |
+------+---------+
1 row in set (0.007 sec)

mysql> select * from tutorial_practice;
+------+---------+
| sno  | sname   |
+------+---------+
|    1 | aravind |
+------+---------+
1 row in set (0.009 sec)

mysql> insert into tutorial_practice values (1, 'ravi');
Query OK, 1 row affected (0.354 sec)

mysql> select * from tutorial_practice;
+------+---------+
| sno  | sname   |
+------+---------+
|    1 | aravind |
|    1 | ravi    |
+------+---------+
2 rows in set (0.008 sec)

mysql> select distnict sno , sname from tutorial_practice;
ERROR 1054 (42S22): Unknown column 'distnict' in 'field list'
mysql> select distinct sno , sname from tutorial_practice;
+------+---------+
| sno  | sname   |
+------+---------+
|    1 | aravind |
|    1 | ravi    |
+------+---------+
2 rows in set (0.317 sec)

mysql> insert into tutorial_practice values (1, 'ravi');
Query OK, 1 row affected (0.391 sec)

mysql> select distinct sno , sname from tutorial_practice;
+------+---------+
| sno  | sname   |
+------+---------+
|    1 | aravind |
|    1 | ravi    |
+------+---------+
2 rows in set (0.011 sec)

mysql> select distinct sname from tutorial_practice;
+---------+
| sname   |
+---------+
| aravind |
| ravi    |
+---------+
2 rows in set (0.008 sec)

mysql> select distinct sno from tutorial_practice;
+------+
| sno  |
+------+
|    1 |
+------+
1 row in set (0.007 sec)

mysql> select * from tutorial_practice
    -> WHERE sname="aravind";
+------+---------+
| sno  | sname   |
+------+---------+
|    1 | aravind |
+------+---------+
1 row in set (0.318 sec)

mysql> insert into tutorial_practice values(
    -> 2,'r');
Query OK, 1 row affected (0.361 sec)

mysql> insert into tutorial_practice values( 2, 's');
Query OK, 1 row affected (0.352 sec)

mysql> insert into tutorial_practice values(3,'a');
Query OK, 1 row affected (0.069 sec)

mysql> insert into tutorial_practice values(4 , 'b');
Query OK, 1 row affected (0.064 sec)

mysql> insert into tutorial_practice values (5 ,'c');
Query OK, 1 row affected (0.761 sec)

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
8 rows in set (0.008 sec)

mysql> select sno ,sname from tutorial_practice where sno<1);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> select sno ,sname from tutorial_practice where sno<1 ;
Empty set (0.011 sec)

mysql> select sno ,sname from tutorial_practice where sno<2 ;
+------+---------+
| sno  | sname   |
+------+---------+
|    1 | aravind |
|    1 | ravi    |
|    1 | ravi    |
+------+---------+
3 rows in set (0.010 sec)

mysql> select * from tutorial_practice ORDER BY sno DESC;
+------+---------+
| sno  | sname   |
+------+---------+
|    5 | c       |
|    4 | b       |
|    3 | a       |
|    2 | r       |
|    2 | s       |
|    1 | aravind |
|    1 | ravi    |
|    1 | ravi    |
+------+---------+
8 rows in set (0.013 sec)

mysql> select * from tutorial_practice ORDER BY sno;
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
8 rows in set (0.015 sec)

mysql>
