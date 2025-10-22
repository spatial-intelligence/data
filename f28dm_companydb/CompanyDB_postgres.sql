--F28DM Company Database Example
-- --------------------------------------------------------
---------------------------------------------
--to remove all of the tables and data
/*
DROP TABLE dbdeadline CASCADE;
DROP TABLE dbdepartment CASCADE;
DROP TABLE dbemployee CASCADE;
DROP TABLE dblocation CASCADE;
DROP TABLE dbproject CASCADE;
DROP TABLE dbworkson CASCADE;
DROP TYPE dline_type;
*/

-- Table structure for table 'dbdeadline'

--using an ENUM to restrict input options
CREATE TYPE dline_type AS ENUM ('Bid','Intermediate','Final');

DROP TABLE IF EXISTS dbdeadline;

CREATE TABLE IF NOT EXISTS dbdeadline (
  projpnum integer NOT NULL,
  dlinedate date NOT NULL,
  dlinetype dline_type NOT NULL default 'Bid',
  PRIMARY KEY  (projpnum,dlinedate)
);

--  data for table 'dbdeadline'
INSERT INTO dbdeadline VALUES(3, '2013-01-25', 'Bid');
INSERT INTO dbdeadline VALUES(3, '2013-04-26', 'Intermediate');
INSERT INTO dbdeadline VALUES(4, '2013-01-25', 'Intermediate');
INSERT INTO dbdeadline VALUES(4, '2013-02-21', 'Final');
INSERT INTO dbdeadline VALUES(5, '2013-02-21', 'Final');

-- --------------------------------------------------------


-- Table structure for table 'dbdepartment'

DROP TABLE IF EXISTS dbdepartment;
CREATE TABLE IF NOT EXISTS dbdepartment (
  dnum integer NOT NULL,
  dname varchar(15) NOT NULL,
  mgrssn integer default NULL,
  mgrstartdate date default NULL,
  PRIMARY KEY  (dnum),
  UNIQUE  (dname)
);

CREATE INDEX mgrssn_idx on dbdepartment(mgrssn);

-- data for table 'dbdepartment'
INSERT INTO dbdepartment VALUES(1, 'HR', 301, '2012-02-05');
INSERT INTO dbdepartment VALUES(2, 'Computing', 217, '1999-02-22');
INSERT INTO dbdepartment VALUES(3, 'Physics', 222, '2002-03-02');
INSERT INTO dbdepartment VALUES(4, 'Maths', 225, '2010-03-12');
INSERT INTO dbdepartment VALUES(5, 'Chemistry', 233, '2009-04-02');
INSERT INTO dbdepartment VALUES(6, 'Payroll', 279, '2012-02-09');
INSERT INTO dbdepartment VALUES(7, 'Stats', NULL, NULL);
INSERT INTO dbdepartment VALUES(8, 'Building', NULL, NULL);

-- --------------------------------------------------------


-- Table structure for table 'dbemployee'

DROP TABLE IF EXISTS dbemployee;
CREATE TABLE IF NOT EXISTS dbemployee (
  ssn integer NOT NULL,
  firstnames varchar(12) NOT NULL,
  lastname varchar(12) NOT NULL,
  dateofbirth date DEFAULT NULL,
  gender char(1) CHECK (gender IN ('M', 'F', 'O')) DEFAULT 'O' NOT NULL,
  salary integer NOT NULL,
  empdnum integer DEFAULT NULL,
  supssn integer DEFAULT NULL,
  PRIMARY KEY (ssn)
);

CREATE INDEX empdNum_idx on dbemployee(empdNum);
CREATE INDEX supssn_idx on dbemployee(supssn);


-- Dumping data for table 'dbemployee'

