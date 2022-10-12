CREATE SCHEMA IF NOT EXISTS hospital;

CREATE TABLE IF NOT EXISTS hospital.station (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE IF NOT EXISTS hospital.room (
  id SERIAL,
  station_id INT,
  beds INT UNIQUE,
  PRIMARY KEY(id, station_id)
);

CREATE TABLE IF NOT EXISTS hospital.patient (
  id SERIAL PRIMARY KEY,
  name TEXT,
  disease TEXT,
  doctor_id INT,
  room_id SERIAL,
  station_id INT
);

CREATE TABLE IF NOT EXISTS hospital.station_personell (
  id SERIAL PRIMARY KEY,
  name TEXT,
  station INT
);

CREATE TABLE IF NOT EXISTS hospital.doctor (
  id SERIAL PRIMARY KEY,
  area TEXT,
  rank INT
);

CREATE TABLE IF NOT EXISTS hospital.caregiver (
  id SERIAL PRIMARY KEY,
  qualification TEXT
);

ALTER TABLE hospital.room ADD FOREIGN KEY (station_id) REFERENCES hospital.station (id);

ALTER TABLE hospital.patient ADD FOREIGN KEY (room_id, station_id) REFERENCES hospital.room (id, station_id);

ALTER TABLE hospital.patient ADD FOREIGN KEY (doctor_id) REFERENCES hospital.doctor (id);

ALTER TABLE hospital.station_personell ADD FOREIGN KEY (station) REFERENCES hospital.station (id);

ALTER TABLE hospital.station_personell ADD FOREIGN KEY (id) REFERENCES hospital.doctor (id);

ALTER TABLE hospital.station_personell ADD FOREIGN KEY (id) REFERENCES hospital.caregiver (id);
