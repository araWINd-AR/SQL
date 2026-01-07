-- Use database
USE youtube;

-- Disable safe update mode for practice
SET SQL_SAFE_UPDATES = 0;

-- Drop table if it already exists
DROP TABLE IF EXISTS student;

-- Create student table
CREATE TABLE student (
    sid INT PRIMARY KEY,
    sname VARCHAR(30),
    perc INT,
    grade VARCHAR(40)
);

-- Insert student records
INSERT INTO student VALUES
(101, 'sundeep', 99, NULL),
(102, 'saradhi', 85, NULL),
(103, 'ramu',    88, NULL),
(104, 'hari',    77, NULL),
(105, 'giri',    40, NULL),
(106, 'ravi',    65, NULL),
(107, 'hari',    99, NULL),
(108, 'venu',    88, NULL);

-- Display all records
SELECT * FROM student;

-- Display selected columns
SELECT sid, perc FROM student;

-- Display unique student names
SELECT DISTINCT sname FROM student;

-- Update percentage using primary key
UPDATE student
SET perc = 95
WHERE sid = 101;

-- Assign PASS grade
UPDATE student
SET grade = 'PASS'
WHERE perc > 35 AND perc < 60;

-- Assign FIRST CLASS grade
UPDATE student
SET grade = 'FIRST CLASS'
WHERE perc BETWEEN 60 AND 70;

-- Assign DISTINCTION grade
UPDATE student
SET grade = 'DISTINCTION'
WHERE perc > 70;

-- Display grades
SELECT * FROM student;

-- Delete students with PASS grade
DELETE FROM student
WHERE grade = 'PASS' AND sid IS NOT NULL;

-- Delete students with FIRST CLASS grade
DELETE FROM student
WHERE grade = 'FIRST CLASS' AND sid IS NOT NULL;

-- Display remaining records
SELECT * FROM student;

-- Students with percentage greater than 85
SELECT * FROM student WHERE perc > 85;

-- AND condition
SELECT * FROM student
WHERE perc > 70 AND sid > 103;

-- OR condition
SELECT * FROM student
WHERE perc > 70 OR sid > 103;

-- NOT condition
SELECT * FROM student
WHERE NOT perc > 90;

-- Sort by percentage ascending
SELECT * FROM student ORDER BY perc;

-- Sort by percentage descending
SELECT * FROM student ORDER BY perc DESC;

-- Sort by name
SELECT * FROM student ORDER BY sname;

-- Sort by name descending
SELECT * FROM student ORDER BY sname DESC;

-- Top 3 students by percentage
SELECT * FROM student
ORDER BY perc DESC
LIMIT 3;

-- Lowest 3 percentages
SELECT * FROM student
ORDER BY perc
LIMIT 3;

-- Names starting with S
SELECT * FROM student
WHERE sname LIKE 'S%';

-- Names containing EE
SELECT * FROM student
WHERE sname LIKE '%EE%';

-- Names ending with I
SELECT * FROM student
WHERE sname LIKE '%I';

-- Students with selected percentages
SELECT * FROM student
WHERE perc IN (90, 99, 88, 75);

-- Students between percentage range
SELECT * FROM student
WHERE perc BETWEEN 85 AND 100;

-- Delete all records
DELETE FROM student
WHERE sid IS NOT NULL;

-- Final check
SELECT * FROM student;

-- Enable safe update 
SET SQL_SAFE_UPDATES = 1;
