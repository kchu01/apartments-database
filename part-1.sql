-- 1. create a database called apartments

CREATE DATABASE apartments;

-- 2. connect to that database

\c apartments

-- 3. create the owners table

CREATE TABLE owners (
id SERIAL PRIMARY KEY,   
name TEXT,          
age int);


-- 4. create the properties table

CREATE TABLE properties (
id SERIAL PRIMARY KEY,
name TEXT,
units int);
