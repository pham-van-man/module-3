create database my_database;
use my_database;
create table customer(c_id int auto_increment primary key,
 c_name varchar(255),
 cAge int check (cAge >=18));
create table or_der(o_id int auto_increment primary key,
 c_id int unique,
 o_date datetime,
 o_total_price int);
 create table product(p_id int auto_increment primary key,
 p_name varchar(255),
 p_price int);
  create table order_detail(o_id int,
 p_id int,
 primary key (o_id, p_id),
 foreign key (o_id) references or_der(o_id),
 foreign key (p_id) references product(p_id),
 od_qty int);