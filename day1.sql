create database tester20;

use tester20;

create table customers (
	customer_name varchar (100),
    phone varchar (11),
    age int,
    address varchar (500)
);

create table Trainee (
	TraineeID int primary key auto_increment,
    Full_name varchar (100),
    Birth_date date,
    Gender enum ('male', 'female', 'unknown'),
    EtIQ int,
    EtGmath int,
    Etnglish int,
    Trainingclass varchar (100),
    EvaluationNotes varchar (100),
    constraint CHECK_EtIQ CHECK (EtIQ > 0 AND EtIQ < 20)
);