INSERT INTO dbemployee VALUES(122, 'Keith', 'Brown', '1953-03-25', 'M', 30000, 1, 123);
INSERT INTO dbemployee VALUES(123, 'Gordon', 'Smith', '1953-02-12', 'M', 25000, 1, 124);
INSERT INTO dbemployee VALUES(124, 'Keith', 'Johnson', '1974-07-01', 'M', 28000, 2, NULL);
INSERT INTO dbemployee VALUES(125, 'Jane', 'Jones', '1980-10-20', 'F', 14000, 2, 124);
INSERT INTO dbemployee VALUES(126, 'Mary', 'Smith', '2000-01-09', 'F', 30500, NULL, NULL);
INSERT INTO dbemployee VALUES(212, 'Audrey', 'Glancy', '1981-11-23', 'F', 37000, 1, 221);
INSERT INTO dbemployee VALUES(213, 'Chong', 'Gray', '1974-12-22', 'M', 23000, 1, 212);
INSERT INTO dbemployee VALUES(214, 'Yi', 'Hacking', '1956-10-06', 'M', 33000, 1, 212);
INSERT INTO dbemployee VALUES(215, 'Christopher', 'Halcrow', '1990-02-04', 'M', 18000, 1, 212);
INSERT INTO dbemployee VALUES(216, 'William', 'Harrison', '1965-06-23', 'M', 23000, 1, 212);
INSERT INTO dbemployee VALUES(217, 'Neil', 'Hawley', '1966-05-12', 'M', 23000, 2, 221);
INSERT INTO dbemployee VALUES(218, 'Douglas', 'Herd', '1978-04-05', 'M', 18000, 2, 221);
INSERT INTO dbemployee VALUES(219, 'Rosemary', 'Hodge', '1987-04-27', 'F', 33000, 2, 217);
INSERT INTO dbemployee VALUES(220, 'David', 'Housard', '1990-05-17', 'M', 29000, 2, 217);
INSERT INTO dbemployee VALUES(221, 'Catriona', 'Howell', '1960-12-24', 'F', 40000, 2, NULL);
INSERT INTO dbemployee VALUES(222, 'Fraser', 'Ioannides', '1967-06-08', 'M', 23000, NULL, 221);
INSERT INTO dbemployee VALUES(223, 'Sanjay', 'James', '1991-05-09', 'M', 18000, NULL, 222);
INSERT INTO dbemployee VALUES(224, 'Aurangzeb', 'Jones', '1955-12-20', 'M', 29000, NULL, 222);
INSERT INTO dbemployee VALUES(225, 'Jeremiah', 'Kaur', '1959-07-02', 'M', 29000, 4, 221);
INSERT INTO dbemployee VALUES(226, 'Edward', 'Kemp', '1982-11-21', 'M', 23000, 4, NULL);
INSERT INTO dbemployee VALUES(227, 'Stephan', 'Khoo', '1974-12-16', 'M', 33000, 4, NULL);
INSERT INTO dbemployee VALUES(228, 'Robert', 'King', '1962-11-06', 'M', 29000, 4, 221);
INSERT INTO dbemployee VALUES(233, 'David', 'Lee', '1982-10-16', 'M', 18000, 5, 221);
INSERT INTO dbemployee VALUES(234, 'Cher', 'Liau', '1977-02-06', 'F', 23000, 5, 233);
INSERT INTO dbemployee VALUES(235, 'Barbara', 'Mackenzie', '1954-06-16', 'F', 18000, 5, 233);
INSERT INTO dbemployee VALUES(236, 'Judith', 'Mackintosh', '1977-10-26', 'F', 29000, 5, 233);
INSERT INTO dbemployee VALUES(237, 'James', 'Macleod', '1979-12-06', 'M', 18000, 5, 233);
INSERT INTO dbemployee VALUES(279, 'Heather', 'Tempest', '1965-11-23', 'F', 23000, 6, 221);
INSERT INTO dbemployee VALUES(280, 'Anne', 'Thompson', '1966-12-09', 'F', 29000, 6, 279);
INSERT INTO dbemployee VALUES(281, 'Arvind', 'Thomson', '1990-02-27', 'M', 18000, 6, 279);
INSERT INTO dbemployee VALUES(282, 'Joan', 'Tognarelli', '1963-11-09', 'F', 29000, 6, 279);
INSERT INTO dbemployee VALUES(283, 'Kristy', 'Usher', '1961-11-06', 'F', 19000, 6, 279);
INSERT INTO dbemployee VALUES(284, 'Kyriakos', 'Waweru', '1980-02-08', 'M', 29000, 6, 279);
INSERT INTO dbemployee VALUES(285, 'Dimitrios', 'Wilson', NULL, 'M', 35000, 6, 279);
INSERT INTO dbemployee VALUES(286, 'William', 'Wong', '1960-04-02', 'M', 33000, 6, 279);
INSERT INTO dbemployee VALUES(287, 'Denis', 'Yates', '1950-03-01', 'M', 27000, 6, 279);
INSERT INTO dbemployee VALUES(300, 'Jane', 'Barr', '1991-11-13', 'F', 22000, 2, 220);
INSERT INTO dbemployee VALUES(301, 'Susan', 'Gibson', '1980-12-03', 'F', 15000, NULL, NULL);

