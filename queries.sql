
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE  date_of_birth BETWEEN CAST('2016-01-01' AS DATE) AND CAST('2019-01-01' AS DATE);
SELECT * FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR  name = 'Picachu';
SELECT name , escape_attempts FROM animals WHERE weight_kg > '10.5';
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN '10.4' AND '17.3';


/------------------/
BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK TRANSACTION;
SELECT * FROM animals;
---------
BEGIN TRANSACTION;
UPDATE animals SET species = 'Digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'Pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT TRANSACTION;
SELECT * FROM animals;
BEGIN TRANSACTION;
DELETE FROM  animals;
SELECT * FROM animals;
ROLLBACK TRANSACTION;
SELECT * FROM animals;
COMMIT TRANSACTION; 

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT firstsv;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT firstsv;
SELECT * FROM animals;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT TRANSACTION;
/------------/
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = '0';
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, avg(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

/--------------/
SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.id = '4';
SELECT * FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT * FROM owners JOIN animals ON animals.owner_id = owners.id;
SELECT species.name, COUNT(species_id) FROM species JOIN animals ON animals.species_id = species.id GROUP BY species.name

SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell'
AND species.name = 'Digimon';
SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = '0';
SELECT full_name, COUNT (full_name) AS number_of_animals from owners JOIN animals ON animals.owner_id = owners.id 
GROUP BY owners.full_name ORDER BY number_of_animals DESC LIMIT 1;

 




