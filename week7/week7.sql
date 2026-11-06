use movie_db;
select country_name from countries;
select director_name from directors;
# 1. Show the films with a budget greater than $10 million and a ranking lower than 6.

SELECT title ,budget,ranking 
FROM movies
WHERE budget > 10000000
AND ranking < 6;

# 2. Show the action films with a rating higher than 8.8,produced after 2009.

Select title,rating, year
from movies m
join genres g on m.movie_id = g.movie_id
where g.genre_name = "Action" and m.rating > 8.8 and m.year > 2009;

 
# 3. Show the drama films with a duration of more than 150 minutes and more than 2 Oscars.
select title, oscars,duration
from movies as m
#join genres g on m.movie_id = g.movie_id
where g.genre_name = "Drama " and m.duration > 150 and m.oscars >2
and movie_id in(select movie_id from genres where genre_name = "Drama")

# 4. Show the thriller films whose budget is greater than 25 million$.
SELECT m.movie_id, m.title, m.budget
FROM movies AS m
WHERE m.budget > 25000000
AND m.movie_id IN (
    SELECT g.movie_id
    FROM genres AS g
    WHERE g.genre_name = 'Thriller'
);

SELECT movies.movie_id, movies.title, movies.budget
FROM movies
JOIN genres
ON movies.movie_id = genres.movie_id
WHERE movies.budget > 25000000
AND genres.genre_name = 'Thriller';

# 5. Show the drama films whose language is Italian and produced between 1990-2000.		 
select  m.title,m.year
from  movies as m
join genres g on m.movie_id = g.movie_id
join languages l on m.movie_id = l.movie_id
where g.genre_name = "Drama" and l.language_name = "Italian " 
and m.year between 1990 and 2000;


# 6. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.	 
