-- название и год выхода альбомов, вышедших в 2018 году
select album_name, album_year from albums
	where album_year = 2018;

-- название и продолжительность самого длительного трека
	-- вариант №1
select track_name, track_length from tracks
	order by track_length desc
	limit 1;

	-- вариант №2
select track_name, track_length from tracks
	WHERE track_length = (SELECT max(track_length) FROM tracks);

-- название треков, продолжительность которых не менее 3,5 минуты;
select track_name, track_length from tracks
	where track_length >= '0:03:30'; 
	
-- названия сборников, вышедших в период с 2018 по 2020 год включительно;
select collection_name from collections
	where collection_year between 2018 and 2020;
	
-- исполнители, чье имя состоит из 1 слова
	-- вариант №1
select artist_name from artists
	where artist_name not like '% %'; /*между словами есть пробелы, значит нам нужны значения, где пробелов нет*/

	-- вариант №2 (более универсальный, потому что после равно можно поставить любое другое количество искомых слов, что нельзя сделать с примером выше)
select artist_name from artists
where length(artist_name)-length(replace(artist_name,' ','')) + 1 = 1;

	-- вариант №3 (ещё лучше, на основе подсказанной string_to_array - спасибо, не знал о такой! xD)
select artist_name from artists
	where array_length(string_to_array(artist_name, ' '), 1) = 1;
	
-- название треков, которые содержат слово “мой”/“my”
select track_name from tracks
	WHERE string_to_array(lower(track_name), ' ') && ARRAY['my', 'мой'];