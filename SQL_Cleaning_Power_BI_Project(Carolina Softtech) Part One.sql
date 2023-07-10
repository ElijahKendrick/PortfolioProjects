CREATE TABLE DepartmentSampleDataCSV
(
   Dept_ID VARCHAR(50),
   Department_Name VARCHAR(50),
   Dept_Addr1 VARCHAR(50),
   Dept_Addr2 VARCHAR(100),
   Dept_City VARCHAR(50),
   Dept_State VARCHAR(50),
   Dept_Zip VARCHAR(50),
   Dept_Country VARCHAR(50)
);





BULK INSERT DepartmentSampleDataCSV
FROM 'C:\Users\Warbucks\Downloads\DepartmentSampleDataCSV.csv'
WITH
(
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n'
);

select * from DepartmentSampleDataCSV

CREATE TABLE EmployeeSampleDataCSV (
  Employee_ID VARCHAR(10),
  Full_Name VARCHAR(50),
  Job_Title VARCHAR(50),
  Business_Unit VARCHAR(50),
  Gender VARCHAR(10),
  Ethnicity VARCHAR(20),
  Age INT,
  Hire_Date DATE,
  Annual_Salary INT,
  Bonus FLOAT,
  Country VARCHAR(50),
  City VARCHAR(50),
  Exit_Date DATE,
  Dept_ID VARCHAR(10)
);

ALTER TABLE EmployeeSampleDataCSV
ALTER COLUMN Employee_ID VARCHAR(20);

ALTER TABLE EmployeeSampleDataCSV
ALTER COLUMN Age VARCHAR(20);

ALTER TABLE EmployeeSampleDataCSV
ALTER COLUMN Hire_Date VARCHAR(20);

ALTER TABLE EmployeeSampleDataCSV
ALTER COLUMN Annual_Salary VARCHAR(20);

ALTER TABLE EmployeeSampleDataCSV
ALTER COLUMN Bonus VARCHAR(20);

ALTER TABLE EmployeeSampleDataCSV
ALTER COLUMN Exit_Date VARCHAR(20);

ALTER TABLE EmployeeSampleDataCSV
ALTER COLUMN Age INT;

ALTER TABLE NewTable
ALTER COLUMN Annual_Salary INT;

ALTER TABLE NewTable
ALTER COLUMN Bonus float;




BULK INSERT EmployeeSampleDataCSV
FROM 'C:\Users\Warbucks\Downloads\EmployeeSampleDataCSV-1.csv'
WITH
(
   FIELDTERMINATOR = ',',
   ROWTERMINATOR = '\n'
);

select * from EmployeeSampleDataCSV

ALTER TABLE DepartmentSampleDataCSV
ADD CONSTRAINT PK_DepartmentSampleDataCSV PRIMARY KEY (Dept_ID);

select * from DepartmentSampleDataCSV

ALTER TABLE DepartmentSampleDataCSV
ALTER COLUMN Dept_ID VARCHAR(50) NOT NULL;

-- Modify the length of the Employee_ID column
ALTER TABLE EmployeeSampleDataCSV
ALTER COLUMN Employee_ID VARCHAR(20);

-- Modify the Employee_ID column to be non-nullable
ALTER TABLE EmployeeSampleDataCSV
ALTER COLUMN Employee_ID VARCHAR(10) NOT NULL;

-- Add primary key constraint
ALTER TABLE EmployeeSampleDataCSV
ADD CONSTRAINT PK_EmployeeSampleDataCSV PRIMARY KEY (Employee_ID);

-- Add foreign key constraint
ALTER TABLE EmployeeSampleDataCSV
ADD CONSTRAINT FK_EmployeeSampleDataCSV_DeptID
FOREIGN KEY (dept_id) REFERENCES DepartmentSampleDataCSV(dept_id);

--The Direct query should contain the below data attributes
--Employee_Id,
--Full_Name,
--Business_Unit,
--Gender,
--Ethnicity,
--Annual_Salary,
--Bonus,
--Department_Name,
--Dept_State,
--Dept_Zip,
--Dep_Country,
--(Annual_Salary+(Annual_Salary*Convert(float, Bonus)/100)) as 'Revised Sal'
--4. Use inner Join for direct query using the table EmployeeSampleDataCSV, DepartmentSampleDataCSV



SELECT
    e.Employee_ID,
    e.Full_Name,
    e.Business_Unit,
    e.Gender,
    e.Ethnicity,
    e.Annual_Salary,
    e.Bonus,
    d.Department_Name,
    d.Dept_State,
    d.Dept_Zip,
    d.Dept_Country,
    (e.Annual_Salary + (e.Annual_Salary * CONVERT(FLOAT, e.Bonus) / 100)) AS 'Revised Sal'

SELECT
    e.Employee_ID,
    e.Full_Name,
    e.Business_Unit,
    e.Gender,
    e.Ethnicity,
    e.Annual_Salary,
    e.Bonus,
    d.Department_Name,
    d.Dept_State,
    d.Dept_Zip,
    d.Dept_Country,
    (e.Annual_Salary + (e.Annual_Salary * CONVERT(FLOAT, e.Bonus) / 100)) AS 'Revised Sal'
INTO
    NewTable
FROM
    EmployeeSampleDataCSV e
    INNER JOIN DepartmentSampleDataCSV d ON e.Dept_ID = d.Dept_ID;

	select * from NewTable

	SELECT DISTINCT Full_Name, * 
FROM NewTable;


-- Use the Alter command to add the FORIEGN KEY
--After the tables created in Emp_DB, ensure to use Alter command to add Foreign Key for EmployeeSampleDataCSV (EDept_ID), DepartmentSampleDataCSV (Dept_Id)
?
ALTER Table Departmentsampledatacsv
ADD Constraint FK_Dept_ID FOREIGN KEY (Dept_ID)
REFERENCES Departmentsampledata(Dept_ID)
?
Alter Table EmployeeSampledata
ADD Constraint FK_EDept_ID FOREIGN KEY (EDept_ID)
REFERENCES Departmentsampledata (Dept_ID)
?
Alter Table Departmentsampledata
Drop Constraint FK_Dept_ID
?
SELECT Employee_ID, Full_Name, Business_Unit, Gender, Ethnicity, Annual_Salary, Bonus, Department_Name,
Dept_State, Dept_Zip, Dep_Country, (Annual_Salary+(Annual_Salary*Convert(float, Bonus)/100)) as 'Revised Sal'
FROM EmployeeSampleData
INNER JOIN DepartmentSampleData
ON EmployeeSampleData.Edept_ID = DepartmentSampleData.Dept_ID
?
SELECT Employee_ID, Full_Name, Business_Unit, Gender, Ethnicity, Annual_Salary, Bonus, Department_Name,
Dept_State, Dept_Zip, Dep_Country, (Annual_Salary+(Annual_Salary*Convert(float, Bonus)/100)) as 'Revised Sal'
FROM EmployeeSampleData
INNER JOIN DepartmentSampleData
ON EmployeeSampleData.Edept_ID = DepartmentSampleData.Dept_ID