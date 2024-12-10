CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employeees (
    EmployeeID INT PRIMARY KEY,
    Namess VARCHAR(50),
    Age INT,
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Marketing');

INSERT INTO Employeees (EmployeeID, Namess, Age, DepartmentID, Salary) VALUES
(1, 'John Doe', 30, 1, 50000),
(2, 'Jane Smith', 35, 1, 60000),
(3, 'Tom Johnson', 40, 2, 70000),
(4, 'Emily Brown', 28, 2, 55000),
(5, 'Michael Lee', 45, 3, 80000);

select *from Departments;
select *from employeees;

# Query 1: Retrieve the names of employees and their respective departments sorted by department name

with departments_1 as (
					select * from employeees
                    
),
departments_2 as(
                 select *from departments
)                 
select a.Name,a.age,b.DepartmentName
from departments_1 as a
inner join  departments_2 as b
on a.DepartmentID=b.DepartmentID;

# Query 2: Calculate the average age of employees in each department

with average_age1 as (
                     select DepartmentID,namess,avg(age) as avage
                     from Employeees
                     group by DepartmentID,namess,salary
),
average_age2 as(
                select DepartmentID,departmentname
                from departments
)
select a.DepartmentID,a.namess,a.avage,b.departmentname
from average_age1 as a
inner join average_age2  as b
ON a.DepartmentID = b.DepartmentID;
                  
                                     



# Query 3: Retrieve the employees earning more than the average salary.

with employees_1 as(
                   select DepartmentID, namess, avg(salary) as average_salary
				   from Employeees
				   group by DepartmentID, namess
                   
)
select a.* 
from employeees as a
inner join employees_1 as b
where a.salary > b.average_salary
limit 4;






  
                     
      
           
                
                    