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
