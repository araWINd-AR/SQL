mysql> create database school;
Query OK, 1 row affected (0.960 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| school             |
| student            |
| sys                |
| world              |
+--------------------+
8 rows in set (0.017 sec)

mysql> use school database;
Database changed

mysql> show tables;
Empty set (0.018 sec)

mysql> create table student(
    -> sno int,
    -> sname varchar(30),
    -> branch varchar(30),
    -> perc float);
Query OK, 0 rows affected (0.261 sec)

mysql> show tables;
+------------------+
| Tables_in_school |
+------------------+
| student          |
+------------------+
1 row in set (0.017 sec)

mysql> select * from student;
Empty set (0.025 sec)

mysql> DESC student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| sno    | int         | YES  |     | NULL    |       |
| sname  | varchar(30) | YES  |     | NULL    |       |
| branch | varchar(30) | YES  |     | NULL    |       |
| perc   | float       | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.024 sec)

mysql> insert into student values ( 1, 'aravind' , 'ece' , 99);
Query OK, 1 row affected (0.081 sec)

mysql> select * from student;
+------+---------+--------+------+
| sno  | sname   | branch | perc |
+------+---------+--------+------+
|    1 | aravind | ece    |   99 |
+------+---------+--------+------+
1 row in set (0.011 sec)

mysql> INSERT INTO student VALUES
    -> (2, 'ravi', 'ece', 99),
    -> (3, 'srinu', 'cs', 98),
    -> (4, 'hema', 'ai', 96);
Query OK, 3 rows affected (0.082 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> select * from student;
+------+---------+--------+------+
| sno  | sname   | branch | perc |
+------+---------+--------+------+
|    1 | aravind | ece    |   99 |
|    2 | ravi    | ece    |   99 |
|    3 | srinu   | cs     |   98 |
|    4 | hema    | ai     |   96 |
+------+---------+--------+------+
4 rows in set (0.008 sec)

mysql> desc student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| sno    | int         | YES  |     | NULL    |       |
| sname  | varchar(30) | YES  |     | NULL    |       |
| branch | varchar(30) | YES  |     | NULL    |       |
| perc   | float       | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.028 sec)

mysql>
