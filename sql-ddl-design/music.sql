-- from the terminal run:
-- psql < music.sql
DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
\c music 
CREATE TABLE artist (
  id SERIAL PRIMARY KEY,
  artist_name VARCHAR NOT NULL
);
CREATE TABLE producer (
  id SERIAL PRIMARY KEY,
  producer_name VARCHAR NOT NULL
);

CREATE TABLE album (
  id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  release_date VARCHAR NOT NULL,
  artist_id INTEGER REFERENCES artist NOT NULL,
  producer_id INTEGER REFERENCES producer NOT NULL
);

CREATE TABLE song (
  id SERIAL PRIMARY KEY,
  song_name VARCHAR NOT NULL,
  duration INTEGER NOT NULL,
  album_id INTEGER REFERENCES album NOT NULL
);

CREATE TABLE artist_songs (
  id SERIAL PRIMARY KEY,
  artist_id INTEGER REFERENCES artist NOT NULL,
  song_id INTEGER REFERENCES song NOT NULL
);

CREATE TABLE producer_songs (
  id SERIAL PRIMARY KEY,
  producer_id INTEGER REFERENCES artist NOT NULL,
  song_id INTEGER REFERENCES song NOT NULL
);