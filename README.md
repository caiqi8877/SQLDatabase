1.
Instructions:
The database depicted in projectpart03relational.vsd is the relational mapping for Project- Part1Chen.vsd (projectpart 2) and describes Customer, Adult, Minor, Phone, SaverCard, Movie, Location, TheaterChain, Run and Reservation.
(a) Customer(CustID,FN, LN, Email, DOB): Lists all customers including Adults and Minor.
(b) Adult(AdultID, Sex): Lists all Adults and their sex
(c) Minor(MinorID, Supervisor, EndingDate): Lists all Minors, their supervisorid and ending date
(d) Phone(PhoneNumber, CustID): Lists all Phone numbers of the customers.
(e) SaverCard(CustID, SerialNo, ExpirationDate): Lists all savercards of the customers.
(f) Movie(MovieID, Name, Runtime): Lists every the movie name and its runtime.
(g) Location(ZIP, City): Lists all Zips and the cities
(h) TheaterChain(TheaterChainId,StockPrice): Lists all theaterchains and its stock price
(i) Run(MovieID, ZIP, TheaterChainId, ShowDate, OpenForReservation): Lists all the runs of movies.
(j) Reservation(MovieID, ZIP, TheaterChainId, ShowDate, CustID, ReservationDate, Tick- etPrice, NumberOfSeats): Lists all the reservations made by the customers on the runs
Be aware of that there are no duplicate rows in any of the tables. Please read the script project03script.sql carefully. It both defines and creates the sample database and has place- holders for putting in your answers.

You are supposed to produce the queries of Part 2 Questions. Most of them produce answers without modifying the database. For each such query, unless stated otherwise;
(a) Sort the results in ascending order
(b) Remove duplicates from the answer
So to assuming your answer without the above requirement, on a hypothetical database would have been:
SELECT a, b
....;
You should actually have:
SELECT DISTINCT a, b ....
ORDER BY a ASC, b ASC;

You may, of course, use intermediate tables while producing your answers. You may need to explicitly DROP them once the answer is produced, so that you can run your queries again without getting errors. Next part shows the questions.
Files in this Archive:
(a) This file: project03description.pdf
(b) project03relational.vsd, Visio implementation of the database
(c) project03script.sql, a script that will produce the database in Oracle. Before you run your queries you should run it to create corresponding tables.
(d) YourNnumber.sql, file in which you will input your queries. Replace YourNnumber by your N number. There are lines such as /* 01 CREATE TABLE ANSWER01 as */ in the file. Below such a line write
CREATE TABLE ANSWER01 AS
and immediately below it write your query.
(e) FirstnameLastName.txt, this should be the name of the spool file showing the run of your script YourNnumber.sql
(f) project03expected.txt, a spool file with correct results
Questions:
(a) (b) (c)
Produce table Answer01(MINORFNAME, ADULTFNAME) which contains all firstname of minor and their corresponding supervisor firstname.
Produce table Answer02(FN, LN) which contains the firstname and lastname of all customers who have not made any reservation so far.
Produce table Answer03(MNAME, FN, TNOOFSEATS) which contains the movie names, customer firstname and total number of seats. TNOOFSEATS should be the total number of seats reserved by each customer for each movie.