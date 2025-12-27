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
8 rows in set (0.009 sec)

mysql> use database school;
ERROR 1049 (42000): Unknown database 'database'
mysql> use school;
Database changed
mysql> show tables;
+------------------+
| Tables_in_school |
+------------------+
| student          |
+------------------+
1 row in set (0.022 sec)

mysql> select * from student;
+------+---------+--------+------+
| sno  | sname   | branch | perc |
+------+---------+--------+------+
|    1 | aravind | ece    |   99 |
|    2 | ravi    | ece    |   99 |
|    3 | srinu   | cs     |   98 |
|    4 | hema    | ai     |   96 |
+------+---------+--------+------+
4 rows in set (0.010 sec)

mysql> create database college;
Query OK, 1 row affected (0.133 sec)

mysql> use college;
Database changed
mysql> show tables;
Empty set (0.019 sec)

mysql> create table student(
    -> sno int (pk)
    -> ,
    -> sname varchar(30);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'pk)
,
sname varchar(30)' at line 2
mysql> CREATE TABLE student (
    ->     sno INT,
    ->     sname VARCHAR(30),
    ->     PRIMARY KEY (sno)
    -> );
Query OK, 0 rows affected (0.227 sec)

mysql> desc student
    -> desc student ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desc student' at line 2
mysql> desc student ;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sno   | int         | NO   | PRI | NULL    |       |
| sname | varchar(30) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.024 sec)

mysql> create table student(
    -> branch varchar(30)
    -> NOT NULL(branch);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(branch)' at line 3
mysql> CREATE TABLE student (
    ->     branch VARCHAR(30) NOT NULL
    -> );
ERROR 1050 (42S01): Table 'student' already exists
mysql> alter table student
    -> CREATE TABLE student (
    ->     branch VARCHAR(30) NOT NULL
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CREATE TABLE student (
    branch VARCHAR(30) NOT NULL
)' at line 2
mysql> alter table student
    -> add branch varachar(30) NOT NULL );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'varachar(30) NOT NULL )' at line 2
mysql> ALTER TABLE student
    -> MODIFY branch VARCHAR(30) NOT NULL;
ERROR 1054 (42S22): Unknown column 'branch' in 'student'
mysql> ALTER TABLE student
    -> ADD COLUMN branch VARCHAR(30) NOT NULL;
Query OK, 0 rows affected (0.350 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc student;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| sno    | int         | NO   | PRI | NULL    |       |
| sname  | varchar(30) | YES  |     | NULL    |       |
| branch | varchar(30) | NO   |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.012 sec)

mysql> ALTER TABLE student
    -> add age int check (age <15 ) ;
Query OK, 0 rows affected (0.942 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE student
    -> add clg varchar(20) default ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql> add clg varchar(20) DEFAULT 'VRSEC' ;
Query OK, 0 rows affected (0.596 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE STUDENT
    -> add pno varchar(30) unique;
Query OK, 0 rows affected (0.270 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table course(
    -> cid int ,
    -> cname varchar(30)
    -> primary key (cid);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(cid)' at line 4
mysql> CREATE TABLE course (
    ->     cid INT,
    ->     cname VARCHAR(30),
    ->     PRIMARY KEY (cid)
    -> );
Query OK, 0 rows affected (0.163 sec)

mysql>
mysql> alter table student
    -> add cid int ,
    -> Foreign key (cid) references course (cid));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Foreign key (cid) references course (cid))' at line 3
mysql> ALTER TABLE student
    -> ADD cid int,
    -> FOREIGN KEY (cid) REFERENCES course(cid)
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FOREIGN KEY (cid) REFERENCES course(cid)' at line 3
mysql> ALTER TABLE student
    -> add cid int ,
    -> FOREIGN KEY (cid) REFERENCES course(cid);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FOREIGN KEY (cid) REFERENCES course(cid)' at line 3
mysql> ALTER TABLE student
    -> ADD cid INT,
    -> ADD FOREIGN KEY (cid) REFERENCES course(cid);
Query OK, 0 rows affected (0.849 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table student
    -> snumber int NOT NULL AUTO_INCREMENT ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'snumber int NOT NULL AUTO_INCREMENT' at line 2
mysql> alter table student
    -> add snumber int NOT NULL AUTO_INCREMENT ;
ERROR 1075 (42000): Incorrect table definition; there can be only one auto column and it must be defined as a key
mysql> ALTER TABLE student
    -> MODIFY sno INT NOT NULL AUTO_INCREMENT;
Query OK, 0 rows affected (0.705 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC student;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra|
+--------+-------------+------+-----+---------+----------------+
| sno    | int         | NO   | PRI | NULL    | auto_increment|
| sname  | varchar(30) | YES  |     | NULL    ||
| branch | varchar(30) | NO   |     | NULL    ||
| age    | int         | YES  |     | NULL    ||
| clg    | varchar(20) | YES  |     | VRSEC   ||
| pno    | varchar(30) | YES  | UNI | NULL    ||
| cid    | int         | YES  | MUL | NULL    ||
+--------+-------------+------+-----+---------+----------------+
7 rows in set (0.036 sec)

mysql>

