CREATE TABLE dbo.Person
(
    PersonID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    FirstName nvarchar(50) NOT NULL,
    LastName nvarchar(50) NOT NULL
);

INSERT INTO dbo.Person (FirstName, LastName)
VALUES ('John', 'Doe'), ('Jane', 'Smith');
