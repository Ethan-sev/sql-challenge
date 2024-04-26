-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Departments (
    "dept_no" VARCHAR(30)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE Employees (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR(20)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" Varchar(10)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE Titles (
    "title_id" VARCHAR(10)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE Salaries (
    "emp_no" int NOT NULL,
    "salary" int  NOT NULL
);

CREATE TABLE Dept_Employed (
    "emp_no" int  NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL
);

CREATE TABLE Dept_Manager (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" int  NOT NULL
);

ALTER TABLE Employees ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES Titles ("title_id");

ALTER TABLE Salaries ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

ALTER TABLE Dept_Employed ADD CONSTRAINT "fk_Dept_Employed_emp_no" FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

ALTER TABLE Dept_Employed ADD CONSTRAINT "fk_Dept_Employed_dept_no" FOREIGN KEY("dept_no")
REFERENCES Departments ("dept_no");

ALTER TABLE Dept_Manager ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES Departments ("dept_no");

ALTER TABLE Dept_Manager ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");


