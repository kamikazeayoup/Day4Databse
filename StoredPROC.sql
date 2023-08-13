USE CompanyDB;
GO
CREATE PROCEDURE GetEmployeeByDepartment 
@DepID INT 
AS
BEGIN 
	SELECT * 
	FROM Employees 
	Where DepartmentID = @DepID
	END;

GO 
EXEC GetEmployeeByDepartment 
@DepID = 1; 
GO 
CREATE PROCEDURE UpdateEmployeeSalary
@EmpID INT , 
@NewSalary decimal(10, 5)
AS 
	BEGIN
	UPDATE Employees
	SET Salary = @NewSalary
	Where EmployeeID = @EmpID
	END;
GO 
EXEC UpdateEmployeeSalary 
@EmpID = 1  , 
@NewSalary = 25000
GO 
SELECT * 
FROM Employees
Where EmployeeID = 1; 
GO
CREATE PROCEDURE SearchKeyWord
@KeyWORD varchar(10)
AS
BEGIN 
SELECT e.*
FROM Employees e JOIN Departments d 
ON d.DepartmentID = e.DepartmentID
WHERE e.FirstName LIKE '%' + @KeyWORD + '%' 
OR e.LastName LIKE '%' + @KeyWORD + '%' 
OR d.DepartmentName LIKE '%' + @KeyWORD + '%' 
END;

GO 
EXEC SearchKeyWord 
@KeyWORD = 'ayoup' 