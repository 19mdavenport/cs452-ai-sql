INSERT INTO Person (first_name, last_name, gender) VALUES
('Sheila', 'Parker', 'F'),
('Davis', 'Hyer', 'M'),
('Blaine', 'McGary', 'M'),
('Betty', 'White', 'F'),
('Ken', 'Rodham', 'M'),
('Mrs', 'Rodham', 'F'),
('Frank', 'Jones', 'M'),
('Mrs', 'Jones', 'F'),
('Patrick', 'Spencer', 'M'),
('Patrick', 'Wilson', 'M'),
('Spencer', 'Seeger', 'F');



INSERT INTO Relationship (person_id, related_person_id, relationship_type) VALUES
((SELECT person_id FROM Person WHERE first_name = 'Sheila' AND last_name = 'Parker'),
 (SELECT person_id FROM Person WHERE first_name = 'Davis' AND last_name = 'Hyer'), 'Spouse'),

((SELECT person_id FROM Person WHERE first_name = 'Blaine' AND last_name = 'McGary'),
 (SELECT person_id FROM Person WHERE first_name = 'Betty' AND last_name = 'White'), 'Spouse'),

((SELECT person_id FROM Person WHERE first_name = 'Ken' AND last_name = 'Rodham'),
 (SELECT person_id FROM Person WHERE first_name = 'Mrs' AND last_name = 'Rodham'), 'Spouse'),

((SELECT person_id FROM Person WHERE first_name = 'Frank' AND last_name = 'Jones'),
 (SELECT person_id FROM Person WHERE first_name = 'Mrs' AND last_name = 'Jones'), 'Spouse'),

((SELECT person_id FROM Person WHERE first_name = 'Blaine' AND last_name = 'McGary'),
 (SELECT person_id FROM Person WHERE first_name = 'Ken' AND last_name = 'Rodham'), 'Parent'),
((SELECT person_id FROM Person WHERE first_name = 'Blaine' AND last_name = 'McGary'),
 (SELECT person_id FROM Person WHERE first_name = 'Mrs' AND last_name = 'Rodham'), 'Parent'),

((SELECT person_id FROM Person WHERE first_name = 'Betty' AND last_name = 'White'),
 (SELECT person_id FROM Person WHERE first_name = 'Frank' AND last_name = 'Jones'), 'Parent'),
((SELECT person_id FROM Person WHERE first_name = 'Betty' AND last_name = 'White'),
 (SELECT person_id FROM Person WHERE first_name = 'Mrs' AND last_name = 'Jones'), 'Parent'),

((SELECT person_id FROM Person WHERE first_name = 'Sheila' AND last_name = 'Parker'),
 (SELECT person_id FROM Person WHERE first_name = 'Blaine' AND last_name = 'McGary'), 'Parent'),
((SELECT person_id FROM Person WHERE first_name = 'Sheila' AND last_name = 'Parker'),
 (SELECT person_id FROM Person WHERE first_name = 'Betty' AND last_name = 'White'), 'Parent'),

((SELECT person_id FROM Person WHERE first_name = 'Patrick' AND last_name = 'Spencer'),
 (SELECT person_id FROM Person WHERE first_name = 'Patrick' AND last_name = 'Wilson'), 'Parent'),
((SELECT person_id FROM Person WHERE first_name = 'Patrick' AND last_name = 'Spencer'),
 (SELECT person_id FROM Person WHERE first_name = 'Spencer' AND last_name = 'Seeger'), 'Parent');


