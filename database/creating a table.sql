create database dobro;
use dobro;
create table deeds(
deed_id INT AUTO_INCREMENT PRIMARY KEY,
deadline date,
duration float not null,
org_name varchar(100),
description varchar(1000) not null,
place varchar(100),
timeline varchar(100),
event_type int);

create table users (
user_id varchar(60) primary key);

create table users_deeds(
 user_id varchar(60) NOT NULL,
 deed_id int NOT NULL,
 FOREIGN KEY (user_id) REFERENCES users(user_id), 
 FOREIGN KEY (deed_id) REFERENCES deeds(deed_id),
 UNIQUE (user_id, deed_id)  
);

ALTER DATABASE dobro CHARACTER SET utf8 COLLATE utf8_general_ci;




