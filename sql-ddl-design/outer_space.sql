-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE sun
(
  id SERIAL PRIMARY KEY,
  sun_name TEXT NOT NULL
  
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
  
);

CREATE TABLE planet
(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_period INTEGER NOT NULL
);

CREATE TABLE moon
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  orbital_period INTEGER NOT NULL
);

CREATE TABLE planet_sattelites
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planet NOT NULL,
  moon_id INTEGER REFERENCES moon NOT NULL
);

CREATE TABLE galaxy_suns
(
  id SERIAL PRIMARY KEY,
  galaxy_id INTEGER REFERENCES galaxy NOT NULL,
  sun_id INTEGER REFERENCES sun NOT NULL
);

CREATE TABLE sun_planets
(
  id SERIAL PRIMARY KEY,
  planet INTEGER REFERENCES planet NOT NULL,
  sun_id INTEGER REFERENCES sun NOT NULL
);