-- Create Department Table
CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Designation Table
CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Person Table
CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);


-- PROCEDURE FOR INSERT INTO DEPARTMENT
CREATE PROCEDURE PR_DEPT_INSERT
	@DEPTID INT,
	@DEPTNAME VARCHAR(25)
AS
BEGIN
	INSERT INTO Department
	VALUES(@DEPTID,@DEPTNAME)
END

-- PROCEDURE FOR INSERT INTO DESIGNATION
ALTER PROCEDURE PR_DESIG_INSERT
	@DESIGID INT,
	@DESIGNAME VARCHAR(25)
AS
BEGIN
	INSERT INTO Designation
	VALUES(@DESIGID,@DESIGNAME)
END

--1

--DATA INSERT INTO DEPARTMENT

EXEC PR_DEPT_INSERT 1,'Admin'
EXEC PR_DEPT_INSERT 2,'IT'
EXEC PR_DEPT_INSERT 3,'HR'
EXEC PR_DEPT_INSERT 4,'Account'

--DATA INSERT INTO DESIGNATION

EXEC PR_DESIG_INSERT 11,'Jobber'
EXEC PR_DESIG_INSERT 12,'Welder'
EXEC PR_DESIG_INSERT 13,'Clerk'
EXEC PR_DESIG_INSERT 14,'Manager'
EXEC PR_DESIG_INSERT 15,'CEO'

-- PROCEDURE FOR INSERT INTO PERSON

CREATE PROCEDURE PR_PERSON_INSERT
	@FNAME VARCHAR(25),
	@LNAME VARCHAR(25),
	@SALARY DECIMAL(8,2),
	@JOININGDATE DATETIME,
	@DEPTID INT,
	@DESIGID INT
AS
BEGIN
	INSERT INTO Person
	VALUES(@FNAME,@LNAME,@SALARY,@JOININGDATE,@DEPTID,@DESIGID)
END


--DATA INSERT INTO DESIGNATION

EXEC PR_PERSON_INSERT 'Rahul','Anshu',56000,'1990-01-01',1,12
EXEC PR_PERSON_INSERT 'Hardik','Hinshu',18000,'1990-09-25',2,11
EXEC PR_PERSON_INSERT 'Bhavin','Kamani',25000,'1991-05-14',null,11
EXEC PR_PERSON_INSERT 'Bhoomi','Patel',39000,'2014-02-20',1,13
EXEC PR_PERSON_INSERT 'Rohit','Rajgor',17000,'1990-07-23',2,15
EXEC PR_PERSON_INSERT 'Priya','Mehta ',25000,'1990-10-18',2,null
EXEC PR_PERSON_INSERT 'Neha','Trivedi',18000,'2014-02-20',3,15


-- PROCEDURE FOR UPDATE INTO DEPARTMENT

CREATE OR ALTER PROCEDURE PR_UPDATE_DEPT
	@DEPTID INT,
	@DEPTNAME VARCHAR(25)
AS
BEGIN
	UPDATE Department
	SET DepartmentName = @DEPTNAME
	WHERE DepartmentID = @DEPTID
END

-- PROCEDURE FOR UPDATE INTO DESIGNATION

CREATE OR ALTER PROCEDURE PR_UPDATE_DESIG
	@DESIGID INT,
	@DESIGNAME VARCHAR(25)
AS
BEGIN
	UPDATE Designation
	SET DesignationName = @DESIGNAME
	WHERE DesignationID = @DESIGID
END

--exec PR_UPDATE_DESIG 11 , 'Jobber'

-- PROCEDURE FOR UPDATE INTO Person

CREATE OR ALTER PROCEDURE PR_UPDATE_DESIG
	@PERSONID int,
	@FNAME VARCHAR(25),
	@LNAME VARCHAR(25),
	@SALARY DECIMAL(8,2),
	@JOININGDATE DATETIME,
	@DEPTID INT,
	@DESIGID INT
AS
BEGIN
	UPDATE Person
	SET FirstName = @FNAME, LastName = @LNAME, Salary = @SALARY ,
	JoiningDate = @JOININGDATE, DepartmentID = @DEPTID, DesignationID = @DESIGID
	WHERE PersonID = @PERSONID
END

-- PROCEDURE FOR DELETE FROM DEPARTMENT
CREATE OR ALTER PROCEDURE PR_DELETE_DEPT
	@DEPTID INT
AS
BEGIN
	DELETE FROM Department
	WHERE DepartmentID = @DEPTID
END


-- PROCEDURE FOR DELETE FROM DESIGNATION
CREATE OR ALTER PROCEDURE PR_DELETE_DESIG
	@DEPTID INT
AS
BEGIN
	DELETE FROM Designation
	WHERE DesignationID = @DEPTID
END

-- PROCEDURE FOR DELETE FROM PERSON
CREATE OR ALTER PROCEDURE PR_DELETE_PERSON
	@DEPTID INT
AS
BEGIN
	DELETE FROM Person
	WHERE PersonID = @DEPTID
END

--2

-- PROCEDURE FOR SELCT BY PRIMERY KEY FROM DEPARTMENT

CREATE OR ALTER PROCEDURE PR_SELECTBYPRIMARYKEY_DEPT
	@DEPTID INT
AS
BEGIN
	SELECT * FROM Department
	WHERE DepartmentID = @DEPTID
END
--EXEC PR_SELECTBYPRIMARYKEY_DEPT 1

-- PROCEDURE FOR SELCT BY PRIMERY KEY FROM DESIGNATION

CREATE OR ALTER PROCEDURE PR_SELECTBYPRIMARYKEY_DESIG
	@DEPTID INT
AS
BEGIN
	SELECT * FROM Designation
	WHERE DesignationID = @DEPTID
END
--EXEC PR_SELECTBYPRIMARYKEY_DESIG 11

-- PROCEDURE FOR SELCT BY PRIMERY KEY FROM DESIGNATION

CREATE OR ALTER PROCEDURE PR_SELECTBYPRIMARYKEY_PERSON
	@DEPTID INT
AS
BEGIN
	SELECT * FROM Person
	WHERE PersonID = @DEPTID
END
--EXEC PR_SELECTBYPRIMARYKEY_PERSON 101


--3
CREATE OR ALTER PROCEDURE PR_JOIN_FOREIGNKEY
	AS 
	BEGIN
			SELECT * FROM PERSON
			JOIN Department 
			ON Department.DepartmentID = Person.DepartmentID
			JOIN Designation
			ON Designation.DesignationID = Person.DesignationID
	END   
--exec PR_JOIN_FOREIGNKEY

--4
CREATE OR ALTER PROCEDURE PR_TOPTHREE
AS
BEGIN
		SELECT TOP 3 * FROM Person
END
--EXEC PR_TOPTHREE




