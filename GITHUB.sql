CREATE TABLE university_professors (
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    university_city VARCHAR(255),
    university_shortname VARCHAR(255),
    university VARCHAR(255),
    organization VARCHAR(255),
    function VARCHAR(255),
    organization_sector VARCHAR(255)
);
SELECT *
FROM university_professors;
CREATE TABLE universities (
id VARCHAR(255) PRIMARY KEY,
    university_shortname VARCHAR(255),
    university VARCHAR(255),
    university_city VARCHAR(255)
);
SELECT *
FROM universities
INSERT INTO universities(id,university,university_city)
SELECT DISTINCT university_city,university,university_shortname
FROM university_professors
-- rename column
ALTER TABLE universities
RENAME COLUMN university_shortname TO id;
-- joins
SELECT *
FROM organizations
JOIN universities ON organizations.id=universities.id;

SELECT *
FROM university_professors
CREATE TABLE organizations (
id SERIAL PRIMARY KEY,
    organization VARCHAR(255),
    organization_sector VARCHAR (255)
);

SELECT * 
FROM organizations
INSERT INTO organizations(organiation,organization_sector)
SELECT DISTINCT organization,organization_sector
FROM university_professors;
--rename column
ALTER TABLE organizations
RENAME COLUMN organizations TO id;
CREATE TABLE professors (
id SERIAL PRIMARY KEY,
    lastname VARCHAR(255),
    firstname VARCHAR(255),
    university_shortname VARCHAR(255),
	FOREIGN KEY(university_shortname)REFERENCES universities(id)
);
SELECT *
FROM professors
INSERT INTO professors(firstname,lastname,university_shortname)
SELECT DISTINCT firstname, lastname, university_shortname
FROM university_professors;

ALTER TABLE professors
ADD CONSTRAINT fk_university_shortname FOREIGN KEY(university_shortname)REFERENCES universities(id);
--add column
ALTER TABLE professors
ADD id serial PRIMARY KEY;
CREATE TABLE affiliations (
id SERIAL PRIMARY KEY,
    lastname VARCHAR(255),
    firstname VARCHAR(255),
    organization VARCHAR(255),
    function VARCHAR(255),
	FOREIGN KEY(firstname,lastname)REFERENCES professors(firstname,lastname)
);
SELECT *
FROM affiliations
INSERT INTO affiliations(firstname,lastname,organization,function)
SELECT DISTINCT organization,firstname,lastname,function
FROM university_professors

ALTER TABLE  affiliations 
ADD CONSTRAINT fk_affiliation_professor FOREIGN KEY(firstname,lastname)REFERENCES professors (firstname,lastname);

ALTER TABLE affiliations
ADD CONSTRAINT fk_affiliation_organization FOREIGN KEY (organization)REFERENCES organizations(organization);

ALTER TABLE affilitaion
DROP COLUMN organization;