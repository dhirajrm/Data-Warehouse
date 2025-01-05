--SAMPLE DATA

INSERT INTO DMORG_EMPS_STG (EmployeeID, FirstName, LastName, JobTitle, Department, Salary, HireDate, BirthDate, Address, City, State, ZipCode, Country, PhoneNumber, Email, ManagerID, Status, Gender, MaritalStatus, Nationality, Education, Experience)
VALUES 
(1, 'John', 'Doe', 'Software Engineer', 'IT', 70000, '2020-01-15', '1990-05-20', '123 Main St', 'CityA', 'StateA', '12345', 'CountryA', '123-456-7890', 'john.doe@example.com', 101, 'Active', 'Male', 'Single', 'CountryA', 'Bachelors', 5),
(2, 'Jane', 'Smith', 'Senior Data Analyst', 'IT', 67000, '2019-03-10', '1988-07-15', '456 Elm St', 'CityB', 'StateB', '67890', 'CountryB', '234-567-8901', 'jane.smith@example.com', 102, 'Active', 'Female', 'Married', 'CountryB', 'Masters', 7),
(3, 'Alice', 'Johnson', 'Project Manager', 'IT', 75000, '2018-06-25', '1985-09-10', '789 Pine St', 'CityC', 'StateC', '11223', 'CountryC', '345-678-9012', 'alice.johnson@example.com', 103, 'Active', 'Female', 'Married', 'CountryC', 'MBA', 10),
(4, 'Bob', 'Brown', 'QA Lead', 'IT', 650000, '2021-11-05', '1992-11-25', '321 Oak St', 'CityD', 'StateD', '44556', 'CountryD', '456-789-0123', 'bob.brown@example.com', 104, 'Active', 'Male', 'Single', 'CountryD', 'Bachelors', 3);


INSERT INTO DMORG_EMPS_SCD (EmployeeID, FirstName, LastName, JobTitle, Department, Salary, HireDate, BirthDate, Address, City, State, ZipCode, Country, PhoneNumber, Email, ManagerID, Status, Gender, MaritalStatus, Nationality, Education, Experience, STRT_DT, END_DT)
VALUES 
(1, 'John', 'Doe', 'Software Engineer', 'IT', 60000, '2020-01-15', '1990-05-20', '123 Main St', 'CityA', 'StateA', '12345', 'CountryA', '123-456-7890', 'john.doe@example.com', 101, 'Active', 'Male', 'Single', 'CountryA', 'Bachelors', 5, '2020-01-15', '9999-12-31'),
(2, 'Jane', 'Smith', 'Data Analyst', 'IT', 55000, '2019-03-10', '1988-07-15', '456 Elm St', 'CityB', 'StateB', '67890', 'CountryB', '234-567-8901', 'jane.smith@example.com', 102, 'Active', 'Female', 'Married', 'CountryB', 'Masters', 7, '2019-03-10', '9999-12-31'),
(3, 'Alice', 'Johnson', 'Project Manager', 'IT', 75000, '2018-06-25', '1985-09-10', '789 Pine St', 'CityC', 'StateC', '11223', 'CountryC', '345-678-9012', 'alice.johnson@example.com', 103, 'Active', 'Female', 'Married', 'CountryC', 'MBA', 10, '2018-06-25', '9999-12-31'),
(4, 'Bob', 'Brown', 'QA Engineer', 'IT', 50000, '2021-11-05', '1992-11-25', '321 Oak St', 'CityD', 'StateD', '44556', 'CountryD', '456-789-0123', 'bob.brown@example.com', 104, 'Active', 'Male', 'Single', 'CountryD', 'Bachelors', 3, '2021-11-05', '9999-12-31');


