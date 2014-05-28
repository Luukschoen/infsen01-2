users = LOAD './data/u.user' USING PigStorage('|') AS (userId,age,gender,occupation,zipCode);

allUsers = GROUP users ALL;
stats = FOREACH allUsers GENERATE COUNT(users), AVG(users.age), SUM(users.age);

byGender = GROUP users BY gender;
genderStats = FOREACH byGender GENERATE group, COUNT(users), AVG(users.age);

programmers = FILTER users BY occupation == 'programmer';
progsByAge = GROUP programmers BY age;
progCountsByAge = FOREACH progsByAge GENERATE group AS age, COUNT(programmers) as NumProgs;
progsCountsByAgeSorted = ORDER progCountsByAge BY age ASC;

STORE stats INTO 'output/stats' USING PigStorage('\t');
STORE genderStats INTO 'output/genderStats' USING PigStorage('\t');
STORE progsCountsByAgeSorted INTO 'output/progsCountsByAgeSorted' USING PigStorage('\t');
