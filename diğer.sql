--Table nasıl oluşturulur

--1. yol : sıfırdan table oluşturma


CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),	
student_age SMALLINT,
student_dob DATE
);

SELECT * FROM students;

--2.yol 
__BAŞKA BİR TABLE KULLANARAK TABLE OLUŞTURMA

CREATE TABLE student_name_age
AS SELECT student_name,student_age
FROM students;


SELECT * FROM student_name_age;


--table oluştururken bazı constraints(kısıklama) atamaları yapabiliriz
--UNİQUE
--NOT NULL
--PRİMARY KEY
--FOREİGN KEY
--CHECK CONSTRAIN



CREATE TABLE students
(
student_id SMALLINT PRIMARY KEY,
student_name VARCHAR(50) NOT NULL,	--syudent_name null değer alamaz
student_age SMALLINT,
student_dob DATE UNIQUE--student_id unique key null değer dışındaki değerler tekrarsız olmalıdır
);


SELECT * FROM students;


--PRİMARY KEY İÇİN
--2.YOL


CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),	
student_age SMALLINT,
student_dob DATE,
CONSTRAINT student_id_pk PRIMARY KEY(student_id)	
	
);

--fOREİGN KEY CONSTRAINT NASIL EKLENİR:
--İKİ TABLE ARASINDA İLİŞKİYİ KURAR

CREATE TABLE parents
(
student_id SMALLINT,
parent_name VARCHAR(50),
phone_number CHAR(11),
CONSTRAINT student_id_pk PRIMARY KEY(student_id)
);






CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),	
student_age SMALLINT,
student_dob DATE,
CONSTRAINT 	student_id_fk FOREIGN KEY(student_id) REFERENCES parents(student_id)
);


--Check constraint nasıl eklenir:


CREATE TABLE students
(
student_id SMALLINT,
student_name VARCHAR(50),	
student_age SMALLINT,
student_dob DATE,
CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 30),--0 VE 30 DAHİL
CONSTRAINT 	student_name CHECK(student_name = UPPER (student_name))
);


--table veri nasıl girilir:

CREATE TABLE students
(
student_id SMALLINT PRIMARY KEY,
student_name VARCHAR(50) UNIQUE,	
student_age SMALLINT NOT NULL,
student_dob DATE,
CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 30),--0 VE 30 DAHİL
CONSTRAINT 	student_name CHECK(student_name = UPPER (student_name))
);

INSERT INTO students VALUES (101,'ALİ CAN',13,'NOW');
INSERT INTO students VALUES (102,'NİLAY CAN',13,'NOW');
INSERT INTO students VALUES (103,'NİLAY DORSA',14,'NOW');

--Integer değerler single quote(tek tırnak) ile veya yalın kullanılabilir

INSERT INTO students VALUES ('104','ŞABAN CAN',15,'NOW');

__sPESİFİK BİR SÜTUNA NASIL GİRİLİR

INSERT INTO students(student_id, student_age) VALUES(105,17);


--VAROLAN DATA NASIL DEĞİŞTİRİLİR:
UPDATE students
SET student_name = 'YUSUF HAKKI'
WHERE student_id = 105;


--NİLAY CAN İSMİNİ DEĞİŞTİR
UPDATE students
SET student_name = 'GÜLLÜ ŞAH'
WHERE student_id=102;




SELECT * FROM students;











