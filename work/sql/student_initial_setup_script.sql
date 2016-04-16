DROP DATABASE IF EXISTS spartan_learning;
CREATE database spartan_learning;
USE spartan_learning;

CREATE TABLE people (
  person_id integer primary key auto_increment,
  first_name varchar(255) not null,
  surname varchar(255),
  dob datetime,
  email varchar(255),
  rating integer,
  t_pay bigint,
  t_tax int,
  department varchar(255)
);

INSERT into people
VALUES
(NULL, "Joe", "Bloggs", "1991-12-25", "jb@bloggs.com", 5, 43000, 2237, "Finance"),
(NULL, "Dave", "Smith", "1953-08-16", "dsmith@fserve.com", 7, 22500, 4834, "Finance"),
(NULL, "James", "Cameron", "1993-10-01", "j.cameron@gmail.com", 3, 51000, 4812, "Sales"),
(NULL, "Heidi", "Watling", "1993-11-12", "heidi3365@gmail.com", 2, 37850, 2204, "HR"),
(NULL, "Ben", "Hepburn", "1987-07-31", "bhep@foxnews.org", 9, 54500, 8504, "Sales"),
(NULL, "Simon", "Gaffney", "1984-10-23", "gimon.gaffers@hotmail.com", 5, 31000, 2055, "Sales"),
(NULL, "Joe", "Harwood", "1971-08-03", "har982@emaifree.co.uk", 4, 18700, 1205, "Training");

CREATE TABLE publishers (
  pub_id int(11) primary key auto_increment,
  publisher varchar(255) not null,
  pub_address varchar(255) not null
);

INSERT into publishers
VALUES
(1, "Random House", "123 4th Street, New York"),
(2, "Wiley and Sons", "45 Lincoln Blvd, Chicago"),
(3, "O'Reilly Press", "99 Market, San Francisco");


CREATE TABLE authors (
  author_id int(11) primary key auto_increment,
  author_name varchar(255) not null,
  author_bday date not null
);

INSERT into authors
VALUES
(1, "Haile Selassie", "1892-08-14"),
(2, "Joe Blow", "1915-03-14"),
(3, "Sally Hemmings", "1970-09-12"),
(4, "Hannah Arendt", "1906-03-12");

CREATE TABLE books (
  isbn char(13) primary key,
  author_id int(11) not null,
  pub_id int(10) not null,
  pub_year char(4) not null,
  title varchar(255) not null unique
);

INSERT into books
VALUES
("1-34532-482-1", 1, 3, "1990", "Cold Fusion for Dummies"),
("1-38482-995-1", 3, 2, "1985", "Macrame and Straw Tying"),
("2-35921-499-4", 4, 3, "1952", "Fluid Dynamics of Aquaducts"),
("1-38278-293-4", 4, 1, "1967", "Beads, Baskets & Revolution");