INSERT INTO Location (latitude, longitude, city, country) VALUES
(-36.1833, 144.9667, 'Melbourne', 'Australia'),
(34.0500, -117.7500, 'Los Angeles', 'United States'),
(74.4667, -60.7667, 'Qaanaaq', 'Denmark'),
(40.2444, 111.6608, 'Provo', 'United States'),
(41.7667, 140.7333, 'Hakodate', 'Japan'),
(56.1167, 101.6000, 'Bratsk', 'Russia'),
(52.4833, -0.1000, 'Birmingham', 'United Kingdom'),
(40.2338, -111.6585, 'Provo', 'United States'),
(39.15, 127.45, 'Wonsan', 'North Korea'),
(32.6667, -114.5333, 'Mexicali', 'Mexico'),
(36.7667, 3.2167, 'Algiers', 'Algeria'),
(25.0667, -76.6667, 'Nassau', 'Bahamas'),
(9.4, 0.85, 'Tamale', 'Ghana'),
(-24.5833, -48.75, 'Curitiba', 'Brazil'),
(-27.9833, 153.4, 'Gold Coast', 'Australia'),
(76.4167, -81.1, 'Grise Fiord', 'Canada'),
(43.6167, -115.8, 'Boise', 'United States');



INSERT INTO Event (event_type, event_date, location_id) VALUES
('birth', '1970-05-12', (SELECT location_id FROM Location WHERE city = 'Melbourne' AND country = 'Australia')),
('marriage', '2012-08-22', (SELECT location_id FROM Location WHERE city = 'Los Angeles' AND country = 'United States')),
('completed asteroids', '2014-11-04', (SELECT location_id FROM Location WHERE city = 'Qaanaaq' AND country = 'Denmark')),
('completed asteroids', '2014-12-15', (SELECT location_id FROM Location WHERE city = 'Qaanaaq' AND country = 'Denmark')),
('death', '2015-02-19', (SELECT location_id FROM Location WHERE city = 'Provo' AND country = 'United States')),
('birth', '1970-03-30', (SELECT location_id FROM Location WHERE city = 'Hakodate' AND country = 'Japan')),
('birth', '1948-07-25', (SELECT location_id FROM Location WHERE city = 'Bratsk' AND country = 'Russia')),
('death', '2017-06-13', (SELECT location_id FROM Location WHERE city = 'Birmingham' AND country = 'United Kingdom')),
('Graduated from BYU', '1879-05-29', (SELECT location_id FROM Location WHERE city = 'Provo' AND country = 'United States')),
('marriage', '1895-04-10', (SELECT location_id FROM Location WHERE city = 'Wonsan' AND country = 'North Korea')),
('Did a backflip', '1890-07-14', (SELECT location_id FROM Location WHERE city = 'Mexicali' AND country = 'Mexico')),
('learned Java', '1890-10-05', (SELECT location_id FROM Location WHERE city = 'Algiers' AND country = 'Algeria')),
('Caught a frog', '1993-03-21', (SELECT location_id FROM Location WHERE city = 'Nassau' AND country = 'Bahamas')),
('marriage', '1997-11-18', (SELECT location_id FROM Location WHERE city = 'Tamale' AND country = 'Ghana')),
('Ate Brazilian Barbecue', '2012-01-09', (SELECT location_id FROM Location WHERE city = 'Curitiba' AND country = 'Brazil')),
('Learned to Surf', '2000-09-23', (SELECT location_id FROM Location WHERE city = 'Gold Coast' AND country = 'Australia')),
('birth', '2016-04-02', (SELECT location_id FROM Location WHERE city = 'Grise Fiord' AND country = 'Canada')),
('marriage', '2016-05-17', (SELECT location_id FROM Location WHERE city = 'Boise' AND country = 'United States'));



INSERT INTO EventParticipant (event_id, person_id) VALUES
-- Sheila Parker
((SELECT event_id FROM Event WHERE event_type = 'birth' AND event_date = '1970-05-12'), (SELECT person_id FROM Person WHERE first_name = 'Sheila' AND last_name = 'Parker')),
((SELECT event_id FROM Event WHERE event_type = 'marriage' AND event_date = '2012-08-22'), (SELECT person_id FROM Person WHERE first_name = 'Sheila' AND last_name = 'Parker')),
((SELECT event_id FROM Event WHERE event_type = 'completed asteroids' AND event_date = '2014-11-04'), (SELECT person_id FROM Person WHERE first_name = 'Sheila' AND last_name = 'Parker')),
((SELECT event_id FROM Event WHERE event_type = 'completed asteroids' AND event_date = '2014-12-15'), (SELECT person_id FROM Person WHERE first_name = 'Sheila' AND last_name = 'Parker')),
((SELECT event_id FROM Event WHERE event_type = 'death' AND event_date = '2015-02-19'), (SELECT person_id FROM Person WHERE first_name = 'Sheila' AND last_name = 'Parker')),