INSERT INTO DMORG_EMPS_STG (EmployeeID, FirstName, LastName, JobTitle, Department, Salary, HireDate, BirthDate, Address, City, State, ZipCode, Country, PhoneNumber, Email, ManagerID, Status, Gender, MaritalStatus, Nationality, Education, Experience)
VALUES 
(5, 'Charlie', 'Davis', 'Business Analyst', 'Business', 65000, '2017-04-12', '1987-02-14', '654 Maple St', 'CityE', 'StateE', '77889', 'CountryE', '567-890-1234', 'charlie.davis@example.com', 105, 'Active', 'Male', 'Married', 'CountryE', 'Bachelors', 8),
(6, 'Diana', 'Miller', 'HR Manager', 'HR', 70000, '2016-08-19', '1983-12-05', '987 Birch St', 'CityF', 'StateF', '99001', 'CountryF', '678-901-2345', 'diana.miller@example.com', 106, 'Active', 'Female', 'Married', 'CountryF', 'Masters', 12),
(7, 'Evan', 'Wilson', 'Marketing Specialist', 'Marketing', 58000, '2019-02-22', '1991-03-18', '321 Cedar St', 'CityG', 'StateG', '22334', 'CountryG', '789-012-3456', 'evan.wilson@example.com', 107, 'Active', 'Male', 'Single', 'CountryG', 'Bachelors', 4),
(8, 'Fiona', 'Taylor', 'Sales Manager', 'Sales', 72000, '2015-11-30', '1986-06-25', '543 Spruce St', 'CityH', 'StateH', '55667', 'CountryH', '890-123-4567', 'fiona.taylor@example.com', 108, 'Active', 'Female', 'Married', 'CountryH', 'MBA', 9),
(9, 'George', 'Anderson', 'Finance Analyst', 'Finance', 68000, '2018-07-14', '1989-08-22', '876 Willow St', 'CityI', 'StateI', '88990', 'CountryI', '901-234-5678', 'george.anderson@example.com', 109, 'Active', 'Male', 'Single', 'CountryI', 'Bachelors', 6),
(10, 'Hannah', 'Thomas', 'Operations Manager', 'Operations', 75000, '2014-05-18', '1984-10-30', '210 Redwood St', 'CityJ', 'StateJ', '11212', 'CountryJ', '012-345-6789', 'hannah.thomas@example.com', 110, 'Active', 'Female', 'Married', 'CountryJ', 'Masters', 11),
(11, 'Ian', 'Moore', 'IT Support', 'IT', 52000, '2020-09-10', '1993-04-12', '432 Aspen St', 'CityK', 'StateK', '33445', 'CountryK', '123-456-7890', 'ian.moore@example.com', 111, 'Active', 'Male', 'Single', 'CountryK', 'Bachelors', 2),
(12, 'Julia', 'Martin', 'Product Manager', 'Product', 80000, '2013-03-25', '1982-11-15', '654 Oak St', 'CityL', 'StateL', '66778', 'CountryL', '234-567-8901', 'julia.martin@example.com', 112, 'Active', 'Female', 'Married', 'CountryL', 'MBA', 13),
(13, 'Kevin', 'Jackson', 'DevOps Engineer', 'IT', 69000, '2019-12-01', '1990-01-20', '876 Pine St', 'CityM', 'StateM', '99012', 'CountryM', '345-678-9012', 'kevin.jackson@example.com', 113, 'Active', 'Male', 'Single', 'CountryM', 'Bachelors', 5),
(14, 'Laura', 'White', 'UX Designer', 'Design', 63000, '2018-10-05', '1987-09-25', '210 Birch St', 'CityN', 'StateN', '22345', 'CountryN', '456-789-0123', 'laura.white@example.com', 114, 'Active', 'Female', 'Married', 'CountryN', 'Bachelors', 7),
(15, 'Michael', 'Harris', 'Network Engineer', 'IT', 71000, '2017-06-15', '1985-05-10', '432 Maple St', 'CityO', 'StateO', '55678', 'CountryO', '567-890-1234', 'michael.harris@example.com', 115, 'Active', 'Male', 'Married', 'CountryO', 'Bachelors', 9),
(16, 'Nina', 'Clark', 'Content Writer', 'Marketing', 54000, '2021-01-20', '1992-02-28', '654 Cedar St', 'CityP', 'StateP', '88901', 'CountryP', '678-901-2345', 'nina.clark@example.com', 116, 'Active', 'Female', 'Single', 'CountryP', 'Bachelors', 3),
(17, 'Oscar', 'Lewis', 'Graphic Designer', 'Design', 60000, '2016-04-18', '1988-07-05', '876 Spruce St', 'CityQ', 'StateQ', '11223', 'CountryQ', '789-012-3456', 'oscar.lewis@example.com', 117, 'Active', 'Male', 'Single', 'CountryQ', 'Bachelors', 8),
(18, 'Paula', 'Walker', 'Customer Support', 'Support', 50000, '2020-08-25', '1991-09-15', '210 Willow St', 'CityR', 'StateR', '33456', 'CountryR', '890-123-4567', 'paula.walker@example.com', 118, 'Active', 'Female', 'Single', 'CountryR', 'Bachelors', 2),
(19, 'Quincy', 'Hall', 'Sales Representative', 'Sales', 58000, '2019-05-30', '1989-10-20', '432 Redwood St', 'CityS', 'StateS', '66789', 'CountryS', '901-234-5678', 'quincy.hall@example.com', 119, 'Active', 'Male', 'Single', 'CountryS', 'Bachelors', 4),
(20, 'Rachel', 'Young', 'HR Specialist', 'HR', 62000, '2018-02-14', '1986-11-25', '654 Aspen St', 'CityT', 'StateT', '99023', 'CountryT', '012-345-6789', 'rachel.young@example.com', 120, 'Active', 'Female', 'Married', 'CountryT', 'Bachelors', 6);

