-- 1. Create Table Student
-- 2. Insert Records using INSERT INTO Command
-- 3. SELECT Records from Student Table using SELECT Command
-- 4. Delete table Student from Object Explorer
-- 5. Create Table Student with a change to data type for S_Phone as Varchar(10)
-- 6. Insert Records using INSERT INTO command
-- 7. Create Tables (Examples)
-- 8. Insert Records
-- 9. Select data with different Clauses

-- CREATE STUDENT Table

--CREATE Syntax
/* CREATE TABLE table_name 
(
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);   */

--The below is the create command for Student table
Use msdb

CREATE TABLE Student
(
Student_ID INT,
S_Fname Varchar(50),
S_Lname varchar(50),
S_Address1 Varchar(50),
S_Address2 Varchar(50),
S_City Varchar(50),
S_Zip Int,
S_Country Varchar(50),
S_Phone Varchar(10)
)select * from Student;

INSERT INTO Student (
Student_ID,
S_Fname,	
S_Lname,
S_Address1,	
S_Address2,
S_City,
S_Zip,
S_Country,
S_Phone)
VALUES (1001, 'Mark', 'Julius', '652 Elm Pike','', 'Charlotte', 25635, 'USA', '8947748976'),
		(1002, 'Zeb', 'Carver', '6322 Maine Ln','','Charlotte', 62323, 'USA', '9588897338'),
		(1003, 'Vicky','Mayer', '234 Keatings Ln','Suite 20','Charlotte', 62323, 'USA', '95897338')


 Select *
 From Student
 
 Select Student_ID, S_FName, S_LName, S_City
 From Student

 INSERT INTO Student (
Student_ID,
S_Fname,	
S_Lname,
S_Address1,	
S_Address2,
S_City,
S_Zip,
S_Country,
S_Phone)
VALUES (1004, 'Smith','Brown','11235 Elm Ln', 'Suite 310', 'Charlotte', 28202, 'USA', 123479988)

INSERT INTO Student (
Student_ID,
S_Fname,	
S_Lname,
S_Address1,	
S_Address2,
S_City,
S_Zip,
S_Country,
S_Phone)
VALUES (1005, 'Mary','Foxx','10075 Mahem Ln', '', 'Charlotte', 28201, 'USA', 123487978)

INSERT INTO Student (
Student_ID,
S_Fname,	
S_Lname,
S_Address1,	
S_Address2,
S_City,
S_Zip,
S_Country,
S_Phone)
VALUES (1006, 'Samatha','Kane','17865 Ronem St', '', 'Charlotte', 28781, 'USA', 123478978)

--Insert Null for Address2
INSERT INTO Student (
Student_ID,
S_Fname,	
S_Lname,
S_Address1,	
S_City,
S_Zip,
S_Country,
S_Phone)
VALUES (1007, 'Cathy', 'Pickett', '6345 Elm Pike', 'Charlotte', 28257, 'USA', '8998988784')


-- CREATE Persons Table

CREATE TABLE Persons
(Person_ID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255)
)

INSERT INTO Persons
(Person_ID,
LastName,
FirstName,
Address,
City)
VALUES  (1001, 'Cathy','Devine','234 Tomshort Ln','Charlotte'),
		(1002, 'Manny','P', '532 Emma Pike', 'Charlotte'),
		(1003, 'Steve','Smith','110 elm ln','Charlotte'),
		(1004, 'Demi','Shah','10923 traveller ln','East Brunswick'),
		(1005, 'Merium','Duke','9808 Marshall Ln','Nashville')

		Select *
		From Persons

INSERT INTO Persons
(Person_ID,
LastName,
FirstName,
Address,
City)
VALUES  (1006, 'Kendrick','Elijah','10553 Yellow Rose Ln', 'Charlotte')

Select FirstName, LastName
From Persons

Select FirstName, City
From Persons

Select * From Student
--Select Student_ID, S_FName, S_City, S_Zip from Student

Select Student_ID, S_FName, S_City, S_Zip
From Student

Select S_Fname, S_Lname, S_Phone
From Student

--Bulk Insert
CREATE TABLE Products
(Product_ID Int,
Product_Name Varchar(40),
Supplier_ID Int,
Category_ID Int,
Unit varchar(100),
Price Decimal(6,2));

Select Person_ID, FirstName, City
From Persons

--Bulk Insert

--Syntax
/*
BULK INSERT <tableName>
FROM "
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n' )
GO
*/

BULK INSERT Persons
From 'C:\Users\Warbucks\Desktop\Data Analyst\Persons.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

SELECT * from Persons

BULK INSERT Products
FROM 'C:\Users\Warbucks\Desktop\Data Analyst\Products.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

Select * From Products

--SQL CLAUSES
 -- 1. Where 
 -- 2. Group By
 -- 3. Having
 -- 4. Into
 -- 5. Order By

 Select Person_ID, FirstName, LastName, City
 From Persons
 Where Person_ID = 1001

 --WHERE
 Select * from Student

 Select S_FName, S_Phone
 from Student
 where S_FName = 'Cathy'

 Select S_Fname, S_LName, S_City, S_Phone
 from Student
 where Student_ID = 1006

 Select S_FName, S_City, S_Zip from Student where S_FName = 'Vicky'

 --Retrieve all the data from student, where szip is 28202
 Select * from Student where S_Zip = 28202

 Select* from Products

 -- Select the data from Products table for Category_Id is 2
Select *
from Products
Where Category_ID = 2

 -- Select the data from Products table for Product_Name is 'Foam'
 Select *
 from Products
 Where Product_Name = 'FoAm'

 -- Select the data from Products table for Supplier ID is 1
 Select *
 from Products
 Where Supplier_ID = 1

 -- Select Product_Name, Unit from Products table for Price is 22.90
 Select Product_Name, Unit
 from Products
 Where Price = 22.90

 -- Select Product_ID, Product_Name, Supplier_ID from Products table for Price < 30
 Select Product_Id, Product_Name, Supplier_ID
 from Products
 Where Price < 30

 -- Select Product_Name, Supplier_ID, Unit from Products table for Price between 10 and 30
 Select Product_Name, Supplier_ID, Unit 
 from Products
 Where Price BETWEEN 10 AND 30

 -- Select Product_Name, Supplier_ID, Price from the products table for the Unit is '32oz Dis Container'
 Select Product_Name, Supplier_ID, Price
 from Products
 Where Unit = '32oz Dis Container'

 -- Select all products from Supplier_Id 2
 Select *
 from Products
 Where Supplier_ID = 2

 Select * From Persons
 --Retrieve data from Persons where FirstName=P
 Select *
 From Persons
 Where FirstName = 'P'

--Retrieve data from Persons where LastName=Cathy
Select *	
From Persons
WHere LastName = 'Cathy'

Select * from Products

Select Category_ID, SUM(Price)
from Products
Group BY Category_ID

