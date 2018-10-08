DROP TABLE routes;
DROP TABLE crags;
DROP TABLE books;

CREATE TABLE books(
  id SERIAL8 PRIMARY KEY,
  area VARCHAR(255)
);

CREATE TABLE crags(
  id SERIAL8 PRIMARY KEY,
  crag_name VARCHAR(255),
  elevation INT,
  aspect VARCHAR(255),
  book_id INT REFERENCES books(id) ON DELETE CASCADE
);

CREATE TABLE routes(
  id SERIAL8 PRIMARY KEY,
  route_name VARCHAR(255),
  summer_grade VARCHAR(255),
  winter_grade VARCHAR(255),
  length INT,
  crag_id INT REFERENCES crags(id) ON DELETE CASCADE
);
