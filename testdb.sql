DROP SEQUENCE IF EXISTS tier3;

CREATE SEQUENCE tier3
START WITH 6
INCREMENT BY 3
MINVALUE 6
MAXVALUE 1000
CYCLE;

DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS flashcard CASCADE;
DROP TABLE IF EXISTS study_set_card CASCADE;
DROP TABLE IF EXISTS study_set CASCADE;
DROP TABLE IF EXISTS app_user CASCADE;
DROP TABLE IF EXISTS user_role CASCADE;

CREATE TABLE category (
	category_id serial PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT null
);

CREATE TABLE flashcard (
	flachcard_id serial PRIMARY KEY,
	question varchar(100) UNIQUE NOT NULL,
	answer varchar(100) NOT NULL,
	category_id serial REFERENCES category(category_id)
);

CREATE TABLE user_role (
	role_id serial PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT null
);

CREATE TABLE app_user (
	user_id serial PRIMARY KEY,
	username varchar(30) UNIQUE NOT NULL,
	password varchar(30) NOT NULL,
	firstname varchar(30) NOT NULL,
	lastname varchar(30) NOT NULL,
	role_id serial REFERENCES user_role(role_id)
);

CREATE TABLE study_set (
	study_set_id serial PRIMARY KEY,
	name varchar(30) UNIQUE NOT NULL,
	owner_id serial REFERENCES app_user(user_id)
);

CREATE TABLE study_set_card (
	study_set_id serial REFERENCES study_set(study_set_id),
	flashcard_id serial primary KEY 
);


CREATE OR REPLACE FUNCTION trigger_set_time() RETURNS TRIGGER 
AS $$
BEGIN 
	NEW.update_at = NOW();
	RETURN NEW;
END;
$$ LANGUAGE plpgsql; 

ALTER TABLE category ADD COLUMN update_at TIMESTAMP;
ALTER TABLE flashcard ADD COLUMN update_at TIMESTAMP;
ALTER TABLE user_role ADD COLUMN update_at TIMESTAMP;
ALTER TABLE app_user ADD COLUMN update_at TIMESTAMP;
ALTER TABLE study_set ADD COLUMN update_at TIMESTAMP;
ALTER TABLE study_set_card ADD COLUMN update_at TIMESTAMP;

INSERT INTO user_role (name) VALUES ('ADMIN'), ('DEV'),
	('BASIC_USER'),('PREMIUM_USER'),('LOCKED');

INSERT INTO app_user (username, password, firstname, lastname, role_id) VALUES 
	('wsingleton', 'revature', 'Wezley', 'Singleton', 1),
	('rconnell', 'rolltide', 'Robert', 'Connell', 1),
	('skelsey', 'revasteve', 'Steven', 'Kelsey', 2),
	('mknighten', 'knifehand', 'Jason', 'Knighten', 3),
	('bkruppa', 'revature', 'Blake', 'Kruppa', 4),
	('trolluser', 'banned', 'Eric', 'Cartman', 1);

INSERT INTO category (name) VALUES 
	('Core Java'),
	('Java Threads'),
	('Java Reflection'),
	('Java Collections'),
	('Java Streams'),
	('Oracle SQL'),
	('PostgreSQL'),
	('Oracle PL/SQL'),
	('Postgre PL/pgSQL'),
	('JDBC'),
	('HTML'),
	('CSS'),
	('Core JavaScript'),
	('JavaScript DOM Manipulation'),
	('AJAX'),
	('Fetch API'),
	('Axios'),
	('Java Servlets'),
	('TypeScript'),
	('Node.js'),
	('Angular'),
	('React'),
	('Redux'),
	('Express'),
	('AWS Cloud'),
	('MS Azure Cloud'),
	('DevOps Principles'),
	('Jenkins'),
	('Containerization'),
	('Container Orchestration'),
	('Hibernate'),
	('Core Spring Framework'),
	('Spring Boot'),
	('Spring Data'),
	('Service Oriented Architecture'),
	('REST Web Services'),
	('SOAP Web Services'),
	('Microservice Architecture'),
	('Messaging Queues');

INSERT INTO flashcard (question, answer, category_id) VALUES 
	('Dummy Core Java Question 1', 'Dummy Answer', 1),
	('Dummy Core Java Question 2', 'Dummy Answer', 1),
	('Dummy Core Java Question 3', 'Dummy Answer', 1),
	('Dummy Java Threads Question 1', 'Dummy Answer', 2),
	('Dummy Oracle SQL Question 1', 'Dummy Answer', 6),
	('Dummy Oracle SQL Question 2', 'Dummy Answer', 6),
	('Dummy Core JavaScript Question 1', 'Dummy Answer', 13),
	('Dummy Core JavaScript Question 2', 'Dummy Answer', 13),
	('Dummy Core JavaScript Question 3', 'Dummy Answer', 13),
	('Dummy Core JavaScript Question 4', 'Dummy Answer', 13),
	('Dummy Angular Question 1', 'Dummy Answer', 21),
	('Dummy React Question 1', 'Dummy Answer', 22),
	('Dummy React Question 2', 'Dummy Answer', 22),
	('Dummy DevOps Principles Question 1', 'Dummy Answer', 27),
	('Dummy Containerization Question 1', 'Dummy Answer', 29),
	('Dummy Containerization Question 2', 'Dummy Answer', 29),
	('Dummy Hibernate Question 1', 'Dummy Answer', 31),
	('Dummy Hibernate Question 2', 'Dummy Answer', 31),
	('Dummy Core Spring Question 1', 'Dummy Answer', 32),
	('Dummy Core Spring Question 2', 'Dummy Answer', 32),
	('Dummy Spring Boot Question 1', 'Dummy Answer', 33),
	('Dummy Spring Boot Question 2', 'Dummy Answer', 33),
	('Dummy Microservice Architecture Question 1', 'Dummy Answer', 38),
	('Dummy Microservice Architecture Question 2', 'Dummy Answer', 38);

INSERT INTO study_set (name, owner_id) VALUES 
	('Core Java Study Set', 4),
	('Spring Study Set', 4),
	('Core JavaScript Study Set', 5),
	('React Study Set', 5),
	('DevOps Study Set', 5);

INSERT INTO study_set_card VALUES (1, 1),
	(1, 2),
	(1, 3),
	(2, 19),
	(2, 20),
	(2, 21),
	(2, 22),
	(3, 7),
	(3, 8),
	(3, 9),
	(3, 10),
	(4, 12),
	(4, 13),
	(5, 14),
	(5, 15),
	(5, 16);
	
select * from user_role;