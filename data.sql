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


