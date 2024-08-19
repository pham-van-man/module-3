create
    database mydatabase;
use
    mydatabase;
create table class
(
    id   int auto_increment primary key,
    name varchar(255)
);
create table teacher
(
    id      int auto_increment primary key,
    name    varchar(255),
    age     int check (age > 18),
    country varchar(255)
);