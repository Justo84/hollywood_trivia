-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

SELECT title, rating FROM movies ORDER by rating LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

SELECT title, rating FROM movies WHERE rating IS NULL ORDER BY title;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

SELECT title, synopsis FROM movies WHERE synopsis LIKE '%thrilling%';

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

SELECT title, rating FROM movies WHERE rating > 90 AND year BETWEEN 1979 AND 1990 ORDER BY rating DESC;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

SELECT actors.name, movies.title, movies.year FROM movies JOIN cast_members ON movies.id = cast_members.movie_id JOIN actors on actors.id = cast_members.actor_id WHERE cast_members.character = 'James Bond' ORDER BY movies.year ASC;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

SELECT movies.title, movies.year, genres.name FROM movies JOIN genres ON genres.id = movies.genre_id JOIN cast_members ON movies.id = cast_members.movie_id JOIN actors on actors.id = cast_members.actor_id WHERE actors.name = 'Julianne Moore' ORDER BY genres.name, movies.title;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

SELECT movies.title, movies.year, studios.name FROM movies
LEFT OUTER JOIN studios ON movies.studio_id = studios.id
JOIN genres ON genres.id = movies.genre_id WHERE genres.name = 'Horror'
ORDER BY movies.year LIMIT 5;
