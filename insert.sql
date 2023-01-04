insert into
	Genres (genre_name)
values /* 10 жанров */
	('Alternative'), 
	('Baroque pop'),
	('Deephouse'), 
	('Hardcore'), 
	('Indie rock'), 
	('Jumpstyle'), 
	('Punk rock'), 
	('Synthpop'), 
	('Techno'),
	('Big beat');
	
insert into
	Artists (artist_name)
values /* 10 исполнителей */
	('Blur'), 
	('Coldplay'),
	('Empire Of The Sun'), 
	('Pet Shop Boys'), 
	('Scooter'), 
	('The Parakit'), 
	('Alden Jacob'), 
	('The Verve'), 
	('White Lies'),
	('The Prodigy');

insert into
	Artist_genres (artist_id, genre_id)
values /* соотнесём артистов и жанры */
	(1, 7), 
	(2, 1), (2, 2),
	(3, 1), 
	(4, 8), 
	(5, 4), (5, 6), (5, 9),
	(6, 3), 
	(7, 3), 
	(8, 1), 
	(9, 1), (9, 5),
	(10, 10);

insert into
	Albums (album_name, album_year)
values /* 13 альбомов */
	('Blur: The Best Of', 2000), 
	('A Head Full of Dreams', 2015),
	('Viva la Vida or Death and All His Friends', 2008), 
	('Ice On The Dune', 2013), 
	('PopArt', 2003), 
	('Push the Beat for This Jam', 2002), 
	('Music for a Big Night Out', 2012), 
	('... and the Beat Goes On!', 1995),
	('Urban Hymns', 1997), 
	('To Lose My Life', 2009), 
	('BIG TV', 2013),
	('Save Me (Single)', 2016),
	('No Tourists', 2018);
	
insert into
	Collections (collection_name, collection_year)
values /* 9 сборников */ 
	('24 Carat Gold', 2002), 
	('Jumping All over the World - Whatever You Want',2008), 
	('Format', 2012),
	('20 Years of Hardcore', 2013), 
	('DFM Summer Dance', 2016), 
	('Happy New Year', 2020), 
	('Most Streamed Songs', 2020), 
	('Rock Hits', 2020),
	('Indietronica: Альтернативная музыка', 2020);
	
insert into
	tracks (track_name, track_length, album_id)
values /* 20 треков*/
	('Flamboyant', '0:03:50', 5),
	('Miracles', '0:03:55', 5),
	('Paninaro ''95', '0:04:10', 5),
	('Friends', '0:04:40', 8),
	('Adventure Of A Lifetime', '0:04:23', 2),
	('Getting Even', '0:04:56', 11),
	('BIG TV', '0:05:27', 11),
	('First Time Caller', '0:03:34', 11),
	('Song 2', '0:02:02', 1),
	('Alive', '0:03:24', 4),
	('DNA', '0:03:54', 4),
	('4 AM', '0:03:16', 7),
	('Ramp! (The Logical Song)', '0:03:53', 6),
	('Save Me', '0:03:10', 12),
	('E.S.T.', '0:05:01', 10),
	('Bitter Sweet Symphony', '0:05:58', 9),
	('DNA', '0:03:54', 4),
	('Viva la Vida', '0:04:04', 3),
	('To Lose My Life', '0:03:14', 10),
	('Light Up the Sky', '0:03:20', 13);
	
insert into 
	album_of_artist (artist_id, album_id)
values /* Артисты и их альбомы*/
	(1, 1),
	(2, 2),
	(2, 3),
	(3, 4),
	(4, 5),
	(5, 6),
	(5, 7),
	(5, 8),
	(6, 12),
	(7, 12),
	(8, 9),
	(9, 10),
	(9, 11),
	(10, 13);
	
insert into 
	collection (track_id, collection_id)
values /* Связи: сборники и треки*/
	(2, 3),
	(4, 4),
	(5, 6),
	(6, 9),
	(9, 7),
	(10, 9),
	(12, 1),
	(12, 2),
	(13, 4),
	(14, 5),
	(16, 8);