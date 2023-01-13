    -- количество исполнителей в каждом жанре;
SELECT genre_name, count(*) FROM artist_genres ag
JOIN genres g ON g.id = ag.genre_id 
GROUP BY genre_name  
ORDER BY genre_name
;

    -- количество треков, вошедших в альбомы 2019-2020 годов;
SELECT count(*) FROM tracks t 
JOIN albums a ON a.id = t.album_id 
WHERE a.album_year BETWEEN 2019 AND 2020
;

    -- средняя продолжительность треков по каждому альбому;
SELECT album_name, avg(track_length) AS average_track_length FROM albums a
JOIN tracks t ON t.album_id = a.id 
GROUP BY album_name 
ORDER BY album_name 
;

    -- все исполнители, которые не выпустили альбомы в 2020 году;
    -- по условию от преподавателя
SELECT DISTINCT artist_name FROM artists art
JOIN album_of_artist aoa  ON art.id = aoa.artist_id 
JOIN albums alb  ON alb.id = aoa.album_id
WHERE alb.id NOT IN (
    SELECT id FROM albums a  
    WHERE album_year = 2020
);

	-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
SELECT collection_name FROM artists a
JOIN album_of_artist aoa ON aoa.artist_id = a.id
JOIN tracks t ON t.album_id = aoa.album_id 
JOIN collection c ON c.track_id = t.id 
JOIN collections c2 ON c2.id = c.collection_id 
WHERE artist_name = 'Scooter'
;

    -- название альбомов, в которых присутствуют исполнители более 1 жанра;
SELECT album_name FROM albums a 
JOIN album_of_artist aoa ON aoa.album_id = a.id 
WHERE aoa.artist_id IN (
	SELECT artist_id FROM artist_genres ag
	GROUP BY artist_id
	HAVING count(genre_id) > 1
	)
;

    -- наименование треков, которые не входят в сборники;
/* ну тут просто! исключаем нулевые пересечения: */
SELECT track_name FROM tracks t 
LEFT JOIN collection c ON t.id = c.track_id 
WHERE c.track_id IS NULL
;

    -- исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
SELECT artist_name FROM artists a 
JOIN album_of_artist aoa ON a.id = aoa.artist_id 
JOIN tracks t ON aoa.album_id = t.album_id 
WHERE track_length = (
	SELECT min(track_length) FROM tracks)
;

    -- название альбомов, содержащих наименьшее количество треков.
SELECT album_name FROM albums a
JOIN tracks t ON t.album_id = a.id 
GROUP BY album_name 
HAVING count(*) = (
	SELECT count(*) FROM tracks t
	GROUP BY album_id 
	ORDER BY count(*) 
	LIMIT 1)
;