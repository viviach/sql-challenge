DROP TABLE Departments; 
DROP TABLE Employees;
DROP TABLE Manager;
DROP TABLE Employees_info;
DROP TABLE Salaries;
DROP TABLE Titles;


CREATE TABLE Departments (
    dept_no VARCHAR(30) PRIMARY KEY ,
    dept_name VARCHAR(30)
);


CREATE TABLE Titles (
    "title_id" VARCHAR(30)   PRIMARY KEY,
    "title" VARCHAR(30)
   );
   
CREATE TABLE Employees_info (
    emp_no int PRIMARY KEY,
    title_id VARCHAR(30) ,
    birth_date VARCHAR(30) ,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    sex VARCHAR(30),
    hire_date VARCHAR(30),
	FOREIGN KEY (title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Manager (
   dept_no VARCHAR(30),
   emp_no int ,
   FOREIGN KEY (emp_no) REFERENCES Employees_info (emp_no),
   FOREIGN KEY (dept_no) REFERENCES Departments  (dept_no)
     );
	 
	 
CREATE TABLE Employees (
    emp_no int ,
    dept_no VARCHAR(30),
	FOREIGN KEY (emp_no) REFERENCES Employees_info (emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments  (dept_no)
	     );


CREATE TABLE Salaries (
    "emp_no" int,
    "salary" int   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES Employees_info (emp_no)
);







