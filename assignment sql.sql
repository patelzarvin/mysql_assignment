create database market;
use market;
create table company(
companyid int primary key,
companyname varchar(20),
street varchar(20),
city varchar(20),
state varchar(20),
zip varchar(20)
);
alter table company 
modify column companyname varchar(50);
#second table 
create table contact(
contactid int primary key ,
companyid int,
foreign key (companyid) references company(companyid),
firstname varchar(50),
lastname varchar(50),
street varchar(50),
city varchar(50),
state varchar(50),
zip varchar(50),
ismain boolean,
email varchar(80),
phone varchar(20)
);

CREATE TABLE ContactEmployee(
	ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    FOREIGN KEY (ContactID) REFERENCES contact(ContactID),
	EmployeeID INT,
    ContactDate DATE,
    Description1 VARCHAR(100)
); 

alter table contactemployee
add foreign key(employeeid) references employee(Employeeid);

create table employee (
Employeeid INT PRIMARY KEY ,
FirstName VARCHAR(45),
LastName VARCHAR(45),
Salary DECIMAL(10,2),
HireDate DATE ,
JobTitle VARCHAR(25),
Email VARCHAR(45),
Phone VARCHAR(12)
);

#Q4]In the Employee table, the statement that changes Lesley Bland’s phone number 
#to 215-555-8800
update employee 
set phone = '215-555-8800'
where firstname = 'lesley' and lastname = 'bland';  

#Q5]In the Company table, the statement that changes the name of “Urban 
#Outfitters, Inc.” to “Urban Outfitters” . 
UPDATE Company
SET CompanyName = 'Urban Outfitters'
WHERE CompanyName = 'Urban Outfitters, Inc.';
select*from company;

#Q6]In ContactEmployee table, the statement that removes Dianne Connor’s contact 
#event with Jack Lee (one statement). 
DELETE FROM ContactEmployee
WHERE ContactID = (SELECT ContactID FROM Contact WHERE FirstName = 'Dianne' AND LastName = 'Connor')
  AND EmployeeID = (SELECT EmployeeID FROM Employee WHERE FirstName = 'Jack' AND LastName = 'Lee');


#Q7]Write the SQL SELECT query that displays the names of the employees that 
#have contacted Toll Brothers (one statement). Run the SQL SELECT query in 
#MySQL Workbench. Copy the results below as well.
SELECT Employee.FirstName, Employee.LastName
FROM Employee
JOIN ContactEmployee ON Employee.EmployeeID = ContactEmployee.EmployeeID
JOIN Contact ON Contact.ContactID = ContactEmployee.ContactID
JOIN Company ON Contact.CompanyID = Company.CompanyID
WHERE Company.CompanyName = 'Toll Brothers';

#Q8] What is the significance of “%” and “_” operators in the LIKE statement? 
#Ans.In MySQL, the LIKE operator is used to search for a specific pattern in a column. The % and _ symbols are wildcards used within the LIKE statement to enable pattern matching:

#% :
#Represents zero, one, or multiple characters in a string.
#Example: LIKE 'a%' matches any string starting with "a" (e.g., "apple", "air").

#_ :

#Represents exactly one character in a string.
#Example: LIKE 'a_ple' matches any string that starts with "a" followed by exactly one character, 
#then "ple" (e.g., "apple", "ample").
#These wildcards provide flexibility in pattern matching when using the LIKE operator in SQL queries. 
 
#9]Explain normalization in the context of databases. 
#Ans.Normalization is the process of organizing a relational database to minimize redundancy and dependency by splitting large tables into smaller, manageable ones. It improves data integrity, avoids anomalies, and ensures efficient data management.

#First Normal Form (1NF): Ensures all columns contain atomic (indivisible) values and
 #there are no repeating groups in a table.

#Second Normal Form (2NF): Ensures the table is in 1NF and that all non-key columns
 #are fully dependent on the entire primary key (removes partial dependencies).

#Third Normal Form (3NF): Ensures the table is in 2NF and that no non-key columns 
#are transitively dependent on the primary key (eliminates transitive dependencies).
 
#10] What does a join in MySQL mean?
#Ans.A JOIN in MySQL is used to retrieve data from multiple tables based on related columns.  
 
#11] What do you understand about DDL, DCL, and DML in MySQL? 


#ans.DDL (Data Definition Language): Defines and modifies the structure of database objects (e.g., tables, databases).
#Commands: CREATE, ALTER, DROP, TRUNCATE, RENAME.
#DML (Data Manipulation Language): Manipulates the data stored within the database tables.
#Commands: SELECT, INSERT, UPDATE, DELETE.
#DCL (Data Control Language): Controls access and permissions to the database and its objects.
#Commands: GRANT, REVOKE.
 
#12] What is the role of the MySQL JOIN clause in a query, and what are some 
#common types of joins?
#The JOIN clause in MySQL is used to combine rows from two or more tables based on a related
#column between them. It allows you to retrieve data from multiple tables in a single query.

#INNER JOIN: Returns only matching rows.
#LEFT JOIN: Returns all rows from the left table, and matched rows from the right.
#RIGHT JOIN: Returns all rows from the right table, and matched rows from the left.
#FULL OUTER JOIN: Returns all rows when there is a match in either table (simulated in MySQL).
#CROSS JOIN: Returns the Cartesian product of both tables.
#SELF JOIN: Joins a table with itself.
#The type of JOIN you choose depends on the specific relationships you need to capture in your query.
