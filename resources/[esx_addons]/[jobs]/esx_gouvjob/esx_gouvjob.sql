USE `es_extended`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_gouv', 'Gouvernement', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_gouv', 'Gouvernement', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_gouv', 'Gouvernement', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('gouv', 'Gouvernement')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('gouv',0,'stagiaire','Stagiaire',350,'{}','{}'),
	('gouv',1,'secretaire','Secrétaire',550,'{}','{}'),
	('gouv',2,'agents','Agent de sécu',700,'{}','{}'),
	('gouv',3,'juge','Juge',800,'{}','{}'),
	('gouv',4,'boss','Gouv',1000,'{}','{}')
;