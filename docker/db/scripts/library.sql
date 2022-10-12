CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE IF NOT EXISTS library.book (
  isbn SERIAL PRIMARY KEY,
  name TEXT,
  author TEXT,
  publisher TEXT,
  pub_year INT,
  pages INT,
  category TEXT
);

CREATE TABLE IF NOT EXISTS library.publisher (
  name TEXT PRIMARY KEY,
  adress TEXT
);

CREATE TABLE IF NOT EXISTS library.copy (
  id SERIAL,
  isbn INT,
  location TEXT,
  PRIMARY KEY (id, isbn)
);

CREATE TABLE IF NOT EXISTS library.category (
  title TEXT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS library.reader (
  id SERIAL PRIMARY KEY,
  name TEXT,
  surname TEXT,
  birth_date TIMESTAMP,
  adress TEXT
);

CREATE TABLE IF NOT EXISTS library.borrowed_book (
  isbn SERIAL,
  copy_id INT,
  reader_id INT,
  return_date TIMESTAMP,
  PRIMARY KEY (isbn, copy_id, reader_id)
);

ALTER TABLE library.book ADD FOREIGN KEY (publisher) REFERENCES library.publisher (name);
ALTER TABLE library.copy ADD FOREIGN KEY (isbn) REFERENCES library.book (isbn);
