vet_clinic=# CREATE TABLE animals( 
  id  INT, 
  name  VARCHAR(250),
  date_of_birth  DATE, 
  escape_attempts  INT,
  neutered  BOOLEAN ,
  weight_kg  DECIMAL);
  

  ALTER TABLE animals ADD species VARCHAR(255);
  
  /-----------/
CREATE TABLE owners (id SERIAL, full_name VARCHAR(30), age INT, PRIMARY KEY(id));
CREATE TABLE species(id SERIAL, name VARCHAR(30),PRIMARY KEY(id));
ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species (id);
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners (id);
/-------------/
CREATE TABLE vets(id SERIAL PRIMARY KEY ,name VARCHAR(50) ,age INT, date_of_graduation DATE);
CREATE TABLE specializations( vet_id INT, 
                             species_id INT,
                             PRIMARY KEY(vet_id,species_id),
                             CONSTRAINT fk_vet FOREIGN KEY(vet_id) REFERENCES vets(id), 
                             CONSTRAINT  fk_species FOREIGN KEY(species_id) REFERENCES species(id));
CREATE TABLE visits( vet_id INT ,
                    animal_id INT ,
                    date_of_visit DATE,
                    PRIMARY KEY(vet_id,animal_id),
                    CONSTRAINT fk_vet FOREIGN KEY(vet_id) REFERENCES vets(id), 
                    CONSTRAINT  fk_animals FOREIGN KEY(animal_id) REFERENCES animals(id));
