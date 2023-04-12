
--
DROP DATABASE IF EXISTS craigslist_database;
CREATE DATABASE craigslist_database;
--
\c craigslist_database
--
CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    region_name VARCHAR NOT NULL
);
CREATE TABLE user_data (
    id SERIAL PRIMARY KEY,
    username VARCHAR NOT NULL,
    region_id INTEGER REFERENCES region NOT NULL
);
CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR NOT NULL
);
CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title VARCHAR NOT NULL,
    post_description TEXT,
    post_location TEXT,
    userid INTEGER REFERENCES user_data NOT NULL,
    region_id INTEGER REFERENCES region NOT NULL,
    category_id INTEGER REFERENCES category NOT NULL
);


--
