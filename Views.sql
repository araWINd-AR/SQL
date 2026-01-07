
USE youtube;

-- ---------- CREATE TABLE ----------
CREATE TABLE student (
  sid INT PRIMARY KEY,
  sname VARCHAR(30),
  perc FLOAT,
  gender VARCHAR(10),
  branch VARCHAR(20)
);

-- ---------- INSERT DATA ----------
INSERT INTO student VALUES
(101,'hari',99,'male','CSE'),
(102,'ramya',90,'female','ECE'),
(103,'sundeep',95,'male','CSE'),
(104,'sony',78,'female','CSE'),
(105,'saradhi',88,'male','CIVIL'),
(106,'yamini',98,'female','ece'),
(107,'ramu',60,'male','ECE');

-- ---------- DISPLAY BASE TABLE ----------
SELECT * FROM student;

-- ---------- CREATE VIEWS ----------
CREATE VIEW cse_students AS
SELECT * FROM student WHERE LOWER(branch)='cse';

CREATE VIEW ece_students AS
SELECT * FROM student WHERE LOWER(branch)='ece';

CREATE VIEW civ_students AS
SELECT * FROM student WHERE LOWER(branch)='civil';

-- ---------- SHOW VIEWS ----------
SHOW TABLES;

SELECT * FROM cse_students;
SELECT * FROM ece_students;
SELECT * FROM civ_students;

-- ---------- UPDATE USING BASE TABLE ----------
UPDATE student
SET perc = 90
WHERE sid = 105;

-- ---------- VERIFY ----------
SELECT * FROM student;
SELECT * FROM civ_students;

-- ---------- UPDATE USING VIEW ----------
UPDATE civ_students
SET perc = 95
WHERE sid = 105;

-- ---------- FINAL VERIFICATION ----------
SELECT * FROM civ_students;
SELECT * FROM student;
