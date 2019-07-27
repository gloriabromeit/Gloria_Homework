-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/figwjZ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Departments] (
    [dept_no] INTEGER  NOT NULL ,
    [dept_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Dept_emp] (
    [emp_no] INTEGER  NOT NULL ,
    [dept_no] INTEGER  NOT NULL ,
    [from_date] TIMESTAMP  NOT NULL ,
    [to_date] TIMESTAMP  NOT NULL ,
    CONSTRAINT [PK_Dept_emp] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Dept_manager] (
    [dept_no] INTEGER  NOT NULL ,
    [emp_no] INTEGER  NOT NULL ,
    [from_date] TIMESTAMP  NOT NULL ,
    [to_date] TIMESTAMP  NOT NULL ,
    CONSTRAINT [PK_Dept_manager] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Dept_name] (
    [emp_no] INTEGER  NOT NULL ,
    [dept_no] INTEGER  NOT NULL ,
    [from_date] TIMESTAMP  NOT NULL ,
    [to_date] TIMESTAMP  NOT NULL ,
    CONSTRAINT [PK_Dept_name] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [employees] (
    [emp_no] INTEGER  NOT NULL ,
    [birth_date] DATE  NOT NULL ,
    [first_name] VARCHAR  NOT NULL ,
    [last_name] VARCHAR  NOT NULL ,
    [gender] VARCHAR  NOT NULL ,
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [salaries] (
    [emp_no] INTEGER  NOT NULL ,
    [salary] INTEGER  NOT NULL ,
    [from_date] TIMESTAMP  NOT NULL ,
    [to_date] TIMESTAMP  NOT NULL ,
    CONSTRAINT [PK_salaries] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [titles] (
    [emp_no] INTEGER  NOT NULL ,
    [title] VARCHAR  NOT NULL ,
    [from_date] TIMESTAMP  NOT NULL ,
    [to_date] TIMESTAMP  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

ALTER TABLE [Departments] WITH CHECK ADD CONSTRAINT [FK_Departments_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Dept_emp] ([dept_no])

ALTER TABLE [Departments] CHECK CONSTRAINT [FK_Departments_dept_no]

ALTER TABLE [Dept_emp] WITH CHECK ADD CONSTRAINT [FK_Dept_emp_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Dept_manager] ([emp_no])

ALTER TABLE [Dept_emp] CHECK CONSTRAINT [FK_Dept_emp_emp_no]

ALTER TABLE [Dept_manager] WITH CHECK ADD CONSTRAINT [FK_Dept_manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Dept_emp] ([dept_no])

ALTER TABLE [Dept_manager] CHECK CONSTRAINT [FK_Dept_manager_dept_no]

ALTER TABLE [Dept_name] WITH CHECK ADD CONSTRAINT [FK_Dept_name_emp_no] FOREIGN KEY([emp_no])
REFERENCES [titles] ([emp_no])

ALTER TABLE [Dept_name] CHECK CONSTRAINT [FK_Dept_name_emp_no]

ALTER TABLE [Dept_name] WITH CHECK ADD CONSTRAINT [FK_Dept_name_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Dept_manager] ([dept_no])

ALTER TABLE [Dept_name] CHECK CONSTRAINT [FK_Dept_name_dept_no]

ALTER TABLE [employees] WITH CHECK ADD CONSTRAINT [FK_employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [salaries] ([emp_no])

ALTER TABLE [employees] CHECK CONSTRAINT [FK_employees_emp_no]

ALTER TABLE [titles] WITH CHECK ADD CONSTRAINT [FK_titles_emp_no] FOREIGN KEY([emp_no])
REFERENCES [salaries] ([emp_no])

ALTER TABLE [titles] CHECK CONSTRAINT [FK_titles_emp_no]

COMMIT TRANSACTION QUICKDBD