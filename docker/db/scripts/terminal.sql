CREATE SCHEMA IF NOT EXISTS terminal;

CREATE TABLE IF NOT EXISTS terminal.station (
  name TEXT PRIMARY KEY,
  tracks INT UNIQUE,
  city TEXT,
  region TEXT
);

CREATE TABLE IF NOT EXISTS terminal.city (
  name TEXT,
  region TEXT,
  PRIMARY KEY (name, region)
);

CREATE TABLE IF NOT EXISTS terminal.train (
  id SERIAL PRIMARY KEY,
  length INT,
  depart_from TEXT,
  arrive_at TEXT,
  start_from TEXT,
  end_where TEXT,
  departure TIMESTAMP,
  arrival TIMESTAMP
);

ALTER TABLE terminal.station ADD FOREIGN KEY (city, region) REFERENCES terminal.city (name, region);
ALTER TABLE terminal.train ADD FOREIGN KEY (depart_from) REFERENCES terminal.station (name);
ALTER TABLE terminal.train ADD FOREIGN KEY (arrive_at) REFERENCES terminal.station (name);
ALTER TABLE terminal.train ADD FOREIGN KEY (start_from) REFERENCES terminal.station (name);
ALTER TABLE terminal.train ADD FOREIGN KEY (end_where) REFERENCES terminal.station (name);
