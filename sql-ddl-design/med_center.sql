
--
DROP DATABASE IF EXISTS med_center_database;
CREATE DATABASE med_center_database;
--
\c med_center_database
--
CREATE TABLE location_data (
    id SERIAL PRIMARY KEY,
    location_name TEXT,
    location_address TEXT
);
CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL
);
CREATE TABLE med_center (
    id SERIAL PRIMARY KEY,
    loc_id INTEGER REFERENCES location_data(id) NOT NULL,
    doc_id INTEGER REFERENCES doctor(id) NOT NULL
);
CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR
);
CREATE TABLE visit (
    id SERIAL PRIMARY KEY,
    pat_id INTEGER REFERENCES patient(id) NOT NULL,
    doc_id INTEGER REFERENCES doctor(id) NOT NULL,
    visit_date TIMESTAMP NOT NULL
);
CREATE TABLE illness (
    id SERIAL PRIMARY KEY,
    illness_name VARCHAR NOT NULL,
    condition_desc TEXT
);
CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    pat_id INTEGER REFERENCES patient(id) NOT NULL,
    illness_id INTEGER REFERENCES illness(id) NOT NULL,
    visit_id INTEGER REFERENCES visit(id)
);
INSERT INTO location_data (location_name, location_address)
VALUES ('Blue Clinic', '3456 Wallaby Way');
--
INSERT INTO doctor (first_name, last_name)
VALUES ('Doctor', 'Bees'),
    ('Martha', 'Marf'),
    ('Beef', 'Wellington');
--
INSERT INTO patient (first_name, last_name)
VALUES ('Bob', 'Obo'),
    ('Mop', 'Swiffert'),
    ('Baracle', 'Cat');