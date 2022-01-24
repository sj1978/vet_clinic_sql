
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
/--------------------------------/
/*last animal seen by William Tatcher*/
SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'William Tatcher') ORDER BY visits.date_of_visit DESC LIMIT 1;
/*How many different animals did Stephanie Mendez see?*/
SELECT COUNT(DISTINCT  animals.name) FROM animals JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');
/*List all vets and their specialties, including vets with no specialties.*/
SELECT vets.name, specializations.species_id FROM vets left JOIN specializations ON vets.id = specializations.vet_id JOIN species ON specializations.species_id = species.id ORDER BY vets.name;
/*List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.*/
SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id WHERE visits.vet_id = 
(SELECT id FROM vets WHERE name = 'Stephanie Mendez') AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
/*What animal has the most visits to vets?*/
SELECT animals.name, COUNT(*) FROM animals LEFT JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT DESC LIMIT 1;
/*Who was Maisy Smith's first visit?*/
SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id WHERE vet_id = '2' ORDER BY visits.date_of_visit  ASC LIMIT 1;
/*
Details for most recent visit: animal information, vet information, and date of visit.*/
SELECT animals.*, vets.*, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON visits.vet_id = vets.id ORDER BY visits.date_of_visit DESC LIMIT 1;
/*How many visits were with a vet that did not specialize in that animal's species?*/
SELECT COUNT(*) FROM visits JOIN vets ON vets.id = visits.vet_id JOIN animals ON animals.id = visits.animal_id JOIN specializations ON specializations.vet_id = vets.id 
WHERE specializations.species_id <> animals.species_id;
/*What specialty should Maisy Smith consider getting? Look for the species she gets the most.*/
SELECT species.name, COUNT(visits.animal_id) FROM visits JOIN vets ON vets.id = visits.vet_id 
JOIN animals ON animals.id = visits.animal_id JOIN species ON species.id = animals.species_id 
WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY COUNT DESC LIMIT 1;

-- perfomance and optimazitaion
explain analyze select distinct(count(*)) from visits where animal_id = 4;

explain analyze select distinct * from visits where vet_id = 2