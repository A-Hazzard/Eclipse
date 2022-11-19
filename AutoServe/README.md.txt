IT WOULD REALLY MEAN ALLOOOOOOOOOOTTTT TO ME IF YOU CAN KINDLY WALK THROUGH THIS WITH ME PRETTY PLEASE. My deadline is really near 😥
In case of any confusions, my discord is BoatMan:8845. My instagram is @yuhboy._.aaron(about 920 followers), 

A video of each step is provided in the videos folder
This project is also on my github, just focus on the AutoServe Folder.
https://github.com/A-Hazzard/Eclipse

Eclipse is needed to run this project


Step 1) Navigate to src -> main -> webapp -> run index.jsp



Step 2) Oracle SQL was used if you want to test it in your own database you would need to create a new user account in oracle as SYS with the following code
(copy and paste) 

ALTER SESSION SET CONTAINER = XEPDB1;
CREATE USER autoserve IDENTIFIED BY password;
ALTER USER autoserve DEFAULT TABLESPACE users QUOTA UNLIMITED ON users;
ALTER USER autoserve TEMPORARY TABLESPACE TEMP;
GRANT CONNECT TO autoserve;
GRANT CREATE SESSION, CREATE VIEW, CREATE TABLE, ALTER SESSION, CREATE SEQUENCE TO 
autoserve;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE, UNLIMITED TABLESPACE TO autoserve;


Step 3) After the user has been created, select the plus icon on the top right of the explorer panel in ORACLE and add a new connection 
connect to the AutoServe database with the credentials 
{
	Name: Autoserve,
	DtabaseType: default,
	AuthenticationType: default,
	username: autoserve,
	password: autoserveinc,
	role: default,
	hostname: localhost,
	port: 1521
	servename: XEPDB1
}

After connecting

Step 4) You need to create a table called person which is used for login

--SEQUENCE USED TO AUTO INCRREMENT PERSON ID
CREATE SEQUENCE personID
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

CREATE TABLE PERSON(
	ID NUMBER PRIMARY KEY NOT NULL,
	firstname VARCHAR(20) NOT NULL,
	lastname VARCHAR(20) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone VARCHAR(20) NOT NULL,
	password VARCHAR(20) NOT NULL,
	position VARCHAR(20) NOT NULL
);
--INSERT ADMIN DATA INTO TABLE
INSERT INTO PERSON VALUES(personID.nextval, 'Winston', 'Smith', 'winston.fields@admin.autoserve.com', '+1 (868) 632-5987', 'winstonfields', 'Staff');
INSERT INTO PERSON VALUES(personID.nextval, 'Aaron', 'Hazzard', 'aaron.hazzard@autoserve.com', '+1 (868) 761-8373', 'aaronhazzard', 'Staff');
INSERT INTO PERSON VALUES(personID.nextval, 'Josiah', 'Lawrence', 'josiahlawrence@gmail.com', '+1 (868) 745-6433', 'josiah123', 'Client');





Step 5) After the database info has been created you can now login from the login.jsp. AJAX is used to load the login/sign up page located in 
AutoServe -> src -> main -> webapp -> pages -> states -> loginPage.txt

 Login as 
{
	email: josiahlawrence@gmail.com,
	password: josiah123
}

In case of any connectivity issues. The java servlet code to connect to the oracle database is located at:
AutoServe -> src -> main -> java -> Servlets -> ConnectionProvider.

When the user logins in from the loginPage.txt it sends an action the webapp -> jsp -> loginAction.jsp that checks for user info(in case u are having login issues);

NOW FOR THE ISSUE THAT I HAVE
in the navbar click jobs, i want the user to scroll down and they will see a button called register your vehicle now(Call to ation) when they click on that 
i would like for the user to fill out a form which sends data to a table called registrationQueu

CREATE SEQUENCE regID
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

--This is a table that the user uses to book their vehicles
CREATE TABLE registrationQueu(
	regID NUMBER PRIMARY KEY NOT NULL,
	clientName VARCHAR(20) NOT NULL,
	vehicleType VARCHAR(20) NOT NULL,
);


When to user enters form data, it is sent to the Autserve table, what i want to know is, how can i get that data to be sent to the staff automatically without 
the staff refreshing their page?

Staff logs in
{
	email: aaron.hazzard@autoserve.com,
	password: aaronhazzard
}

Only staff is supposed to see in the navbar[clients application], im not sure how to only allow staff members to see that,
after they click on it they are supposed to see (live) clients application come in. Example, client 1 fills out the form, staff member sees the form load in page
automatically, like a notification on twitter and whatsapp in a way.



