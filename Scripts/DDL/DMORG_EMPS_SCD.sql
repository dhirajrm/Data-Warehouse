CREATE TABLE DMORG_EMPS_SCD (
    EmployeeID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    JobTitle NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(18, 2),
    HireDate DATE,
    BirthDate DATE,
    Address NVARCHAR(100),
    City NVARCHAR(50),
    State NVARCHAR(50),
    ZipCode NVARCHAR(10),
    Country NVARCHAR(50),
    PhoneNumber NVARCHAR(20),
    Email NVARCHAR(50),
    ManagerID INT,
    Status NVARCHAR(20),
    Gender NVARCHAR(10),
    MaritalStatus NVARCHAR(20),
    Nationality NVARCHAR(50),
    Education NVARCHAR(50),
    Experience INT,
    STRT_DT DATE,
    END_DT DATE
);