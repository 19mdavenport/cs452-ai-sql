CREATE TABLE Person (
    person_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) CHECK(gender IN ('M', 'F')) NOT NULL
);

CREATE TABLE Relationship (
    relationship_id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INT,
    related_person_id INT,
    relationship_type VARCHAR(12) CHECK(relationship_type IN ('Parent', 'Spouse')) NOT NULL,
    FOREIGN KEY (person_id) REFERENCES Person(person_id) ON DELETE CASCADE,
    FOREIGN KEY (related_person_id) REFERENCES Person(person_id) ON DELETE CASCADE
);

CREATE TABLE Location (
    location_id INTEGER PRIMARY KEY AUTOINCREMENT,
    latitude REAL NOT NULL,
    longitude REAL NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE Event (
    event_id INTEGER PRIMARY KEY AUTOINCREMENT,
    event_type VARCHAR(50) NOT NULL,
    event_date DATE NOT NULL,
    location_id INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES Location(location_id) ON DELETE CASCADE
);

CREATE TABLE EventParticipant (
    event_participant_id INTEGER PRIMARY KEY AUTOINCREMENT,
    event_id INT,
    person_id INT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id) ON DELETE CASCADE,
    FOREIGN KEY (person_id) REFERENCES Person(person_id) ON DELETE CASCADE,
    UNIQUE(event_id, person_id)
);
