create database SAP;
create table S (
  sno     char(3) primary key,
  sname   char(12) not null,
  status  integer not null,
  city    char(15) not null
);

-- table P Parts
create table P (
  pno     char(3) primary key,
  pname	  char(12) not null,
  color	  char(12) not null,
  weight  decimal not null,
  city    char(15) not null
);

-- table SP 
create table SP (
  sno     char(3) references S,
  pno     char(3) references P,
  qty     integer not null,
  primary key(sno, pno)
);

/* The Suppliers-and-Parts Database Content
   see Date: An Introduction to Database Systems 8th edition p. 77
   and Date: SQL and Relational Theory p. 12
*/

-- table S Suppliers 
insert into S(sno, sname, status, city)
  values ('S1', 'Smith', 20, 'London'),
         ('S2', 'Jones', 10, 'Paris'),
         ('S3', 'Blake', 30, 'Paris'),
         ('S4', 'Clark', 20, 'London'),
         ('S5', 'Adams', 30, 'Athens');

-- table P Parts
insert into P(pno, pname, color, weight, city)
  values ('P1', 'Nut', 'Red', 12.0, 'London'),
         ('P2', 'Bolt', 'Green', 17.0, 'Paris'),
         ('P3', 'Screw', 'Blue', 17.0, 'Oslo'),
         ('P4', 'Screw', 'Red', 14.0, 'London'),
         ('P5', 'Cam', 'Blue', 12.0, 'Paris'),
         ('P6', 'Cog', 'Red', 19.0, 'London');

-- table SP
insert into SP(sno, pno, qty)
  values ('S1', 'P1', 300),
         ('S1', 'P2', 200),
         ('S1', 'P3', 400),
         ('S1', 'P4', 200),
         ('S1', 'P5', 100),
         ('S1', 'P6', 100),
         ('S2', 'P1', 300),
         ('S2', 'P2', 400),
         ('S3', 'P2', 200),
         ('S4', 'P2', 200),
         ('S4', 'P4', 300),
         ('S4', 'P5', 400);

-- SAP 01
select S.sno,status from S
where S.city = 'Paris';

-- SAP 02
select distinct SP.pno from SP;
select count(SP.pno) AS 'Ohne Distinct',
count(distinct SP.pno) AS 'Mit Distinct'from SP;

-- SAP 03
select * from S;

-- SAP 04
select S.sno from S
where S.city = 'Paris' AND status > 20;

-- SAP 05
select S.sno, S.status from S
where city = 'Paris'
order by S.status desc;

-- SAP 06
select P.pno,P.pname,P.weight from P
where P.weight >= 16 and P.weight <= 19;

select P.pno,P.pname,P.weight from P
where P.weight between 16 and 19;

-- SAP 07
select P.pno, P.weight from P
where weight = 12 
OR weight = 14
OR weight = 19;

select P.pno, P.weight from P
where weight in (12,14,19); 

select P.pno, P.weight from P
where weight in (select weight from P where color = 'RED'); 

-- SAP 08
select * from S,P 
where S.city = P.city
order by sno; 

select * from S,P,SP 
where S.city = P.city
and SP.sno = S.sno
and SP.pno = P.pno
order by SP.sno;

-- SAP 09
select distinct SP.sno, S.city as Lieferstadt, P.city as Lagerstadt 
from S, SP, P
where S.sno = SP.sno and SP.pno = P.pno;
 
-- SAP 10
select a.sno AS 'Nr.1', b.sno AS 'Nr.2', a.city from S a, S b
where a.sno <> b.sno
and a.city = b.city
group by a.city;

-- SAP 11
select S.sname from S join SP using(sno) join P using(pno)
where P.pno = 'P2';

select S.sname from S,SP,P
where S.sno = SP.sno
and SP.pno = P.pno
and P.pno = 'P2';

-- SAP 12
select distinct S.sname from S join SP using(sno) join P using(pno)
where P.color = 'Red';

-- SAP 13
select count(*) from S;

-- SAP 14
select count(distinct(sno)) from SP;

-- SAP 15
select count(*) from SP
where pno = 'P2';
