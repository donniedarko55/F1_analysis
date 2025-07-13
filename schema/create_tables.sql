CREATE TABLE circuits(
	circuitId integer PRIMARY KEY,
	circuitRef text NOT NULL,
	name text NOT NULL,
	location text NOT NULL,
	country text NOT NULL,
	lat numeric(15,5),
	lng numeric(15,5),
	alt numeric(15,5),
	url varchar(255)
);

COPY circuits
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/circuits.csv'
WITH (FORMAT CSV, HEADER);




SELECT * FROM circuits;

DROP TABLE constructor_results;   --- addded right not raceId not delacared yet, dropping table

CREATE TABLE constructor_results (
	constructorResultsId INTEGER NOT NULL,
	raceId INTEGER,
	FOREIGN KEY (raceId) REFERENCES races(raceId),
	constructorId SMALLINT,
	FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
	points NUMERIC(5,2),
	status varchar(2)
	
);

COPY constructor_results
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/constructor_results.csv'
WITH (FORMAT CSV, HEADER);








DROP TABLE constructorStandings;


CREATE TABLE constructorStandings (
	constructorStandingsId BIGINT,
	raceId INTEGER,
	FOREIGN KEY (raceId) REFERENCES races(raceId),
	constructorId SMALLINT NOT NULL,
	FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
	points NUMERIC(5,2),
	position INTEGER,
	positionText TEXT,
	wins INTEGER
	
);

COPY constructorStandings 
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/constructor_standings.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');













--- foundation tables

CREATE TABLE constructors(
	constructorId SMALLINT NOT NULL PRIMARY KEY,
	constructorRef TEXT NOT NULL,
	name TEXT NOT NULL,
	nationality text NOT NULL,
	url VARCHAR(255)

);

COPY constructors
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/constructors.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');




CREATE TABLE drivers (
	driverId SMALLINT NOT NULL PRIMARY KEY,
	driverRef TEXT NOT NULL,
	number SMALLINT,
	code VARCHAR(55),
	forename text,
	surname text,
	dob DATE, 
	nationality text,
	url VARCHAR(255)
)

COPY drivers
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/drivers.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');




CREATE TABLE races(
	raceId integer PRIMARY KEY,
	year SMALLINT,
	round INTEGER,
	circuitId INTEGER,
	FOREIGN KEY (circuitId) REFERENCES circuits(circuitId),
	name text,
	date DATE,
	time TIME,
	url VARCHAR(255),
	fp1_date DATE,
	fp1_time TIME,
	fp2_date DATE,
	fp2_time TIME,
	fp3_date DATE,
	fp3_time TIME,
	quali_date DATE,
	quali_time TIME,
	sprint_date DATE,
	sprint_time TIME
	
);

COPY races
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/races.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');







CREATE TABLE driver_standings (
	driverStandingId INTEGER PRIMARY KEY,
	raceId INTEGER,
	FOREIGN KEY (raceId) REFERENCES races(raceId),
	driverId SMALLINT,
	FOREIGN KEY (driverId) REFERENCES drivers(driverId),
	points NUMERIC(5,2),
	position INTEGER,
	positionText TEXT,
	wins INTEGER
	
);

COPY driver_standings
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/driver_standings.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');


CREATE TABLE lap_times(
	raceId INTEGER,
	FOREIGN KEY (raceId) REFERENCES races(raceId),
	driverId SMALLINT,
	FOREIGN KEY (driverId) REFERENCES drivers(driverId),
	lap INTEGER,
	position INTEGER,
	time TIME,
	milliseconds INTEGER
);

COPY lap_times
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/lap_times.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');


CREATE TABLE pit_stops(
	raceId INTEGER,
	FOREIGN KEY (raceId) REFERENCES races(raceId),
	driverId SMALLINT,
	FOREIGN KEY (driverId) REFERENCES drivers(driverId),
	stop SMALLINT,
	lap SMALLINT,
	time TIME,
	duration VARCHAR(15),
	milliseconds INTEGER
);


COPY pit_stops
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/pit_stops.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');



CREATE TABLE qualifying(
	qualifyId INTEGER PRIMARY KEY,
	raceId INTEGER,
	FOREIGN KEY (raceId) REFERENCES races(raceId),
	driverId SMALLINT,
	FOREIGN KEY (driverId) REFERENCES drivers(driverId),
	constructorId SMALLINT,
	FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
	number INTEGER,
	position INTEGER,
	q1 VARCHAR(15),
	q2 VARCHAR(15),
	q3 VARCHAR(15)
)

COPY qualifying
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/qualifying.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');



CREATE TABLE results (
	resultId INTEGER PRIMARY KEY,
	raceId INTEGER,
	FOREIGN KEY (raceId) REFERENCES races(raceId),
	driverId SMALLINT,
	FOREIGN KEY (driverId) REFERENCES drivers(driverId),
	constructorId SMALLINT,
	FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
	number INTEGER,
	grid INTEGER,
	position INTEGER,
	positionText VARCHAR(5),
	positionOrder INTEGER,
	points NUMERIC(5,2),
	laps INTEGER,
	time VARCHAR(20),
	milliseconds INTEGER,
	fastestLap SMALLINT,
	rank SMALLINT,
	fastestLapTime VARCHAR(15),
	fastestLapSpeed VARCHAR(10),
	statusId INTEGER,
	FOREIGN KEY (statusId) REFERENCES status(statusId)

);

COPY results
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/results.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');



CREATE TABLE seasons(
	year INTEGER NOT NULL,
	url VARCHAR(255)
);

COPY seasons
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/seasons.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');


 
CREATE TABLE sprint_results (
	resultId INTEGER PRIMARY KEY,
	raceId INTEGER,
	FOREIGN KEY (raceId) REFERENCES races(raceId),
	driverId SMALLINT,
	FOREIGN KEY (driverId) REFERENCES drivers(driverId),
	constructorId SMALLINT,
	FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
	number INTEGER,
	grid INTEGER,
	position INTEGER,
	positionText VARCHAR(5),
	positionOrder INTEGER,
	points NUMERIC(5,2),
	laps INTEGER,
	time VARCHAR(20),
	milliseconds INTEGER,
	fastestLap SMALLINT,
	fastestLapTime VARCHAR(15),
	statusId INTEGER,
	FOREIGN KEY (statusId) REFERENCES status(statusId)
);


COPY sprint_results
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/sprint_results.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');






CREATE TABLE status(
	statusId INTEGER PRIMARY KEY,
	status VARCHAR(100)
);

COPY status
FROM '/Users/walterfeliu/Documents/Coursera/Practical SQL/archive/status.csv'
WITH (FORMAT CSV, HEADER, NULL '\N');