DROP DATABASE IF EXISTS student_management;
CREATE DATABASE student_management;

USE student_management;

CREATE TABLE student (
    `ID` INT PRIMARY KEY,
    `Name` VARCHAR(45),
    `Age` INT,
    `Country` VARCHAR(45)
);
    
CREATE TABLE class (
    `ID` INT PRIMARY KEY,
    `Name` VARCHAR(45)
);

CREATE TABLE teacher (
    `ID` INT PRIMARY KEY,
    `Name` VARCHAR(45),
    `Age` INT,
    `Country` VARCHAR(45)
);

INSERT INTO student(id, name, age, country)
VALUES (001,"Lê Anh Đạt",28,"Việt Nam");