-- --------------------------------------------------------

-- Table structure for table 'dblocation'

DROP TABLE IF EXISTS dblocation;
CREATE TABLE IF NOT EXISTS dblocation (
  ldnum integer NOT NULL,
  loc varchar(20) NOT NULL default 'Riccarton',
  PRIMARY KEY  (ldNum,loc)
);

-- Data for table 'dblocation'

INSERT INTO dblocation VALUES(1, 'Hillend');
INSERT INTO dblocation VALUES(1, 'Riccarton');
INSERT INTO dblocation VALUES(2, 'Riccarton');
INSERT INTO dblocation VALUES(4, 'Hillend');
INSERT INTO dblocation VALUES(4, 'Mossfoot');
INSERT INTO dblocation VALUES(4, 'Riccarton');
INSERT INTO dblocation VALUES(5, 'Riccarton');

-- --------------------------------------------------------

-- Table structure for table 'dbproject'

DROP TABLE IF EXISTS dbproject;
CREATE TABLE IF NOT EXISTS dbproject (
  pnum serial,
  pname varchar(20) NOT NULL,
  pdnum integer NOT NULL,
  PRIMARY KEY  (pnum),
  UNIQUE (pname)
);

CREATE INDEX pname_idx on dbproject(pdnum);


-- data for table 'dbproject'

INSERT INTO dbproject VALUES(1, 'Turing', 5);
INSERT INTO dbproject VALUES(2, 'Faraday', 5);
INSERT INTO dbproject VALUES(3, 'Jupiter', 5);
INSERT INTO dbproject VALUES(4, 'Mars', 3);
INSERT INTO dbproject VALUES(5, 'Uranus', 3);
INSERT INTO dbproject VALUES(6, 'Venus', 3);
INSERT INTO dbproject VALUES(7, 'Platinum', 4);
INSERT INTO dbproject VALUES(8, 'Galaxy', 2);
INSERT INTO dbproject VALUES(9, 'Mozart', 6);
INSERT INTO dbproject VALUES(10, 'Chopin', 6);
INSERT INTO dbproject VALUES(11, 'Newton', 7);
INSERT INTO dbproject VALUES(12, 'Halliday', 7);

-- --------------------------------------------------------

-- Table structure for table 'dbworkson'

DROP TABLE IF EXISTS dbworkson;
CREATE TABLE IF NOT EXISTS dbworkson (
  wssn integer NOT NULL,
  wpNum integer NOT NULL,
  hours integer default NULL,
  PRIMARY KEY  (wssn,wpnum)
);

CREATE INDEX wpnum_ipx on dbworkson(wpnum);


-- data for table 'dbworkson'

