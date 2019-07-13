-- Create all tables based on csv files

CREATE TABLE departments (
dept_no varchar(5) PRIMARY KEY,
dept_name varchar(255) NOT NULL
);

CREATE TABLE employees (
emp_no int PRIMARY KEY,
birth_date date NOT NULL,
first_name varchar(255) NOT NULL,
last_name varchar(255) NOT NULL,
gender varchar(1) NOT NULL,
hire_date date NOT NULL
);

CREATE TABLE salaries (
id serial PRIMARY KEY,
emp_no int NOT NULL,
salary numeric NOT NULL,
from_date date NOT NULL,
to_date date
);

CREATE TABLE titles (
id serial PRIMARY KEY,
emp_no int NOT NULL,
title varchar(255) NOT NULL,
from_date date NOT NULL,
to_date date
);

CREATE TABLE dept_emp (
id serial PRIMARY KEY,
emp_no int NOT NULL,
dept_no varchar(5) NOT NULL,
from_date date NOT NULL,
to_date date
);

CREATE TABLE dept_manager (
id serial PRIMARY KEY,
dept_no varchar(5) NOT NULL,
emp_no int NOT NULL,
from_date date NOT NULL,
to_date date
);


-- Add foreign keys

ALTER TABLE dept_manager 

ADD CONSTRAINT dept_manager_fk1 
FOREIGN KEY (dept_no) REFERENCES departments (dept_no);



ALTER TABLE dept_manager 
ADD CONSTRAINT dept_manager_fk2 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no);



ALTER TABLE dept_emp 

ADD CONSTRAINT dept_emp_fk1 
FOREIGN KEY (dept_no) REFERENCES departments (dept_no);



ALTER TABLE dept_emp 

ADD CONSTRAINT dept_emp_fk2 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no);



ALTER TABLE salaries 

ADD CONSTRAINT salaries_fk1 FOREIGN KEY (emp_no) 
REFERENCES employees (emp_no);



ALTER TABLE titles 
ADD CONSTRAINT titles_fk1 FOREIGN KEY (emp_no) 
REFERENCES employees (emp_no);


