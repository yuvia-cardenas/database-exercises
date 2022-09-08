Use the albums_db database
USE albums_db;
Explore the structure of the albums table.
SELECT *
FROM albums;
a. How many rows are in the albums table?
31
b. How many unique artist names are in the albums table?
SELECT DISTINCT artist
FROM albums;
23
c. What is the primary key for the albums table?
id
d. What is the oldest release date for any album in the albums table? What is the most recent release date?

Write queries to find the following information:

a. The name of all albums by Pink Floyd
2
USE albums_db;
SELECT * 
FROM albums
WHERE artist = 'Pink Floyd';

b. The year Sgt. Pepper's Lonely Hearts Club Band was released
1967
USE albums_db;

SELECT release date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
c. The genre for the album Nevermind
USE albums_db;

SELECT genre
FROM albums
WHERE name = "Nevermind";

d. Which albums were released in the 1990s
USE albums_db;

SELECT name
FROM albums
WHERE release_date >= 1990 AND release_date <2000;
e. Which albums had less than 20 million certified sales
SELECT name
FROM albums
WHERE sales < 20;

f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT name
FROM albums
WHERE genre = "Rock";

Be sure to add, commit, and push your work.