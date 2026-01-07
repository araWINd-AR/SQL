USE youtube;

-- CLEAN RESET
DROP TABLE IF EXISTS student;

-- CREATE TABLE
CREATE TABLE student (
  sid INT PRIMARY KEY,
  sname VARCHAR(30),
  perc INT
);

-- INSERT DATA
INSERT INTO student VALUES
(101,'sundeep',99),
(102,'saradhi',85),
(103,'ramu',68),
(104,'hari',77),
(105,'giri',40),
(106,'ravi',65),
(107,'hari',99);

SELECT * FROM student;

-- UPDATE percentage 
UPDATE student
SET perc = 95
WHERE sid = 101;

-- ALTER TABLE
ALTER TABLE student
ADD grade VARCHAR(40);


UPDATE student
SET grade = NULL
WHERE sid >= 0;

-- Set grades 
UPDATE student
SET grade = 'PASS'
WHERE sid >= 0 AND perc > 35 AND perc < 60;

UPDATE student
SET grade = 'DISTINCTION'
WHERE sid >= 0 AND perc > 70;

UPDATE student
SET grade = 'FIRST CLASS'
WHERE sid >= 0 AND perc BETWEEN 60 AND 70;

SELECT * FROM student;

-- DELETE PASS student
DELETE s
FROM student s
JOIN (
  SELECT sid FROM student WHERE grade = 'PASS'
) x ON s.sid = x.sid;

SELECT * FROM student;

-- DELETE 
DELETE s
FROM student s
JOIN (
  SELECT sid FROM student WHERE grade = 'FIRST CLASS'
) x ON s.sid = x.sid;

SELECT * FROM student;

-- DELETE ALL ROWS 
TRUNCATE TABLE student;

SELECT * FROM student;
