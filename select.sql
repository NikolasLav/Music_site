-- название и год выхода альбомов, вышедших в 2018 году
select album_name, album_year from albums
	where album_year = 2018;

-- название и продолжительность самого длительного трека
select track_name, track_length from tracks
	order by track_length desc
	limit 1;

-- название треков, продолжительность которых не менее 3,5 минуты;
select track_name, track_length from tracks
	where track_length >= '0:03:30'; 
	
-- названия сборников, вышедших в период с 2018 по 2020 год включительно;
select collection_name from collections
	where collection_year between 2018 and 2020;
	
-- исполнители, чье имя состоит из 1 слова
	-- вариант №1
select artist_name from artists
	where artist_name not like '% %' /*между словами есть пробелы, значит нам нужны значения, где пробелов нет*/

	-- вариант №2 (более универсальный)
select artist_name from artists
where length(artist_name)-length(replace(artist_name,' ','')) + 1 = 1;
	
-- название треков, которые содержат слово “мой”/“my”
select track_name from tracks
	where lower(track_name) like lower('%my%') or lower(track_name) like lower('%мой%');