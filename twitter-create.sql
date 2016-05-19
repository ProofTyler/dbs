create database if not exists Twitter;

create table if not exists TUser (
	Id integer primary key,
	Name varchar(50) unique,
    Country char(2) references Country(Code),
	Location varchar(40)
);

create table if not exists Country (
	Code char(2) primary key,
    CName varchar(40)
);

create table if not exists Tweet (
	Id integer references TUser(Id),
    TweetTime timestamp,
    Message varchar(140),
    primary key(Id,TweetTime)
);

create table if not exists Follows (
	A integer references TUser(Id),
    B integer references TUser(Id),
    primary key (A,B)
);

insert into country values
("DE","Deutschland"),
("US","Amerika"),
("ES","Spanien"),
("FR","Frankreich"),
("IT","Italien")
;
insert into country values
("GR","Griechenland"),
("PT","Portugal"),
("AL","Albanien")
;

insert into tuser values
(1,"Klaus08","DE","Limburg"),
(2,"Jenny18","DE","Giessen"),
(3,"McMartin","US","Los Angeles"),
(4,"CatGirl","US","Las Vegas"),
(5,"Maria","ES","Madrid"),
(6,"Alejandro","ES","Barcelona"),
(7,"Clara","FR","Paris"),
(8,"Lucas","FR","Nizza"),
(9,"Camilla","IT","Rom"),
(10,"Francesco","IT","Venedig")
;


insert into tweet values
(1,"2016-05-16-08:12:04","So kalt in Deutschland, obwohl schon Mai ist!"),
(2,"2016-05-17-08:12:04","Ein Auslandssemester im Süden klingt da doch verlockend!"),
(1,"2016-05-20-08:12:04","Zu faul dafür^^"),
(3,"2016-06-16-08:12:04","Jeder zweite verbringt mehr Zeit mit seinem Handy als ohne!"),
(5,"2016-06-16-10:12:04","Tennis Verein sucht junge motivierte Spieler!"),
(5,"2016-07-16-08:12:04","Hauptseminar für Mobile Entwicklung wird dieses SS angeboten!"),
(7,"2016-07-16-10:12:04","Ich vergeben 6 von 10 Sterne für Batman vs Superman!"),
(8,"2016-06-16-10:12:04","Jeder trägt zur Umweltverschmutzung bei. Aber deine Ansicht ist sicher wichtiger!"),
(9,"2016-09-16-11:12:04","Ich spiele Tennis aber nur mit dem Fuß... und einen größeren Ball...und einem viereckigen Tor"),
(9,"2016-09-16-12:12:04","Wann kann man sich einschreiben?")
;

insert into follows values
(2,1),
(8,3),
(9,5),
(2,5),
(4,5),
(6,5)
;
insert into follows values
(5,9),
(9,8),
(8,9)
;

insert into follows values
(9,3),
(5,8)
;

insert into follows values
(1,9),
(2,9)
;