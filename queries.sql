
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE  date_of_birth BETWEEN CAST('2016-01-01' AS DATE) AND CAST('2019-01-01' AS DATE);
SELECT * FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR  name = 'Picachu';
SELECT name , escape_attempts FROM animals WHERE weight_kg > '10.5';
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN '10.4' AND '17.3';
