DROP TABLE users;

CREATE TABLE users (
  userid INT,
  age INT,
  gender STRING,
  occupation STRING,
  zipCode STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH './data/u.user' OVERWRITE INTO TABLE users;

INSERT OVERWRITE LOCAL DIRECTORY 'hiveout/stats'
row format delimited
FIELDS TERMINATED BY ' '
SELECT COUNT(*), AVG(age), SUM(age) FROM users;

INSERT OVERWRITE LOCAL DIRECTORY 'hiveout/genderStats'
row format delimited
FIELDS TERMINATED BY ' '
SELECT gender, COUNT(*), AVG(age) FROM users GROUP BY gender;

INSERT OVERWRITE LOCAL DIRECTORY 'hiveout/progsCountsByAgeSorted'
row format delimited
FIELDS TERMINATED BY ' '
SELECT age, COUNT(*) FROM users WHERE occupation == 'programmer' GROUP BY age ORDER BY age ASC;
