INSERT INTO animals(
	name,
	date_of_birth,
	escape_attempts,
	neutered,
	weight_kg
)

VALUES('Agumon', DATE '2020-02-03', '0', 'true', '10.23');
VALUES('Gabumon', DATE '2018-11-15', '2', 'true', '8.00');
VALUES('Pikachu', DATE '2021-01-07', '1', 'false', '15.00');
VALUES('Devimon', DATE '2017-05-12', '5', 'true', '11.00');

/--------------------------/
INSERT INTO animals(name, date_of_birth, escape_attempts,neutered,weight_kg) 
VALUES('Charmander', DATE '2020-02-08','0','false','-11.00');
VALUES('Plantmon', DATE '2022-11-15','2','true','-5.7');
VALUES('Squirtle', DATE '1993-04-02','3','false','-12.13');
VALUES('Angemon', DATE '2005-06-12','1','true','-45.00');
VALUES('Boarmon', DATE '2005-06-07','7','true','20.4');
VALUES('Blossom', DATE '1998-11-13','3','true','17.00');

/-------------------------/

INSERT INTO owners(full_name, age) VALUES('Sam Smith', '34');
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', '19');
INSERT INTO owners(full_name, age) VALUES('Bob', '45');
INSERT INTO owners(full_name, age) VALUES('Melody Pond', '77');
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', '14');
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', '38');

INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';
UPDATE animals SET owner_id = 1  WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2  WHERE name = 'Picachu';
UPDATE animals SET owner_id = 2  WHERE name = 'Gabumon';
UPDATE animals SET owner_id = 3  WHERE name = 'Devimon';
UPDATE animals SET owner_id = 3  WHERE name = 'Plantmon';
UPDATE animals SET owner_id = 4  WHERE name = 'Charmander' OR name = 'Squirtle' OR  name =  'Blossom';
UPDATE animals SET owner_id = 5  WHERE name = 'Angemon' OR name = 'Boarmon';

/--------------------------------------------/

INSERT INTO vets (name,age,date_of_graduation) VALUES('Willian Thatcher','45','2000-04-23');
INSERT INTO vets (name,age,date_of_graduation) VALUES('Maisy Smith','26','2019-01-17');
INSERT INTO vets (name,age,date_of_graduation) VALUES('Stephanie Mendez','64','1981-05-04');
INSERT INTO vets (name,age,date_of_graduation) VALUES('Jack Harkness','38','2008-06-08');
INSERT INTO specializations (vet_id,species_id)VALUES('1','1');
INSERT INTO specializations (vet_id,species_id)VALUES('3','1');
INSERT INTO specializations (vet_id,species_id)VALUES('3','2');
INSERT INTO specializations (vet_id,species_id)VALUES('4','2');

INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('1','4','2020-05-24');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('3','4','2020-07-22');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('4','5','2021-02-02');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('2','8','2020-01-05');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('2','8','2020-03-08');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('2','8','2020-05-14');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('3','6','2021-05-04');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('4','2','2021-02-24');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('2','10','2019-12-21');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('1','10','2020-08-10');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('2','10','2021-04-07');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('3','3','2019-10-29');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('4','1','2020-10-03');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('4','1','2020-11-04');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('2','7','2019-01-24');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('2','7','2019-05-15');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('2','7','2020-02-27');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('2','7','2020-08-03');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('3','9','2020-05-24');
INSERT INTO visits (vet_id,animal_id,date_of_visit)VALUES('1','9','2021-01-11');


/-------------------------------------------------/



INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

INSERT INTO owners (full_name, email) SELECT 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

