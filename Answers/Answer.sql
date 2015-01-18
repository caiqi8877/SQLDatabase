/* Student Name: First LAST */
/* N number: 12345678 */

/* Clean up any previous homework answers */
DROP TABLE ANSWER01;
DROP TABLE ANSWER02;
DROP TABLE ANSWER03;
DROP TABLE ANSWER04;
DROP TABLE ANSWER05;
DROP TABLE ANSWER06;
DROP TABLE ANSWER07;
DROP TABLE ANSWER08;
DROP TABLE ANSWER09;
DROP VIEW RESERVIEW;



/*DROP ANY TEMPORARY TABLES IF YOU USE */
drop table run1;
drop table run2;
drop table data_amount;
/* 02 CREATE TABLE ANSWER01 as */
CREATE TABLE ANSWER01 as
select distinct customer1.fn as MINORFNAME, customer2.fn as ADULTFNAME
from customer customer1,customer customer2,minor
where customer1.custid=minor.minorid and customer2.custid=minor.supervisor
order by MINORFNAME ASC, ADULTFNAME ASC;

/* 02 CREATE TABLE ANSWER02 as */
CREATE TABLE ANSWER02 as
select FN,LN
from customer
where custid<>all
(select custid from reservation);

/* 03 CREATE TABLE ANSWER03 as */
	
CREATE TABLE ANSWER03 as 
select movie.name as MNAME,customer.FN,sum(numberofseats) as TNOOFSEATS from movie,reservation,customer 
where reservation.movieid=movie.movieid and reservation.custid=customer.custid
group by movie.name,customer.FN order by MNAME asc,customer.fn asc, tnoofseats asc;

/* 04 CREATE TABLE ANSWER04 as */
create table run1 as
select movieid from run
where run.theaterchainid='1111';

CREATE TABLE ANSWER04 as
select distinct theaterchainid from run
where run.movieid=any
(select movieid from run1)
order by theaterchainid asc;

/* 05 CREATE TABLE ANSWER05 as */
create table run2 as select distinct movieid from run where run.zip='94223';

CREATE TABLE ANSWER05 as
select distinct c1.zip from run c1 where not exists
(select movieid from run2 where movieid<>all
(select movieid from run where run.zip=c1.zip)) 
order by zip asc;

/* 06 CREATE VIEW RESERVIEW as */
create view Reserview as 
select MOVIEID, ZIP, THEATERCHAINID, CUSTID, RESERVATIONDATE, TICKETPRICE, 
NUMBEROFSEATS, (TICKETPRICE*NumberOfSeats) as TOTALAMOUNT 
from Reservation;

/* 07 CREATE TABLE ANSWER06 as */
create Table Answer06 as
select RESERVATIONDATE, sum(TOTALAMOUNT) as SUM, avg(TOTALAMOUNT) as AVG from Reserview 
where CustID <> '1000'
group by RESERVATIONDATE
having avg(TOTALAMOUNT)>45 order by RESERVATIONDATE asc;

/* 08 CREATE TABLE ANSWER07 as */
CREATE TABLE ANSWER07 as
select TOTALAMOUNT 
from (select rownum n, TOTALAMOUNT from RESERVIEW order by TOTALAMOUNT asc) 
where n = ((select count(1) from RESERVIEW) -1);

/* 09 CREATE TABLE ANSWER08 as */
create Table data_amount as select RESERVATIONDATE, min(TOTALAMOUNT) minAmount 
from RESERVIEW group by RESERVATIONDATE;

CREATE TABLE ANSWER08 as
select distinct RESERVATIONDATE, TOTALAMOUNT from RESERVIEW 
where TOTALAMOUNT > 
(select minAmount from data_amount
where RESERVIEW.RESERVATIONDATE = data_amount.RESERVATIONDATE) 
order by RESERVATIONDATE asc, TOTALAMOUNT desc;


/* 10 CREATE TABLE ANSWER09 as */
create Table Answer09 as select FN, RESERVATIONDATE, TOTALAMOUNT 
from Customer, RESERVIEW, Movie 
where Customer.CustID = RESERVIEW.CustID and RESERVIEW.MovieID = Movie.MovieID 
and Movie.Name = 'The Avengers' and (TOTALAMOUNT >
(select avg(TOTALAMOUNT) from Customer, RESERVIEW, Movie
where Customer.CustID = RESERVIEW.CustID and RESERVIEW.MovieID = Movie.MovieID 
and Movie.Name = 'The Avengers') )
order by FN asc;

/* OTHER QUERIES PLACE HERE */
insert into movie values ('888888','The Iceman','100');
	
update SaverCard set ExpirationDate = TO_DATE('01/11/2020','MM/DD/YYYY') 
where CustID = (select CustID from Customer where FN = 'John' and LN = 'Mike')
and SerialNo = 2;

delete from Minor where MinorID = '9000';
insert into Adult values('9000', 'F');
/* PRINT RESULTS */
SELECT * FROM Answer01;
SELECT * FROM Answer02;
SELECT * FROM Answer03;
SELECT * FROM Answer04;
SELECT * FROM Answer05;
SELECT * FROM RESERVIEW;
SELECT * FROM Answer06;
SELECT * FROM Answer07;
SELECT * FROM Answer08;
SELECT * FROM Answer09;
SELECT * FROM MOVIE;
SELECT * FROM SAVERCARD;
SELECT * FROM MINOR;
SELECT * FROM ADULT;