INSERT INTO dbworkson VALUES(122, 4, 10);
INSERT INTO dbworkson VALUES(123, 3, 5);
INSERT INTO dbworkson VALUES(123, 4, 20);
INSERT INTO dbworkson VALUES(212, 1, 50);
INSERT INTO dbworkson VALUES(212, 2, 50);
INSERT INTO dbworkson VALUES(212, 4, 5);
INSERT INTO dbworkson VALUES(213, 1, 50);
INSERT INTO dbworkson VALUES(213, 2, 50);
INSERT INTO dbworkson VALUES(213, 3, 50);
INSERT INTO dbworkson VALUES(213, 6, 50);
INSERT INTO dbworkson VALUES(213, 7, 2);
INSERT INTO dbworkson VALUES(214, 2, 50);
INSERT INTO dbworkson VALUES(215, 11, 50);
INSERT INTO dbworkson VALUES(215, 12, 50);
INSERT INTO dbworkson VALUES(216, 6, 50);
INSERT INTO dbworkson VALUES(217, 7, 50);
INSERT INTO dbworkson VALUES(218, 6, 50);
INSERT INTO dbworkson VALUES(219, 1, 50);
INSERT INTO dbworkson VALUES(220, 2, 50);
INSERT INTO dbworkson VALUES(222, 3, 50);
INSERT INTO dbworkson VALUES(223, 3, 45);
INSERT INTO dbworkson VALUES(224, 3, 50);
INSERT INTO dbworkson VALUES(225, 4, 50);
INSERT INTO dbworkson VALUES(226, 4, 50);
INSERT INTO dbworkson VALUES(227, 4, 50);
INSERT INTO dbworkson VALUES(233, 5, 50);
INSERT INTO dbworkson VALUES(234, 5, 50);
INSERT INTO dbworkson VALUES(235, 5, 50);
INSERT INTO dbworkson VALUES(236, 5, 50);
INSERT INTO dbworkson VALUES(237, 4, 50);
INSERT INTO dbworkson VALUES(285, 6, 50);
INSERT INTO dbworkson VALUES(286, 6, 50);
INSERT INTO dbworkson VALUES(287, 6, 50);
INSERT INTO dbworkson VALUES(300, 11, 50);
INSERT INTO dbworkson VALUES(300, 12, 50);
INSERT INTO dbworkson VALUES(301, 11, 50);

----------------------------------------------------
-- Constraints

-- Constraints for table `dbdeadline`
ALTER TABLE dbdeadline ADD CONSTRAINT dbdeadline_ibfk FOREIGN KEY (projpnum) REFERENCES dbproject (pnum);

-- Constraints for table `dbdepartment`
ALTER TABLE dbdepartment ADD CONSTRAINT dbdepartment_ibfk_3 FOREIGN KEY (mgrssn) REFERENCES dbemployee (ssn) ON DELETE SET NULL ON UPDATE CASCADE;

-- Constraints for table `dbemployee`
ALTER TABLE dbemployee
  ADD CONSTRAINT dbemployee_ibfk_5 FOREIGN KEY (supssn) REFERENCES dbemployee (ssn) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT dbemployee_ibfk_6 FOREIGN KEY (empdNum) REFERENCES DBDepartment (dNum) ON DELETE SET NULL ON UPDATE CASCADE;

-- Constraints for table `dblocation`
ALTER TABLE dblocation
  ADD CONSTRAINT dblocation_ibfk_2 FOREIGN KEY (ldNum) REFERENCES dbdepartment (dnum) ON DELETE CASCADE ON UPDATE CASCADE;

-- Constraints for table `dbproject`
ALTER TABLE dbproject
  ADD CONSTRAINT dbproject_ibfk_1 FOREIGN KEY (pdnum) REFERENCES dbdepartment (dnum) ON DELETE NO ACTION ON UPDATE CASCADE;

-- Constraints for table `dbworkson`
ALTER TABLE dbworkson
  ADD CONSTRAINT dbworkson_ibfk_3 FOREIGN KEY (wssn) REFERENCES dbemployee (ssn) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT dbworkson_ibfk_4 FOREIGN KEY (wpnum) REFERENCES dbproject (pnum) ON DELETE CASCADE ON UPDATE CASCADE;


--- END OF FILE