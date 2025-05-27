SELECT current_database();

--Rangers table
CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(30),
    region VARCHAR(50)
);

INSERT INTO rangers ( name, region) VALUES 
    ( 'Alice Green', 'Northern Hills'),
    ( 'Bob White', 'River Delta'),
    ( 'Carol King', 'Mountain Range');

--species table

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(30),
    scientific_name VARCHAR(50),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

INSERT INTO species ( common_name, scientific_name, discovery_date, conservation_status) VALUES
( 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
( 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
( 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
( 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


-- sightings table

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT NOT NULL,
    ranger_id INT NOT NULL,
    location VARCHAR(200),
    sighting_time TIMESTAMP,
    notes VARCHAR(100),
    FOREIGN KEY (species_id) REFERENCES species(species_id),
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id)
);

INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES 
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);



SELECT * from rangers;
-- DROP table rangers;
SELECT * from species;
-- DROP table species;
SELECT * from sightings;
-- DROP table sightings;


-- table creation is done here

-- *** problem 1 ***

insert into rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains');


-- *** problem 2 ***

select count(DISTINCT species_id) as unique_species_count from sightings ;


-- *** problem 3 ***

SELECT * FROM sightings 
where "location" LIKE '%Pass%'
;

-- *** problem 4 ***


select name,count(*) as total_sightings FROM sightings
JOIN rangers USING(ranger_id)
GROUP BY name;

-- *** problem 5 ***

SELECT s . * FROM species s
LEFT JOIN sightings "sid" ON s.species_id = "sid".species_id
WHERE "sid".species_id IS NULL;


-- *** problem 6 ***

SELECT 
    species.common_name,
    sightings.sighting_time,
    rangers.name AS ranger_name
FROM sightings
JOIN species ON sightings.species_id = species.species_id
JOIN rangers ON sightings.ranger_id = rangers.ranger_id
ORDER BY sightings.sighting_time DESC
LIMIT 2;

-- *** problem 7 ***



ALTER TABLE species
ADD COLUMN conservation_status VARCHAR(50);

UPDATE species
SET conservation_status = 'Historic'
WHERE  EXTRACT(YEAR FROM discovery_date) < 1800;

--delete and check the column for testing--
ALTER TABLE species
DROP COLUMN conservation_status;

select * from species;



-- problem 8

SELECT s.sighting_id,t.time_of_day FROM sightings s
JOIN (SELECT * FROM (VALUES
            (1, 'Morning'),
            (2, 'Afternoon'),
            (3, 'Morning'),
            (4, 'Evening')
    ) AS t(sighting_id, time_of_day)
) t ON s.sighting_id = t.sighting_id;



-- problem 9

DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);


