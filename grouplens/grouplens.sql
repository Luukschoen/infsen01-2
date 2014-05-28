-- create table textlines(text string);    

-- load data local inpath 'C:\work\ClearPoint\Data20\data\words.txt' overwrite into table textlines;

-- create table words(word string);

-- insert overwrite table words select explode(split(text, '[ \t]+')) word from textlines;

-- select word, count(*) from words group by word;

CREATE TABLE u_data (
  userid INT,
  movieid INT,
  rating INT,
  unixtime STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH './data/u.data' OVERWRITE INTO TABLE u_data;

SELECT COUNT(*) FROM u_data;

-- users = LOAD '../grouplens/u.user' USING PigStorage('|') AS (userId,age,gender,occupation,zipCode);

-- allUsers = GROUP users ALL;
-- stats = FOREACH allUsers GENERATE COUNT(users), AVG(users.age), SUM(users.age);

-- byGender = GROUP users BY gender;
-- genderStats = FOREACH byGender GENERATE group, COUNT(users), AVG(users.age);

-- programmers = FILTER users BY occupation == 'programmer';
-- progsByAge = GROUP programmers BY age;
-- progCountsByAge = FOREACH progsByAge GENERATE group AS age, COUNT(programmers) as NumProgs;
-- progsCountsByAgeSorted = ORDER progCountsByAge BY age ASC;

-- STORE stats INTO 'output/stats' USINg PigStorage('\t');
-- STORE genderStats INTO 'output/genderStats' USING PigStorage('\t');
-- STORE progsCountsByAgeSorted INTO 'output/progsCountsByAgeSorted' USING PigStorage('\t');
