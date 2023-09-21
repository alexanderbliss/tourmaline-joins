-- Creating person table
CREATE TABLE "person" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL
	);

--Creating SSN table
    CREATE TABLE "social_security" (
	"id" SERIAL PRIMARY KEY,
	"person_id" INT REFERENCES "person",
	"number" INT NOT NULL
	);

--creating values
INSERT INTO "person" ("name") VALUES ('alex');
INSERT INTO "social_security" ("number", "person_id") VALUES (1234, 1);


-- first join statment
SELECT * FROM "person"
JOIN "social_security" ON "person"."id" = "social_security"."person_id"
WHERE "person"."id" = 1;

--cohort table
CREATE TABLE  "cohort" ( 
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(25),
	"start_date" DATE
	);

-- student table

CREATE TABLE  "student" ( 
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50),
	"cohort_id" INT REFERENCES "cohort"
	);

    --putting data in tables

    INSERT INTO "cohort" ("name", "start_date")
VALUES ('Rigel', '8/27/2018'),
('Kochab', '1/1/2018');


INSERT INTO "student" ("name", "cohort_id")
VALUES ('Jake', 1),
('Ellen', 2),
('Manny', 1);



--selects
SELECT * FROM "cohort"
SELECT * FROM "student"


-- joinging student and cohort
SELECT * FROM "student"
JOIN "cohort" ON "cohort"."id"="student"."cohort_id";

-- Call to ambiguous
SELECT "name", "start_date" FROM "cohort"
JOIN "student" ON "cohort"."id" = "student"."cohort_id";

-- Alias name column
SELECT "cohort"."name" AS "cohort_name", "student"."name" AS "student_name" FROM "cohort"
JOIN "student" ON "cohort"."id" = "student"."cohort_id";

-- initial counting
SELECT count(*) FROM "student"
JOIN "cohort" ON "cohort"."id"="student"."cohort_id"
WHERE "cohort"."name" = 'Rigel';

-- grouping and ordering
SELECT "cohort"."name", count(*) FROM "student"
JOIN "cohort" ON "cohort"."id"="student"."cohort_id"
GROUP BY "cohort"."name"
ORDER BY count ASC;

--adding cohort
INSERT INTO "cohort" ("name", "start_date")
VALUES ('alpha', '1-1-1970');

--using right join to grab empty table
SELECT "cohort"."name", count("student") FROM "student"
RIGHT JOIN "cohort" ON "cohort"."id"="student"."cohort_id"
GROUP BY "cohort"."name";

--added more poeple
INSERT INTO "person" (name)
VALUES ('Chris'), ('Marc'), ('Logan'), ('Lisa'),('Sara')

-- checking table
SELECT "id","name" FROM "person";

--creating Hobby table
CREATE TABLE "hobby" (
"id" SERIAL PRIMARY KEY,
"description" VARCHAR(100)
);

--insert into hobby table
INSERT INTO "hobby" ("description")
VALUES ('Kayaking'), ('Pottery'),
('Biking'), ('Cooking'), ('Swing Dancing');

--creating hobby person table
CREATE TABLE "person_hobby" (
"id" SERIAL PRIMARY KEY,
"person_id" INT REFERENCES "person",
"hobby_id" INT REFERENCES "hobby",
"skill" INT
);

--adding data to hobby person table
INSERT INTO "person_hobby" ("person_id", "hobby_id", "skill") VALUES (5, 2, 3), (5, 3, 2), (5, 5, 5),
(4, 4, 2), (4, 5, 2), (2, 3, 1), (2, 1, 3),
(3, 2, 2), (3, 1, 1), (3, 4, 3), (1, 1, 2);

--Alias id as Person_id
SELECT "id" AS "person_id" FROM "person_hobby"

SELECT * FROM "person" JOIN "person_hobby" ON
"person"."id" = "person_hobby"."person_id";

-- SELECT all data together
SELECT * FROM "person" 
JOIN "person_hobby" ON "person"."id" = "person_hobby"."person_id"
JOIN "hobby" ON "hobby"."id" = "person_hobby"."hobby_id";