Select Sum(Price)
From Products
Where Category_ID = 2

--Group SupplierID and display avg of price for each supplier id
Select Supplier_ID, AVG (PRICE)
from Products
Group By Supplier_ID

--Group Supplier ID and display max of price for each supplier id
Select Supplier_ID, MAX (PRICE)
from Products
Group BY Supplier_ID

--Group Supplier_ID and display Min of Price for each supplier_id, add column alias for min price
Select Supplier_ID, MIN (Price) as 'Minimum Price'
from Products
Group By Supplier_ID

Select * from Student
--Group zip code and count the No of students in each zip code from student table
Select S_zip, COUNT (S_Zip) as 'No of Students'
from Student
Group By S_zip

--Group City and Count the no. of persons in each city from Persons table
Select City, COUNT (Person_ID) as 'No of Residents'
From Persons
Group BY City

Select * From Persons
Select * From Products Where Category_ID = 4

--HAVING
--Retrieve no of products by Category ID where products equal to 5

Select * 
From Products
Where Category_ID = 1

Select Category_ID, COUNT (Product_ID) as 'No of Products'
From Products
Group By Category_ID
HAVING COUNT (Product_ID) = 5

--Retrieve no of products by Category ID where products less than or equal to 3
Select Category_ID, COUNT (Product_ID) as NoOfProducts
From Products
Group By Category_ID
HAVING COUNT (PRODUCT_ID) <= 3

--Retrieve sum of Price by Cat ID where price less than 60
Select Category_ID, COUNT (Price) as 'Sum of Price'
From Products
Group by Category_ID
HAVING COUNT (Price) <60

--Retrieve Avg Price and COunt of products by Supplier ID where prodcuts are >= than 5
Select Supplier_ID, AVG(Price) as AvgPrice, COUNT (Product_ID) as CountofProducts
From Products
Group By Supplier_ID
HAVING COUNT (Product_ID) >= 5

--INTO: Copies data into one table from other and also creates new table

Select * Into Products_ext
From Products

Select Product_ID, Product_Name, Category_ID, Price
Into Products_Sub
From Products

Select * from Products_Sub
Where Category_Id = 1

--Create new table from products_sub where it only shows category 1
Select * Into Products_Sub1
From Products_Sub
Where Category_ID = 1

Select * from Products_Sub1

--Order By
Select *
From Products

Select *
From Products
Order By Price

Select *
From Products
Order By Price DESC

Select *
From Products
Order By Product_Name
DESC

Select * 
From Products
Order By Supplier_ID DESC

Select *
From Student
Order By Student_ID

Select *
From Student	
Order By Student_ID DESC

Select *
From Student
Order By S_Zip

Select *
From Student
Order By S_Zip DESC


--STRING FUNCTIONS with EXAMPLES

-- Lower() converts text into lowercase
-- Upper() converts text into uppercase
-- Trim()
-- Ltrim()
-- Rtrim()
-- Left()
-- Right()
-- Len()
-- String_Split()
-- Replace()
-- Reverse()
-- Difference()
-- Replicate()
-- Translate()

--Lower() - LOWER(string_expression)
Select Lower('GW SQL CLASS') -- gw sql class
Select Lower('gW sTl clAss')


--Upper () - UPPER(string_expression)
Select Upper('elijah kendrick') -- ELIJAH KENDRICK

--Trim () TRIM (string_expression) - removes leading and trailing spaces from a string
Select ('                   GW DA CLASS       ') as Trim
Select Trim('     ABC       GW SQL CLASS        ') as Trim 

--LTRIM () - LTRIM(string_expression)
Select ('      GW SQL Class')
Select 'Test' + ('                           GW SQL Class')
Select 'Test' + LTRIM('     GW SQL Class')
Select LTRIM ('    GW SQL Class')

--RTRIM () - RTRIM(string_expression)

Select ('GW SQL CLASS           ') + 'Continuation'
Select Rtrim ('GW SQL CLASS      ') + 'Continuation'
Select ('GW SQL CLASS          ') + 'Continuation'
Select TRIM('GW SQL CLASS            ') + 'Continuation'
Select 'Test' + TRIM('GW SQL CLASS            ') + 'Continuation'

--LEFT () - LEFT(String_expression, no of characters) - Extracts number of characters from a string (starting from the left)
Select LEFT('GW SQL CLASS', 2) as 'Left'
Select LEFT('GW SQL CLASS', 5) as 'Left'
Select LEFT('GW SQL CLASS', 20) as 'Left'

--RIGHT () - RIGHT(string_expression, no of characters) - extracts number of characters from a string (starting from the right)
Select RIGHT('GW SQL         Class', 4)
Select RIGHT('GW SQL         Class', 10)
Select Trim(RIGHT ('GW SQL         Class', 10))

--LEN () - LEN (string_expression) character count including space(s)
Select LEN ('GW SQL Class') as 'Len'
Select LEN ('04-24-2023') as 'Len'
Select LEN ('Tim Stephen') as 'Len'

--STRING_Split () - STRING_SPLIT (string,separator) -
--Function that splits a string into a table that consists of rows of substrings based on a specified separator


Select Value From string_split('This is a String Split test', ',');
Select Value FRom string_split('This is a/ String Split test', '/');
Select Value FRom string_split('This is a. String. Split test', '.');
Select Value FRom string_split('This is a String Split test', 'i');

--REPLACE () - REPLACE (string_expression, string_pattern , string_replacement)
--function replaces all occurrences of a substring within a string, with a new substring

Select REPLACE('Replace Test','Test','Steve')
Select REPLACE('Replace Test','1','A')
Select REPLACE('Replace Test','e','A')

--REVERSE() - REVERSE (string_expression) - function reverses a string and returns the result.
Select REVERSE('GW SQL Class')
Select REVERSE('RACECAR')

--DIFFERENCE () - DIFFERENCE ( character_expression , character_expression)
-- 0 indicates weak or no similarity between the values. 4 indicates strong similarity or identically values.

Select DIFFERENCE('GW DA Class', 'GW DA Class')
Select DIFFERENCE('Class', 'Class')
Select DIFFERENCE('GW DA Class', '12 DA Class')
Select DIFFERENCE('GW DA Class', '123456')
Select DIFFERENCE('GW DA Class', '1W DA Class')

--Replicate () - Replicate (string_expression , integer_expression)
--function repeats a string a specified number of times.

Select REPLICATE ('SQL        ',10)
Select REPLICATE ('SQL is Important   ', 2) As 'Replicate'

--Translate () - TRANSLATE ( inputString, characters, translations)
--Function returns the string from the first argument
--After the characters specified in the second argument are translated
--Into the characters specified in the third argument.

