/*                        SQL AGGREGATE FUNCTIONS                 */

create database youtube ;
use youtube ;

CREATE TABLE student (
    sid INT,
    sname VARCHAR(30),
    perc FLOAT,
    gender VARCHAR(30),
    branch VARCHAR(20)
);

insert into student values ( 1, 'Aravind' ,99 , 'M' , 'ECE');
insert into student values ( 2, 'ravi' ,99 , 'M' , 'CS');
insert into student values ( 3, 'Hari' ,99 , 'M' , 'CS');
insert into student values ( 4, 'Sun' ,99 , 'F' , 'CIVIL');

/* count function  */

select count(sname) from student;

/* count function */
select count(branch) from student;

/* count distinct function */
select count(distinct branch) from student;

/* count function */
select count(*) from student;

select * from student;

/* SUM function */
select sum(perc) from student;

/* AVG function */
select avg(perc) from student;

/* MIN function */
select min(perc) from student;

/* MAX function */
select max(perc) from student;










