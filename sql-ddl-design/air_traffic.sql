-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE port
(
  id SERIAL PRIMARY KEY,
  port_city TEXT NOT NULL,
  port_country TEXT NOT NULL
);

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_port_id INTEGER REFERENCES port NOT NULL,
  to_port_id INTEGER REFERENCES port NOT NULL,
  
);

CREATE TABLE passenger
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight_id INTEGER REFERENCES flight NOT NULL,
  
);