Select TRANSLATE('GW SQL Class', 'SQL', 'JAV')   -- GW JAV CVaJJ
Select TRANSLATE('GW SQL Class', 'S', '$')
Select TRANSLATE('3*[8-4]/{6+4}','[]{}','()()') -- 3*(8-4)/(6+4)
Select TRANSLATE('3*[8-4]/{6+4}','[]{}','()()')   --  3*(8-4)/(6+4)
Select TRANSLATE('3*[8-4]/{6+4}','[]{}','{}[]')
Select TRANSLATE('3*[8-4]/{6+4}','-+/','***')     --  3*[8*4]*{6*4}

--Arithmetic Function:

--Abs()
--Ceiling()
--Floor()
--Exp()
--SQUARE()
--Sqrt()
--Power()

--Abs () - function returns the absolute value of a number
Select Abs(-23) as Absolute
Select ABs(23) as Absolute
Select ABS(-4533) as Absolute

--Ceiling () - functions returns the smallest integer value that is larger than or equal to a number
Select CEILING (23.12) as Ceiling
Select CEILING (22.00)
Select CEILING (22)

--Floor () - function returns the smallest integer value that is smaller than or equal to a number
Select Floor (23.12) as Floor
Select Floor (22.99)

-- Exp () - funcion returns e raised to the power of a specified number.
Select Exp(2) As exponential --7.38905609893065
Select Exp(8) As exponential --7.38905609893065
Select Exp(20) As exponential --7.38905609893065

--Square () - function returns the square of a number
Select SQUARE(2) As square
Select SQUARE(4) As square
Select SQUARE(9) As square

--Sqrt() -- function returns the square root of a number
Select SQRT(9) as SQRT
Select SQRT(16) as SQRT
Select SQRT(81) as SQRT
Select SQRT(144) as SQRT
Select SQRT(4) as SQRT

--Power() - function returns the value of a number raised to the power of another number.
Select POWER(2,3) as Power
Select POWER(2,4) as Power
Select POWER(10,2) as Power

--Boolen Operators:
--Operator establishes relationshop

--AND
--OR
--IN
--Between
--Not
--LIke
--Exists
--All
--Any

Select * from Student
--AND
Select S_Fname, S_Phone
from Student
where S_Fname = 'Fabio' AND S_City = 'Charlotte'

Select S_Fname, S_Phone
from Student
where S_Fname = 'ZEB' AND S_City = 'Charlotte'

Select *
from Student
where Student_ID = 1005 AND S_Zip = 28201

Select *
From Products
Where Supplier_ID = 1 AND Category_ID = 3

Select S_Phone, Student_ID
from Student where S_Fname = 'Cathy' OR S_City = 'Charlotte'


-- IN & NOT
Select *
From Student
where S_Fname = 'cathy' or S_Fname = 'zeb' or S_Fname = 'jen'

--the above can be written


Select * 
from Student 
where S_Fname In ('Cathy', 'Zeb','Jen')

Select * 
from Student
where S_Zip NOT IN(28202, 62323, 28278,67623, 28733)

--BETWEEN
Select *
from Student
where Student_ID between 1008 and 1014

Select *
from Student
where Student_ID between 1004 and 1006

Select *
from Student
where Student_ID not between 1002 and 1005


Create Table Customers
  (Cust_Id int,
   Cust_Fname varchar(50),
   Cust_Lname varchar(50),
   Cust_Addr1 varchar(50),
   Cust_Addr2 varchar(50),
   Cust_City varchar(50),
   Cust_Zip int,
   Cust_DOB date,
   Dept_Id int,
   Cust_Basic_Sal decimal(10,2),
   Cust_Benefits decimal(10,2),
   Cust_Commision decimal(10,2))

BULK INSERT Customers
From 'C:\Users\Warbucks\Desktop\Data Analyst\Customers.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

Select * 
from Customers

--STRING OPERATIONS

--Customer with a customer name starting with "m"

select * from Customers
where Cust_Fname Like 'M%'

select * from Customers
where Cust_Fname Like 'Ma%'

--Customer with a customer name ending with "y"

select * from Customers
where Cust_Fname Like '%y'

--Customer with a customer name with 'ar' in any position
select * from Customers
where Cust_Fname Like '%ar%'

--Customer with a first name that have 'e' in second position
select * from Customers
where Cust_Fname Like '_e%'

--cutsomer with last name that have 'k' in fourth position
select * from Customers
where Cust_Lname Like '___k%'

--customer first name start with 'm' and are atleast 3 characters in length
select * from Customers
where Cust_Fname Like 'm___'

select * from Customers
where Cust_Basic_Sal Like '%.0%'

--customer with a first name starts with 'k'  and ends with 'e'
Select * from Customers
where Cust_Fname like 'k%e'

--customer name not start with 'b'
Select * from Customers
where Cust_Fname not like 'm%'

Select * from Customers
where Cust_Fname not like '%s'

--CAST() FUnction
--CONVERT() FUNCTION

Select cust_fname+ ' '+cust_lname+' is having a salary: '+ CAST(Cust_Basic_Sal as varchar) as Fullname
From Customers


--The CAst() function converts a value of anytype into a specified datatype
Select 45.23 + 'Is my Sales Tax' as statement
Select CAST(45.23 as varchar) + ' Is my sales tax' as 'comments'

Select ' my sales tax for this year 2021 is: ' + CAST(1002.34 as varchar) as comment

Select '2020-10-15'
Select CAST('2020-10-15' As datetime);
Select CAST('2020-10-15' As date);

Select * from Student
Select S_fname, s_address1 + ' ' + s_address2 + ' '+ s_city + ' ' + CAST(S_zip as varchar) + ' ' + S_Country as 'Student Address'
from Student

--CONVERT
Select CONVERT(varchar, 34.14) as 'Number'
Select CONVERT(datetime, '10-15-23') as 'Date'
Select S_fname, s_address1 + ' ' + s_address2 + ' '+ s_city + ' ' + Convert(varchar, S_Zip) + ' ' + S_Country as 'Student Address'
from Student

--Aggregate Functions
--Count
--Avg
--Sum
--Max
--Min




--COunt
Select * from Products
Select COUNT(Price) from Products;

--AVG
Select Category_ID, AVG(PRice) as avgprice
from Products group by Category_ID

--SUM
Select supplier_ID, sum(price) as sumprice
from Products group by Supplier_ID
--Max

--MIn


