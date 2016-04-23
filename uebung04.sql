-- SAP 16
select SP.pno, sum(SP.qty) from SP
group by SP.pno;

-- SAP 17
select SP.pno from SP 
group by SP.pno having count(SP.pno) > 1;
/* 
Ist nicht ganz korrekt, weil nicht direkt die anzahl
der Lieferanten für ein Teil 
*/

-- SAP 18
create table SKopie like S;
select * from Skopie;

-- SAP 19
alter table Skopie
add column postcode char(8);
select * from Skopie;

-- SAP 20
create index einIndex on SKopie(postcode);

-- SAP 21
drop table SKopie;
create table SKopie as select * from S;
create table PKopie as select * from P;
create table SPKopie as select * from SP;

-- SAP 22
insert into SKopie values
('S6','Black',15,'Rome');

-- SAP 23
create table Menge (
pno char(3) not null primary key,
menge int
);
insert into Menge(pno,menge)
select SP.pno, sum(SP.qty) from sp
group by SP.pno;
select * from Menge;
/* Befehl into [Table] wird nicht in mysql workbench unterstützt!!!!*/

-- SAP 24
update SKopie set SKopie.status = 50
where SKopie.sno = 'S2';
select * from SKopie;

-- SAP 25
update SPKopie set qty = 10
where sno in 
(select Skopie.sno from SKopie
where SKopie.city = 'London');

select * from spkopie;

-- SAP 26
delete from SKopie
where sno = 'S4';

select * from SKopie;

-- SAP 27
delete from SPKopie
where qty >= 300;

select * from SPKopie;

-- SAP 28
drop table SKopie,SPKopie,PKopie;
drop table Menge;