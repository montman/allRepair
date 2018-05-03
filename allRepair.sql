CREATE DATABASE allRepair;
use allRepair;

create table userType 						--Tabella tipologia utenti
(
ID smallint primary key not null,
role enum ('user','technic','admin')  default 'user'
);

create table users						--Tabella utenti
(
username varchar(16) primary key not null,
password varchar(16) not null,
email varchar(50) not null,
name varchar(30) default null,
cap varchar(5) default null,
city varchar(30) default null,
address varchar(50) default null,
userType smallint,
foreign key (userType) references userType(ID)
);

create table devices						--Tabella dispositivo
(
ID int primary key not null auto_increment,
company varchar(30) not null,
serial varchar(30) not null
);

CREATE TABLE requests						--Tabella richieste di riparazione
(
ID INT primary key NOT NULL AUTO_INCREMENT,
priceAccepted boolean,
repairAccepted boolean,
prezzo int,
reqTo varchar(16),						--utente a cui è stata affidata la riparazione
reqBy varchar(16),						--utente che ha richiesto la riparazione
productID int,
description varchar(250),
year varchar(4),
month int,
day int,
foreign key (reqTo) references users(username),
foreign key (productID) references devices(ID),
foreign key (reqBy) references users(username)
);

--valori di esempio

insert into userType (ID) values (0);
insert into userType values (1, 'technic'); 
insert into userType values (2, 'admin') ;

insert into users values ('admin_01','Magiclub','amatipierluigi@gmail.com','Pierluigi Amati','64033','Bisenti','Via San Nicola, 59',2);

insert into users values ('tech_01','12345678','','Giacomo Piru','00100','Roma','Via Perugia, 88',1);
insert into users values ('tech_02','12345678','','Ferninando Flash','00100','Roma','Via Ugo Foscolo, 234',1);
insert into users values ('tech_03','12345678','','Giorgiorgio Speed','00100','Roma','Via Giofonchio, 6',1);
insert into users values ('tech_04','12345678','','Stegosandro Rapid','00100','Roma','Via Roma, 59',1);
insert into users values ('tech_05','12345678','','Antonino Blu','00100','Roma','Via Ciccio Valenti, 1',1);