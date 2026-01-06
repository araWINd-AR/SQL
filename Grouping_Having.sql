use youtube;
select * from student;

select branch, count(sid) from student group by branch;

select gender,count(sid) from student group by gender;

select * from student;

select gender , avg(perc) from student group by gender;

select gender , max(perc) from student group by gender;

select branch , max(perc) from student group by branch;

select branch , min(perc) from student group by branch ;

select gender, min(perc) from student group by gender ;

select branch,count(branch) from student group by branch having count(sid) = 1 ;

select branch,count(branch) from student group by branch having count(sid) > 1 ;

select branch, min(perc) from student group by branch having min(perc) > 70 ;

select * from student;

select branch , min(perc) from student group by branch having min(perc) > 70 ;

select branch ,max(perc) from student group by branch having max(perc) > 90 ;

select * from student;

select branch ,max(perc) from student group by branch having max(perc) > 80 ;