/*
1.Create
2.Insert 
  -Bulk Insert
  -Insert Into
3.Select 
4.SQL CLAUSES
  -Where 
  -Group By
  -Having
  -Into
  -Order By
5.STRING FUNCTIONS with EXAMPLES
  -Lower()
  -Upper()
  -Trim()
  -Ltrim()
  -Rtrim()
  -Left()
  -Right()
  -Len()
  -String_Split()
  -Replace()
  -Reverse()
  -ifference()
  -Replicate()
  -Translate()

6.Arithmetic Functions:
  -Abs()
  -Ceiling()
  -Floor()
  -Exp ()
  -SQUARE()
  -Sqrt()
  -Power()

7.Truncate Table

8.Boolen Operators
  -And
  -OR
  -IN
  -Not
  -Between
  -LIKE
  -EXISTS?
  -ALL?
  -ANY?

9.Aggregate Functions
  -COUNT
  -AVG
  -SUM
  -MAX
  -Min
 
10.String Operations (%,_)
  -Using %,_
  -Convert()
  -Cast()

11.Delete & Truncate & Drop

12.Update

13.Primary and Foreign Key
14.Alter Command
15.Exercises with PK/FK table data

--DELETE (removes data based on condition)
--TRuncate (wipes data compeletey from table without condition)
--Drop ( remove the data and schema/structure of data)
--Update ( will modify or update to existing data in a table)
--Alter ( will make changes to schema or data definition)

/* Delete & Truncate
Difference between Delete and Truncate:​

TRUNCATE:​

TRUNCATE command in SQL removes all rows from a table ​
It doesn’t log the individual row deletions in the transaction log ​
The TRUNCATE statement has the same functionality as the DELETE statement​
However, we cannot use the WHERE Clause with the TRUNCATE statement.​
A TRUNCATE cannot be executed if constraints are in place​ 


DELETE:​
The DELETE command in SQL also removes rows from a table​
It logs the individual row deletions in the transaction log ​
We can use the WHERE Clause with the DELETE statement to qualify which rows are to be deleted​
Rollback Transaction – will help recover the deleted rows​
You are allowed to DELETE records that have foreign key constraints defined
*/ 
*/





Select * from Student

Select * from products_ext
delete from products_ext
where Product_name = 'paper002'

delete * from products_ext
where

-- Retrieve all the records from Student table
-- Retrieve all the students data for the students live in zip code 62323
-- Retrieve all the students data for the students Last name is 'Carver'
-- Retrieve all Student_Id, S_FName, S_Address1, S_City, S_Zip for students live at the zip 25635
-- Retrieve the records from Products table for Category Id = 1
-- Retrieve the records from Products table for Price less than 20
-- Retrieve the records from products table for Supplier Id is 2
-- Retrieve the average price of the products for Category_Id 2
-- Retrieve the sum of price of the products for Supplier_Id is 1
-- Retrieve the Unit and product_Name for the products table for Supplier_Id is 2
-- Retrieve the Product_Id and Product_name from the Products table
-- Retrieve the data from STudents table for all student ID in ascending order
-- Retrieve data from Person for Last Name in descending order
-- Retrieve Average price from Products group by category
-- Retrieve Count of students who are living at zip code 62323
-- Retrieve Count of students group by zip code

--UPDATE
--COMMAND SYNTAx
/*
UPDATE TABLE_NAME
SET COLUMN1 = value1, column 2 = value2, ...
WHERE CONDITION;
*/

Select * From Student
UPdate Student
SET S_FNAME = 'NICHOLUS'
where Student_ID = 1006;

UPDATE Student
SET S_Lname ='Oslo', S_Address1 ='1344 Main St', S_Address2 ='Suite 235'
WHERE Student_ID = 1002;

--Update Student table with S_CIty to Detroit for ther student ID between 1002 and 1005

Select * From Student
UPDATE Student
SET S_CITY ='Detroit'
where Student_ID between 1002 and 1005;

--UPDate Student for S_COuntry to Mexico for Student_ID 1008
Select * from Student
Update Student
Set S_Country ='Mexico'
Where Student_ID= '1006'

--Update Student Table for S_Address1 to 1122 Palace St for Student_ID = 1002
Update Student
Set S_Address1 ='1122 Palace St'
Where Student_ID= '1002'

Select * from Customers


--UPDATE Exercise
--Update S_FName, S_Address1, S_City for Student_Id = 1005


--Update S_City to Unknown where Student_Id = 1005


--Update S_Phone to 990 009 4531 where Student_Id = 1009


--Update full addess and Name of a S_Zip = 67763


--Update S_City to Unknown where Student_Id = 1005

-- Delete from Customers
where Cust_Zip between 27766 and 28788

-- Delete from cust_department
Where dept_id = 106
select * from cust_department

--Delete from Macyscustomers


--SQL CONSTRAINTS ***********
--PRIMARY KEY
--FOREIGN KEY
--CHECK
--DEFAULT
--UNIQUE


--CHEck COnstraint
CREATE TABLE PERSON_TMP
(P_ID INT,
P_NAME Varchar(50),
P_AGE Int CHECK (P_AGE <=20),
P_CITY varchar(40),
P_ZIP varchar(10))

INSERT INTO PERSON_TMP (P_ID, P_NAME, P_AGE, P_CITY, P_ZIP)
VALUES (101, 'TOMMY LEE',22,'CHARLOTTE','27622') --thIS WILL SHOW AN ERROR FOR CHECK CONSTRAINT

INSERT INTO PERSON_TMP (P_ID, P_NAME, P_AGE, P_CITY, P_ZIP)
VALUES (101, 'TOMMY LEE',20,'CHARLOTTE','27622') --tHIS WILL BE INSERTED

SELECT * FROM PERSON_TMP

INSERT INTO PERSON_TMP (P_ID, P_NAME, P_AGE, P_CITY, P_ZIP)
VALUES (102, 'ASHLEY LEE',18,'CHARLOTTE','28276')

--BOUNDARY VALUE ANALYSIS

Select * From PERSON_TMP
ALter table person_tmp drop constraint CK__PErson_TM__P_AGE__61a66d40
ALter table person_tmp add constraint CK_P_AGE CHECk(P_Age <=20)

Drop Table PERSON_TMP

--DEFAULT CONSTRAINT

CREATE TABLE PERSON_DEF
(P_ID Int,
P_NAME varchar(50),
P_AGE INT,
p_CITY varchar(40) DEFAULT 'Charlotte',
P_zip varchar(10))

Select * from PERSON_DEF

Insert Into PERSON_DEF (P_ID, P_Name, P_AGE, P_zip)
Values (101,'Tommy Lee',18,'27676') --This will be inserted with a default value "Charlotte" for P_City

Insert Into PERSON_DEF (P_ID, P_Name, P_AGE, P_zip)
Values (102,'Ashley Lee',17,'27787')

Insert Into PERSON_DEF (P_ID, P_Name, P_AGE,p_CITY, P_zip)
Values (101,'Zach Lee',17,'Detroit','28886')

create table Person_def3
(p_id int,
p_name varchar(50),
p_age int,
p_city varchar(40), constraint df_city default 'charlotte',
p_zip varchar(10))

