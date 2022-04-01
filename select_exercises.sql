-- How many rows are in the albums table? 31
USE albums_db;
SELECT COUNT(*) 
FROM albums;

-- b. How many unique artist names are in the albums table? selecting distinct artists from the albums db 23
SELECT COUNT(DISTINCT artist)
FROM albums;

-- What is the primary key for the albums table? ID

--  What is the oldest release date for any album in the albums table? 1967
SELECT MIN(release_date) FROM albums;

-- a. The name of all albums by Pink Floyd
SELECT   
FROM albums
WHERE name = "Pink Floyd";

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released 1967
SELECT release_date 
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

-- c. The genre for the album Nevermind? Grunge, Alternative rock
SELECT genre
FROM  albums
WHERE name = "Nevermind";

-- d. Which albums were released in the 1990s


SELECT name, release_date  
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

/* The Bodyguard	1992
Jagged Little Pill	1995
Come On Over	1997
Falling into You	1996
Let's Talk About Love	1997
Dangerous	1991
The Immaculate Collection	1990
Titanic: Music from the Motion Picture	1997
Metallica	1991
Nevermind	1991
Supernatural	1999 */



-- e. Which albums had less than 20 million certified sales

SELECT name, sales
FROM albums 
WHERE sales < 20;

/* Grease: The Original Soundtrack from the Motion Picture	14.4
Bad	19.3
Sgt. Pepper's Lonely Hearts Club Band	13.1
Dirty Dancing	17.9
Let's Talk About Love	19.3
Dangerous	16.3
The Immaculate Collection	19.4
Abbey Road	14.4
Born in the U.S.A.	19.6
Brothers in Arms	17.7
Titanic: Music from the Motion Picture	18.1
Nevermind	16.7
The Wall	17.6  */

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"? Using = vs 
SELECT name,genre
FROM albums 
WHERE genre LIKE "%Rock%"