-- Davis Hyer
((SELECT event_id FROM Event WHERE event_type = 'birth' AND event_date = '1970-03-30'), (SELECT person_id FROM Person WHERE first_name = 'Davis' AND last_name = 'Hyer')),
((SELECT event_id FROM Event WHERE event_type = 'marriage' AND event_date = '2012-08-22'), (SELECT person_id FROM Person WHERE first_name = 'Davis' AND last_name = 'Hyer')),

-- Blaine McGary
((SELECT event_id FROM Event WHERE event_type = 'birth' AND event_date = '1948-07-25'), (SELECT person_id FROM Person WHERE first_name = 'Blaine' AND last_name = 'McGary')),
((SELECT event_id FROM Event WHERE event_type = 'death' AND event_date = '2017-06-13'), (SELECT person_id FROM Person WHERE first_name = 'Blaine' AND last_name = 'McGary')),

-- Betty White
((SELECT event_id FROM Event WHERE event_type = 'death' AND event_date = '2017-06-13'), (SELECT person_id FROM Person WHERE first_name = 'Betty' AND last_name = 'White')),

-- Ken Rodham
((SELECT event_id FROM Event WHERE event_type = 'Graduated from BYU' AND event_date = '1879-05-29'), (SELECT person_id FROM Person WHERE first_name = 'Ken' AND last_name = 'Rodham')),
((SELECT event_id FROM Event WHERE event_type = 'marriage' AND event_date = '1895-04-10'), (SELECT person_id FROM Person WHERE first_name = 'Ken' AND last_name = 'Rodham')),

-- Mrs. Rodham
((SELECT event_id FROM Event WHERE event_type = 'Did a backflip' AND event_date = '1890-07-14'), (SELECT person_id FROM Person WHERE first_name = 'Mrs' AND last_name = 'Rodham')),
((SELECT event_id FROM Event WHERE event_type = 'learned Java' AND event_date = '1890-10-05'), (SELECT person_id FROM Person WHERE first_name = 'Mrs' AND last_name = 'Rodham')),

-- Frank Jones
((SELECT event_id FROM Event WHERE event_type = 'Caught a frog' AND event_date = '1993-03-21'), (SELECT person_id FROM Person WHERE first_name = 'Frank' AND last_name = 'Jones')),
((SELECT event_id FROM Event WHERE event_type = 'marriage' AND event_date = '1997-11-18'), (SELECT person_id FROM Person WHERE first_name = 'Frank' AND last_name = 'Jones')),

-- Mrs. Jones
((SELECT event_id FROM Event WHERE event_type = 'Ate Brazilian Barbecue' AND event_date = '2012-01-09'), (SELECT person_id FROM Person WHERE first_name = 'Mrs' AND last_name = 'Jones')),
((SELECT event_id FROM Event WHERE event_type = 'Learned to Surf' AND event_date = '2000-09-23'), (SELECT person_id FROM Person WHERE first_name = 'Mrs' AND last_name = 'Jones')),

-- Patrick Spencer
((SELECT event_id FROM Event WHERE event_type = 'birth' AND event_date = '2016-04-02'), (SELECT person_id FROM Person WHERE first_name = 'Patrick' AND last_name = 'Spencer')),

-- Patrick Wilson
((SELECT event_id FROM Event WHERE event_type = 'marriage' AND event_date = '2016-05-17'), (SELECT person_id FROM Person WHERE first_name = 'Patrick' AND last_name = 'Wilson')),

-- Spencer Seeger
((SELECT event_id FROM Event WHERE event_type = 'marriage' AND event_date = '2016-05-17'), (SELECT person_id FROM Person WHERE first_name = 'Spencer' AND last_name = 'Seeger'));
