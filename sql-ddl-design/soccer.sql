
--
DROP DATABASE IF EXISTS soccer_database;
CREATE DATABASE soccer_database;
--
\c soccer_database
--
CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    season_start VARCHAR NOT NULL,
    season_end VARCHAR NOT NULL
);
CREATE TABLE referee (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL
);
CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR NOT NULL,
    region VARCHAR NOT NULL,
    coach VARCHAR NOT NULL
);
CREATE TABLE match (
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES team NOT NULL,
    team2_id INTEGER REFERENCES team NOT NULL,
    season_id INTEGER REFERENCES season NOT NULL,
    match_date VARCHAR NOT NULL
);
CREATE TABLE player (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    team_id INTEGER REFERENCES team NOT NULL
);
CREATE TABLE goal (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES match NOT NULL,
    team_id INTEGER REFERENCES team NOT NULL,
    player_id INTEGER REFERENCES player NOT NULL
);

CREATE TABLE ref_history (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES match NOT NULL,
    ref_id INTEGER REFERENCES referee NOT NULL
);



--
