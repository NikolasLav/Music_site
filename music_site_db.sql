CREATE DATABASE music_site_db
	WITH
	OWNER = postgres
	ENCODING = 'UTF8'
	CONNECTION LIMIT = -1
	IS_TEMPLATE = False;

CREATE TABLE IF NOT EXISTS Genres (
	id integer SERIAL PRIMARY KEY,
	genre_name varchar(60) UNIQUE NOT NULL
);

insert into Genres (genre_name)
values ('Rock2');

CREATE TABLE IF NOT EXISTS Artists (
	id integer SERIAL PRIMARY KEY,
	artist_name varchar(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist_genres (
	genre_id integer REFERENCES Genres (id),
	artist_id integer REFERENCES Artists (id)
);

CREATE TABLE IF NOT EXISTS Albums (
	id integer SERIAL PRIMARY KEY,
	album_name varchar(255) NOT NULL,
	album_year integer NOT NULL
		CHECK (album_year BETWEEN 0 AND 9999)
	);

CREATE TABLE IF NOT EXISTS Album_of_artist (
	artist_id integer REFERENCES Artists (id),
	album_id integer REFERENCES Albums (id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id integer SERIAL PRIMARY KEY,
	track_name varchar(255) NOT NULL,
	track_length time NOT NULL,
	album_id integer REFERENCES Albums (id)
);

CREATE TABLE IF NOT EXISTS Collections (
	id integer SERIAL PRIMARY KEY,
	collection_name varchar(255) NOT NULL,
	collection_year integer NOT NULL
		CHECK (collection_year BETWEEN 0 AND 9999)
);

CREATE TABLE IF NOT EXISTS Collection (
	track_id integer REFERENCES Tracks (id),
	collection_id integer REFERENCES Collections (id)
);