--Unique key constraint (can be added to any # of columns)
CREATE TABLE Person_Uni
(P_ID INT,
P_NAME Varchar(50),
P_Age Int,
P_CITY Varchar(40),
P_Zip Varchar(10)
Constraint UQ_P_ID UNIQUE(P_ID))

Insert Into Person_Uni (P_ID, P_NAME, P_Age, P_CITY, P_Zip)
Values (107,'zach lee',23,'charlotte','27786')
Insert Into Person_Uni(P_ID, P_Name, P_AGE, P_zip)
Values (100,'TOMMY LEE',18,'27786')

Insert Into Person_Uni(P_ID, P_Name, P_AGE, P_zip)
Values (109,'Ashley Lee',17,'27787')

Insert Into Person_Uni(P_ID, P_Name, P_AGE,p_CITY, P_zip)
Values (108,'Zach Lee',17,'Detroit','28886'

SELECT * FROM Person_Uni

--Unique, Default and Check constraints
Create Table Person_AllCon
(P_ID Int,
P_Name Varchar(50),
P_AGe Int CHeck (P_Age <=20),
P_City Varchar(40) DEFAULT 'Charlotte',
P_ZIP Varchar(10)
COnstraint uq_u_id unique(p_zip),
constraint pk_pid primary key (p_Id))

Insert Into Person_AllCon (P_ID, P_Name, P_AGe, P_ZIP)
Values (101,'ashley lee',20,'27786')

Insert Into Person_AllCon (P_ID, P_Name, P_AGe, P_ZIP)
Values (102,'zach lee',20,'27786')


CREATE TABLE EMPLOYEE 
(Emp_ID Int,
Emp_FName Varchar (50),
Emp_LName Varchar (50),
Emp_Addr1 Varchar (40),
Emp_Addr2 Varchar (40),
Emp_City Varchar (40),
Emp_Zip Int,
Emp_Sal Decimal(10,2),
EDept_Id Int,
CONSTRAINT PK_EMPID PRIMARY KEY (Emp_ID),
CONSTRAINT FK_DeptId FOREIGN KEY (EDept_Id) REFERENCES EMP_DEPARTMENT(Dept_Id))

CREATE TABLE EMP_DEPARTMENT
(Dept_Id Int,
Dept_Name Varchar(40),
Dept_City Varchar(30),
Dept_State Varchar(10)
CONSTRAINT PK_DeptidPRIMARY KEY (Dept_Id)
CONSTRAINT FK_Deptcity FOREIGN KEY (Dept_City) REFERENCES Dept_Location(Department_City))

Create Table Dept_Location
(Department_City Varchar (30),
Addr1 Varchar(50),
Addr2 Varchar(50),
Zip_Code int,
Phone_No Varchar(10),
CONSTRAINT PK_DeptCity Primary Key (Department_City))

BULK INSERT Dept_Location
From 'C:\Users\Warbucks\Desktop\Data Analyst\Dept_Location.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

BULK INSERT Emp_Department
From 'C:\Users\Warbucks\Desktop\Data Analyst\Emp_Department.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

BULK INSERT Employee
From 'C:\Users\Warbucks\Desktop\Data Analyst\Employee.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

select * from EMPLOYEE
Select * from EMP_DEPARTMENT
select * from Dept_Location

--Retrieve all the records from employee who has dept id is 1003
Select * from EMPLOYEE
where EDept_Id = 1003

--Retrieve all the records from employee who emp zip is 28989
Select * from EMPLOYEE
where Emp_Zip = 28989

--Retrieve all the records from employee where emp zip is greater than 28989
select * from EMPLOYEE
where emp_zip > 28989

--Retriece all the records from employee who emp zip is 28989 or 28299
Select * from EMPLOYEE
where Emp_Zip in (28989, 28299)

--Retrieve all the records from Employee who F_names between the letter starts with D & H
select * from EMPLOYEE
where Emp_FName like 'D%'or Emp_FName like 'h%'

--Retrieve emp_zip from employee group by emp_zip
select EMP_zip, count(emp_id) from EMPLOYEE
group by Emp_Zip

--Retrieve emp_zip from employee group by emp_zip for employees by zip >2
select emp_zip, count(emp_id) as countofemp from employee
group by emp_zip
having count(emp_zip)>2

--Retrieve Dept_id from employee group by dept_id
select edept_id, count(emp_id) as countofemp
from EMPLOYEE
group by EDept_Id

--Retrieve Count of Employees from Employee table group by Dept_id, for Employee Count >3
select edept_id, count(emp_id) as countofemp
from EMPLOYEE
group by EDept_Id
having count(Emp_ID)>3

--sub queries/embedded queries/nested queries


--retrieve department details from emp_department and dept_location for the dept_id

select Dept_city from EMP_DEPARTMENT
where dept_id = 1002

select * from Dept_Location
where Department_City = 'charlotte'

--above two lines are dissection from the bottom one

select * from Dept_Location
where Department_City = (select dept_city from EMP_DEPARTMENT where dept_id = 1002)

--retrieve department details from department for the emp id 103
select * from EMP_DEPARTMENT
where dept_id = (select edept_id from employee where Emp_ID = 103)

--retrieve all the records of employees who work location is troy
select dept_id from EMP_DEPARTMENT
where Dept_City = 'troy'

select * from EMPLOYEE
where EDept_Id = 1008

select * from EMPLOYEE
where EDept_Id = (select Dept_id from EMP_DEPARTMENT where Dept_City = 'troy')

--retrieve emp_id, emp_fname, emp_lname from employee whose departmenr name is mechanical
select emp_id, emp_fname, emp_lname
from EMPLOYEE where EDept_Id = (select dept_id from EMP_DEPARTMENT where dept_name = 'mechanical')

--retrieve emp_id, emp_addr1, emp_city, emp_zip from employee whose department city is Charlotte
Select emp_id, emp_addr1, emp_city, emp_zip
from EMPLOYEE where EDept_Id in(select dept_id from EMP_DEPARTMENT where dept_city = 'charlotte')

--retrieve emp_id, emp_zip from employee who are all working in department chemical
select emp_id, emp_zip from EMPLOYEE
where EDept_Id in (select dept_id from EMP_DEPARTMENT where dept_name = 'chemical')

--retrieve emp_fname, emp_lname from employee whose department name is treasury
select emp_fname, emp_lname from employee
where EDept_Id in (select dept_id from dept_location where dept_name = 'treasury')

--retrieve emp id, emp_sal from employee who are working in machines department
select emp_id, emp_sal from employee
where EDept_Id in (select Dept_id from EMP_DEPARTMENT where Dept_Name = 'machines')

select * from EMP_DEPARTMENT
select * from Dept_Location

--Retrieve Dept_ID, Dept_Name, Dept_State where location Zip_Code = 28277
select dept_id, dept_name, dept_state from EMP_DEPARTMENT
where dept_city in (select department_city from dept_location where Zip_Code = 28277)

-- Retrieve Emp_Id, Emp_FName, Emp_LName for location Zip_Code 88160
select department_city from Dept_Location where zip_code = 88160 --new brunswick
select dept_id from EMP_DEPARTMENT where dept_city = 'news brunswick' --1006
select emp_id, emp_fname, emp_lname from employee where edept_id = 1006


select emp_id, emp_fname, emp_lname
from EMPLOYEE
where EDept_Id in (select dept_id
from EMP_DEPARTMENT
where dept_city in
(select department_city from Dept_Location where Zip_Code = 88160))

--retrieve department addr1,add2,zip_code,phone_no for emp_id 101
select * from Dept_Location
select addr1, addr2, zip_code, phone_no
from Dept_Location
where Department_City in (select dept_city 
                          from EMP_DEPARTMENT
						  where dept_id in (select edept_id
						                    from EMPLOYEE
											where emp_id =101))



-- Retrieve Dept_ID, Dept_Name, Dept_State where location Zip_Code = 28277

select * from customers
select * from cust_department

--PRACTICE BELOW--

--Retrieve Cust_Id, Cust_FName,Cust_Commission for all customers from Dept_Loc Carolina Place
--Retrieve Sum of Basic Sal for South Park Location Customers
--Retrieve Customer data from Customers table where the dept_name Salon
--Retrieve Customer data from Customers table where the dept_name Clothing Men
--Retrieve Customer data from Customers table where the dept_name Clothing Women
--Retrieve Cust_Fname,Cust_LName,Cust_City,Cust_Basic_Sal from Customers where Dept_Loc is North Lake
--Retrieve Cust_Fname,Cust_LName,Cust_City,Cust_Basic_Sal from Customers where Dept_Loc is North Lake or South Park
--Retrieve all the cust department information from Cust_Department table where customer basic sal < 7000
--Retrieve all the cust department information from Cust_Department table where customer  Cust_Commision > 0.50
--Retrieve all the cust department information from Cust_Department table where  Cust_DOB < '1989-05-10'
--Retrieve Cust_Id,Cust_Fname,Cust_LName,Cust_Benefits from Customers table where dept_Loc is Carolina Place

--Create commands ***********

--create table
--create view
--create index
--create unique index
--create database
--create prodcedure

-- VIEWS
-- A view may consist of columns from multiple tables using joins or just a subset of columns of a single table.
-- This makes views useful for abstracting or hiding complex queries.

-- Advantages of Views
-- 1.Security: Restrict users to access directly to a table and allow them to access a subset of data via views
-- 2.Simplicity: A relational database may have many tables with complex relationships
   -- e.g., one-to-one and one-to-many that make it difficult to navigate.
   -- However, you can simplify the complex queries with joins and conditions using a set of views.
-- 3.Consistency:Sometimes, there is need to write a complex formula or logic in every query.
   -- To make it consistent, you can hide the complex queries logic and calculations in views.
   -- Once views are defined, you can reference the logic from the views rather than rewriting it in separate queries.

   --1. Create View
   /*Syntax: CREATE VIEW view_name [(column_list)]
                      AS select_statement; */
Create View Employee_Tmp_View
As Select * From EMPLOYEE

Select * from Employee_Tmp_View

Select * from EMPLOYEE --original master copy of view (items will not show up in master if you insert new data into view)

--INSERT
--DELETE
--UPDATE


--INSERT INTO VIEW
INSERT INTO Employee_Tmp_View (EMP_ID, Emp_FName, Emp_LName, Emp_Addr1, Emp_City, Emp_Zip, Emp_Sal, EDept_Id)
VALUES (131, 'JON', 'RUN', '2 GOodwill Dr', 'Charlotte', 45674, 33456, 1009) --worked

INSERT INTO Employee_Tmp_View (EMP_ID, Emp_FName, Emp_LName, Emp_Addr1, Emp_City, Emp_Zip, Emp_Sal, EDept_Id)
VALUES (132, 'JaN', 'RiN', '9 GOodwill Dr', 'Charlotte', 45374, 33406, 1009)

Delete from Employee_Tmp_View
where emp_id =132

Update Employee_Tmp_View
Set Emp_Addr2 = 'suite 3456'
where Emp_ID = 131

Select * from EMPLOYEE
Select * from Employee_Tmp_View

Create view Employee_tmp_view1
As
Select emp_id, emp_fname, emp_city, edept_id
from employee

select * from Employee_Tmp_View

INSERT INTO Employee_tmp_view1 (EMP_ID, Emp_FName, Emp_City, EDept_Id)
VALUES (132, 'JaN', 'Charlotte', 1009)

select * from Employee_tmp_view1


Create View Employee_Tmp_View2 As
Select Emp_ID,Emp_FName, EMP_LNAME, EMp_SAL, EDEPT_ID
from employee
Where EDept_Id IN (SELECT DEPT_ID FROM EMP_DEPARTMENT WHERE Dept_City = 'Charlotte')

Select * from Employee_Tmp_View2

Create View Employee_View3 As
Select EMp_ID, EMp_Fname, EMP_Lname, EMp_Sal, EMp_Sal*03 as 'Sal Increase', EDept_ID
From EMPLOYEE
where EDept_Id = 1003
--above example creates new column 'alias' with the salary increase x3 (how do I use decimal?)

Select * from Employee_View3

Drop view Employee_View3


--Index
--Clustered Index Syntax
/* CREATE UNIQUE CLUSTERED INDEX
    index_name
ON View/Table(attribut_name); */

--PRIMARY KEY WILL ALWAYS HAVE CLUSTERED INDEX BY DEFAULT and will never have NULLS
--There can only be one clustered index on a table

--Non Clustered Index Syntax
/* CREATE NONCLUSTERED INDEX
    index_Name
ON View/Table(attribute_name); */

SELECT * into employee_tmp
From EMPLOYEE

select * from employee_tmp

create index idx_emp_fname
ON EMployee_tmp(emp_fname)

Alter table Employee_tmp
drop index employee_tmp.idx_emp_fname

Create clustered index idx_emp_name
On Employee_Tmp(Emp_Fname)

--1.Select Top
--2.Not Null Constraint
--3.COlumn Alias and Table ALias
--4.MErge COmmand
--5.Distinct
--6.Find Highest and Lowest Sal
--7.Rename()
--8.Case
--9.Transaction COntrol
--10.Merge COmmand


--1. Select Top
Select * From EMPLOYEE
Select top 5 * from employee

Select top 10 * from employee order by Emp_ID desc
Select * From employee order by Emp_FName

select emp_zip, count(emp_id) from EMPLOYEE
group by emp_zip

select top 3 count(emp_id) as emp_id_count,emp_zip
from employee
group by (Emp_Zip)

select top 10 count(emp_id) as emp_id_count,emp_zip
from EMPLOYEE
group by (emp_zip)
order by (emp_id_count) desc

--2. Not Null Constraint

Create table emp_null
(Emp_ID Int Constraint EmpID_NotNull Not Null,
Emp_Name Varchar(50))

INSERT INTO emp_null
(emp_name) Values ('Steven')

INSERT INTO emp_null
(emp_id, emp_name) Values ('', 'John')

Select * from emp_null

INSERT INTO EMP_NULL
(emp_id, emp_name) Values (1, 'Mary')

--Entering 'space' or blank on not null constraint, it will always show up as '0'

Create Table Emp_Null1
(Emp_ID Int Not NUll,
Emp_Name Varchar(50)

--3. COlumn Alias and Table Alias

--Retrieve Department Details from Department along with Emp_ID and EMpFname from EMployee table
Select * from EMP_DEPARTMENT
where Dept_Id in (select edept_id from employee where emp_id = 103)

--Write the above query to retrieve emp_id, emp_fname, emp_lname, and all the details from
--emp_department table

Select E.emp_id, E.emp_fname, E.emp_lname, E.edept_id, EP.dept_name, EP.dept_city, EP.dept_state
from EMPLOYEE E, EMP_DEPARTMENT EP
where E.EDept_Id = EP.Dept_Id AND E.EMP_ID = 103

--Retrieve Emp_id, emp_fname, emp_lname, dept_id, dept_name, dept_city from employee
--whose department name is Mechanical

Select E.Emp_id, E.emp_fname, E.emp_lname, EP.dept_id, EP.dept_name, EP.dept_city
from employee E, EMP_DEPARTMENT EP
where E.EDept_Id = EP.Dept_Id AND EP.Dept_Name = 'Mechanical'

--Retrieve emp_id, emp_fname, emp_lanme, dept_name, dept_city, dept_state from employee & emp_department
--where dept_id = 1005

Select E.emp_id, E.emp_fname, E.emp_lname, EP.dept_name, EP.dept_city, EP.dept_state
from employee E, EMP_DEPARTMENT EP
where E.EDept_Id = EP.Dept_Id AND EP.Dept_Id = 1005

--RETRIEVE EMP_ID, emp_fname, emp_lname, edept_id, dept_name, dept_city, addr1, zip_code, phone_no
--from employee, emp_department, dept_location for employees working in Charlotte

Select E.Emp_ID, E.Emp_fname, E.EMp_lname, E.Edept_ID, EP.dept_name, EP.Dept_CIty, DL.Addr1, DL.Zip_Code,
       DL.Phone_No
From EMPLOYEE E, EMP_DEPARTMENT EP, Dept_Location DL
where E.EDept_Id = EP.Dept_Id AND EP.Dept_City = DL.Department_City and ep.dept_city = 'detroit'

--4.MERGE COMMAND

CREATE TABLE EMP_Merge_Source
(Emp_Id Int,
Emp_Name Varchar(50),
Emp_City Varchar(50),
Emp_Zip Int,
Emp_Age Int)

CREATE TABLE EMP_Merge_Target
(Emp_Id Int,
Emp_Name Varchar(50),
Emp_City Varchar(50),
Emp_Zip Int,
Emp_Age Int)

BULK INSERT Emp_Merge_Source
From 'C:\Users\Warbucks\Desktop\Data Analyst\EMP_Merge.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

BULK INSERT Emp_Merge_Target
From 'C:\Users\Warbucks\Desktop\Data Analyst\EMP_Merge.txt'
WITH (FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')

Select * from EMP_Merge_Source
Select * from EMP_Merge_Target

--1. Make Updates to Source Table Data
--2. Add/Insert a record to Source Data
--3. Delete a record from Source Table

--1. Update 
Update EMP_Merge_Source
Set Emp_Name = 'Shyri McCalley', Emp_City = 'Charlotte', Emp_Zip = 28277
Where EMp_id = 101

--2. Insert
Insert Into EMP_Merge_Source
(Emp_ID,
EMp_name,
EMp_city,
emp_zip,
emp_age) Values (109, 'Cathy Cassel', 'Pineville',28788, 23)

--3. Delete
Delete From EMP_Merge_Source  where emp_Id = 107

Merge Emp_Merge_Target T Using Emp_Merge_Source S
On (S.Emp_id = T.Emp_Id)
When Matched Then
Update Set
T.Emp_Name = S.Emp_Name,
T.Emp_City = S.Emp_City,
T.Emp_Zip = S.Emp_Zip,
T.Emp_Age = S.Emp_Age
When Not Matched By Target
Then Insert (Emp_Id,Emp_Name,Emp_City,Emp_Zip, Emp_Age)
Values (S.Emp_Id,S.Emp_Name,S.Emp_City,S.Emp_Zip, S.Emp_Age)
When Not Matched by Source
Then Delete;

--5.Distinct
Select Distinct(EMp_CIty) from employee
Select DIstinct EMp_zip from employee

Select COUNT(EMP_FNAME), EMP_FNAME From EMPLOYEE
Group By Emp_FName
Having COunt(EMP_FNAME) > 1
--counts how many times a name has been repeated




--Select Distinct Employee ID, First Name, Last Name, City of emplyoyee
Select 

--6. FIND HIGHEST AND LOWEST SAL FROM EMPLOYEE TABLE
-- 6. Find Highest and Lowest Sal From Employee Table
-- Find First Highest Sal from Employee table
-- Find Least Sal from Employee table
-- Find Second Highest Sal from Employee table

Select Max(emp_sal) as max_sal from EMPLOYEE --11367.98
Select * from employee order by emp_sal desc


select MIN(emp_sal) as Min_sal from employee --4094.09
select * from EMPLOYEE order by Emp_Sal 

Select Distinct top 2 Emp_Sal
from employee order by emp_sal desc

select top 1 emp_sal
from employee where Emp_Sal in (select distinct top 2 emp_sal
                               from employee order by emp_sal desc) order by emp_sal
--picks second highest salary above
--interview question potentially

select max(emp_sal) from EMPLOYEE where emp_sal not in
(select max(emp_sal) from EMPLOYEE)
--youssef own version


--7, Rename()
Select * from employee_tmp
Exec SP_RENAME
Exec SP_RENAME 'EMployee_tmp', 'Employee_Rename'

Select * from employee_rename

exec sp_rename 'Employee_rename.Emp_City','Department_ID','COlumn'

--RENAMING COLUMN ABOVE 'table_name.column_alias','new_column_alias','column'
syntax above

--8. CASE

Emp_Sal > 8000
Emp_Sal > 6000 and < 8000
Emp_Sal < 6000
--conditions

Select * from EMPLOYEE
Select Emp_ID, EMp_Fname, EMp_LNAME, EMP_SAL, EDEPT_ID,
Case  
      WHEN EMP_SAL > 8000 THen 'SALARY ABOVE MARKET'
	  WHEN EMP_SAL > 6000 AND EMP_SAL<8000 then 'SALARY IS AS PER MARKET'
	  ELSE 'SALARY IS BELOW THE MARKET'
END
AS 'SALARYRANKING'
FROM EMPLOYEE ORDER BY SALARYRANKING


Select * from Products


--USE CASE STATEMENT TO DECISION THE PRODUCTS BASED ON CATEGORY_ID
--IF A PRODUCT IN CATEGORY 1 called containers
--IF product in category 2 is called plasticCORE
--If a product in category 3 called GLASSWARE
--REST ALL FALLS INTO RANDOM

SELECT PRODUCT_ID, PRODUCT_NAME, PRICE,
CASE
       WHEN CATEGORY_ID = 1 THEN 'CONTAINER'
	   WHEN CATEGORY_ID = 2 THEN 'FOAM'
	   WHEN CATEGORY_ID = 3 THEN 'GLASSWARE'
	   ELSE 'RANDOM'
END
AS 'CategoryCLassification'
From Products

--9. TRANSACTION CONTROL
--1. COMMIT
--2. ROLLBACK
--3. SAVE POINT

--work with products_sub
select * from Products_Sub
Drop table Products_Sub
Select * into products_sub from Products

--DELETE and ROLLBACK
--tran = transaction *is a must*

BEGIN TRAN
DELETE FROM products_sub
WHERE Supplier_ID = 1

ROLLBACK TRAN
--undo transactions

BEGIN TRAN
UPDATE PRODUCTS_SUB
Set Product_Name = 'Rollback Check'
Where Product_ID = 1

Select * from products_sub

rOLLback tran

--Commit
--Commit with a delete

BEGIN TRAN
DELETE FROM products_sub
WHERE Product_ID = 18

SELECT * from products_sub

COMMIT
--makes transaction permananent

ROLLBACK TRAN

--commit with UPDATE
BEGIN TRAN
UPDATE products_sub
SET Product_Name = 'ROLLBACK CHECK'
WHERE Product_ID = 1

SELECT * FROM products_sub
COMMIT

ROLLBACK TRAN


--SAVE POINT
select * from emp_null

begin tran
save tran sp0
INSERT INTO Emp_Null1 (Emp_ID, Emp_Name)
VALUES (001, 'AFTER SP0')
save tran sp1
INSERT INTO EMP_NULL (EMP_ID, EMP_NAME)
VALUES (002, 'AFTER SP1')
Save Tran SP2
Insert into emp_null1 (emp_id, emp_name)
values (003, 'After SP2')


--5/11/23(Thursday)
--JOINS :
--Joins are used to retrieve data from two or more related tables in SQL Server.
--These tables are related each other using Foreign Key Constraint.
-- Types of Joins
-- 1.Join or Inner Join
--Inner Join: An inner join returns only the rows that have matching values in both tables.
--It combines rows from two tables based on a specified condition using the JOIN or INNER JOIN keyword.
-- 2.Outer Join
	 -- Left Join OR Left Outer Join
	 -- Right Join OR Right Outer Join
	 -- Full Join OR Full Outer Join
-- 3.Cross Join

Select * from EMPLOYEE
Select * from EMP_DEPARTMENT
SElect * from Dept_Location

Insert INTO EMPLOYEE
(EMP_ID, Emp_FName, Emp_LName, Emp_Addr1, Emp_City, Emp_Zip, Emp_Sal)
Values('140', 'TEST JOIN', 'JOIN TEST', '19009 TRESCOTT ST', 'CHARLOTTE', '28982', 9000.00)

INSERT INTO EMP_DEPARTMENT
(DEPT_ID, Dept_Name, Dept_City, Dept_State)
VALUES(1010, 'DEPT JOIN', 'Troy', 'mi')

INSERT INTO EMP_DEPARTMENT
(DEPT_ID, Dept_Name, Dept_City, Dept_State)
VALUES(1011, 'DEPT JOIN', 'Troy', 'mi')


DELETE from Dept_Location where Department_City = 'Troy'
DELETE from EMP_DEPARTMENT where EDEPT_ID = 1009

--Join OR INNER JOIN
Select EMP_ID, EMP_FNAME, EMP_LNAME, EMP_CITY, EMP_SAL, EDEPT_ID, DEPT_NAME, DEPT_CITY
FROM EMPLOYEE
INNER JOIN EMP_DEPARTMENT
ON EMPLOYEE.EDept_Id = EMP_DEPARTMENT.Dept_Id

--LEFT OUTER JOIN
Select EMP_ID, EMP_FNAME, EMP_LNAME, EMP_CITY, EMP_SAL, EDEPT_ID, DEPT_NAME, DEPT_CITY
FROM EMPLOYEE
LEFT OUTER JOIN EMP_DEPARTMENT
ON EMPLOYEE.EDept_Id = EMP_DEPARTMENT.Dept_Id

--REVERSE THE TABLES
Select EMP_ID, EMP_FNAME, EMP_LNAME, EMP_CITY, EMP_SAL, DEPT_ID, DEPT_NAME, DEPT_CITY
FROM EMP_DEPARTMENT
LEFT JOIN EMPLOYEE
ON EMPLOYEE.EDept_Id = EMP_DEPARTMENT.Dept_Id

Select EMP_ID, EMP_FNAME, EMP_LNAME, EMP_CITY, EMP_SAL, EDEPT_ID, DEPT_NAME, DEPT_CITY
FROM EMP_DEPARTMENT
LEFT JOIN EMPLOYEE
ON EMPLOYEE.EDept_Id = EMP_DEPARTMENT.Dept_Id

--RIGHT OUTER JOIN
Select EMP_ID, EMP_FNAME, EMP_LNAME, EMP_CITY, EMP_SAL, EDEPT_ID, DEPT_NAME, DEPT_CITY
FROM EMPLOYEE
RIGHT JOIN EMP_DEPARTMENT
ON EMPLOYEE.EDept_Id = EMP_DEPARTMENT.Dept_Id

--FULL OUTER JOIN
Select EMP_ID, EMP_FNAME, EMP_LNAME, EMP_CITY, EMP_SAL, EDEPT_ID, DEPT_NAME, DEPT_CITY
FROM EMPLOYEE 
FULL OUTER JOIN EMP_DEPARTMENT
ON EMPLOYEE.EDept_Id = EMP_DEPARTMENT.Dept_Id

--CROSS JOIN
Select EMP_ID, EMP_FNAME, EMP_LNAME, EMP_CITY, EMP_SAL, EDEPT_ID, DEPT_NAME, DEPT_CITY
FROM EMPLOYEE 
CROSS JOIN EMP_DEPARTMENT

Use msdb
Select * from employee
select * from EMP_DEPARTMENT
select * from Dept_Location

Select Emp_ID, Emp_FName, Emp_LName, Emp_Sal, Dept_Name, Dept_City, Addr1, Phone_No
From Employee
Join EMP_DEPARTMENT ON EMPLOYEE.EDept_Id = EMP_DEPARTMENT.Dept_Id
Join Dept_Location ON EMP_DEPARTMENT.Dept_City = Dept_Location.Department_City
Order By Emp_ID