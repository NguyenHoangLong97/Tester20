create database manager;

use manager;

create table Department (
	DepartmentID int primary key auto_increment,
    DepartmentName varchar (100)
);

create table Position (
	PositionID int primary key auto_increment, 
    PositionName enum ('Dev', 'Test', 'Scrum Master', 'PM')
);
create table Accountt (
	AccountID int primary key auto_increment,
    Email varchar (50),
    Username varchar (100) not null,
    FullName varchar (100) not null,
    DepartmentID int,
    PositionID int,
    CreateDate date, 
    FOREIGN KEY (PositionID) REFERENCES Position (PositionID),
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID)
);
create table Groupp (
	GroupID int primary key auto_increment,
    GroupName varchar (50), 
    CreatorID int not null, 
    CreateDate date,
    FOREIGN KEY (CreatorID) REFERENCES Accountt (AccountID)
);
create table GroupAccount (
	GroupID int not null, 
    AccountID int not null,
    JoinDate date,
    FOREIGN KEY (GroupID) REFERENCES Groupp (GroupID), 
    FOREIGN KEY (AccountID) REFERENCES Accountt (AccountID)
);
create table TypeQuestion (
	TypeID int primary key auto_increment,
    TypeName enum ('Essay', 'Multiple-Choice')
);
create table CategoryQuestion (
	CategoryID int primary key auto_increment,
    CategoryName varchar (50)
);
create table Question (
	QuestionID int primary key auto_increment,
    Content varchar (100), 
    CategoryID int not null, 
    TypeID int not null,
    CreatorID int not null,
    CreateDate date,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID), 
    FOREIGN KEY (CreatorID) REFERENCES Accountt (AccountID)
);
create table Answer (
	AnswerID int primary key auto_increment,
    Content varchar (100), 
    QuestionID int not null,
    isCorrect enum ('Yes', 'No'),
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID)
);
create table Exam (
	ExamID int primary key auto_increment,
    Codes int not null, 
    Title varchar (50), 
    CategoryID int not null, 
    Duration varchar (10), 
    CreatorID int not null,
    CreateDate date,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID), 
    FOREIGN KEY (CreatorID) REFERENCES Accountt (AccountID)
);
create table ExamQuestion (
	ExamID int not null, 
    QuestionID int not null, 
    FOREIGN KEY (QuestionID) REFERENCES Question (QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam (ExamID)
);


