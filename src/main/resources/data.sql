--create table TODO (ID bigint not null, TASK_NAME varchar(255), TASK_DESC varchar(255),  STATUS varchar(255) , primary key (ID));

--create schema test;

--------------MySQL
--create table TASKS (id bigint NOT NULL AUTO_INCREMENT, TASK_NAME varchar(255), TASK_DESC varchar(255), STATUS varchar(255) , CREATED_AT timestamp, UPDATED_AT timestamp, primary key (id));

INSERT INTO TASKS VALUES(1,  'Bath', 'Have a bath' , 'PENDING', SYSDATE, SYSDATE);

--INSERT INTO TASKS VALUES(2,   'Snacks', 'Have snacks' , 'PENDING' , CURTIME() , CURTIME());

--INSERT INTO TASKS VALUES(3,   'Office', 'Office' , 'PENDING' , CURTIME() , CURTIME());

--INSERT INTO TASKS VALUES(4,   'Lunch', 'Lunch' , 'PENDING' , CURTIME() , CURTIME());