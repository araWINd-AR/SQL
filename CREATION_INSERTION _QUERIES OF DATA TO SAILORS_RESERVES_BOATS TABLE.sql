-- ==============================
-- SAILORS / BOATS / RESERVES
-- FULL WORKING SCRIPT (ALL-IN-ONE)
-- ==============================

USE youtube;

-- 1) Clean reset (drop child first because of FK)
DROP TABLE IF EXISTS reserves;
DROP TABLE IF EXISTS boats;
DROP TABLE IF EXISTS sailors;

-- 2) Create tables
CREATE TABLE sailors (
  sid INT,
  sname VARCHAR(30),
  rating INT,
  age INT,
  PRIMARY KEY (sid)
);

CREATE TABLE boats (
  bid INT,
  bname VARCHAR(20),
  color VARCHAR(20),
  PRIMARY KEY (bid)
);

-- IMPORTANT FIX: include day in PRIMARY KEY
CREATE TABLE reserves (
  sid INT,
  bid INT,
  day DATE,
  PRIMARY KEY (sid, bid, day),
  FOREIGN KEY (sid) REFERENCES sailors(sid),
  FOREIGN KEY (bid) REFERENCES boats(bid)
);

-- 3) Insert data (parent tables first)
INSERT INTO sailors (sid, sname, rating, age) VALUES
(101,'aravind',9,25),
(102,'sara',10,27),
(103,'rajesh',6,26),
(104,'sasi',19,25),
(105,'hari',6,28),
(106,'siva',10,30),
(107,'SUNDEEP',8,24);   -- added so query #3 works exactly

INSERT INTO boats (bid, bname, color) VALUES
(1,'boat1','green'),
(2,'boat2','red'),
(3,'boat3','blue'),
(4,'boat4','black');

INSERT INTO reserves (sid, bid, day) VALUES
(101, 1, '2022-01-20'),
(102, 2, '2020-01-01'),
(103, 4, '2020-12-11'),
(104, 3, '2021-02-21'),
(105, 1, '2022-09-10'),
(105, 2, '2022-04-25'),
(107, 2, '2022-03-03');  -- SUNDEEP reserved RED boat (bid=2)

-- 4) Show tables + data
SHOW TABLES;

SELECT * FROM sailors;
SELECT * FROM boats;
SELECT * FROM reserves;

-- ==============================
-- QUERIES FROM YOUR IMAGE
-- ==============================

-- 1. Finding Names of Sailors who reserved Boat No 3.
SELECT DISTINCT s.sname
FROM sailors s
JOIN reserves r ON s.sid = r.sid
WHERE r.bid = 3;

-- 2. Finding Names of Sailors who reserved RED Boat.
SELECT DISTINCT s.sname
FROM sailors s
JOIN reserves r ON s.sid = r.sid
JOIN boats b ON b.bid = r.bid
WHERE b.color = 'red';

-- 3. Finding Color of Boats reserved by 'SUNDEEP'.
SELECT DISTINCT b.color
FROM boats b
JOIN reserves r ON b.bid = r.bid
JOIN sailors s ON s.sid = r.sid
WHERE s.sname = 'SUNDEEP';

-- 4. Finding Names of Sailors who have reserved atleast one Boat.
SELECT DISTINCT s.sname
FROM sailors s
JOIN reserves r ON s.sid = r.sid;
