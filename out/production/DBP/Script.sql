DROP DATABASE IF EXISTS ijse;
CREATE DATABASE IF NOT EXISTS ijse;
SHOW DATABASES ;
USE ijse;

CREATE TABLE IF NOT EXISTS Student(
   student_id VARCHAR(45),
   student_name VARCHAR(45) NOT NULL DEFAULT 'Unknown',
   email TEXT,
   contact VARCHAR(20),
   address TEXT,
   nic VARCHAR(45),
   CONSTRAINT PRIMARY KEY (student_id)
);
SHOW TABLES ;
DESCRIBE Student;

CREATE TABLE IF NOT EXISTS Teacher(
   teacher_id VARCHAR(45),
   name VARCHAR(45) NOT NULL DEFAULT 'Unknown',
   nic VARCHAR(45),
   contact VARCHAR(40),
   address TEXT,
   CONSTRAINT PRIMARY KEY (teacher_id)
);
SHOW TABLES ;
DESCRIBE Teacher;


CREATE TABLE IF NOT EXISTS Subject(
   subject_id VARCHAR(45),
   subject_name VARCHAR(45) NOT NULL DEFAULT 'Unknown',
   credit DOUBLE DEFAULT 0.00,
   teacher_id VARCHAR(45),
   CONSTRAINT PRIMARY KEY (subject_id),
   CONSTRAINT FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) ON DELETE CASCADE ON UPDATE CASCADE
);
SHOW TABLES ;
DESCRIBE Subject;


CREATE TABLE IF NOT EXISTS Course(
   course_id VARCHAR(45),
   course_name VARCHAR(45) NOT NULL DEFAULT 'Unknown',
   cost DOUBLE DEFAULT 0.00,
   duration VARCHAR(45),
   subject_id VARCHAR(45),
   CONSTRAINT PRIMARY KEY (course_id),
   CONSTRAINT FOREIGN KEY (subject_id) REFERENCES Subject(subject_id) ON DELETE CASCADE ON UPDATE CASCADE
);
SHOW TABLES ;
DESCRIBE Course;

CREATE TABLE IF NOT EXISTS `intake`(
   intake_id VARCHAR(45),
   start_date DATE,
   intakecol VARCHAR(45),
   descriptionn VARCHAR(45),
   course_id VARCHAR(45),
   CONSTRAINT PRIMARY KEY (intake_id),
   CONSTRAINT FOREIGN KEY (course_id) REFERENCES Course(course_id) ON DELETE CASCADE ON UPDATE CASCADE
);
SHOW TABLES ;
DESCRIBE `intake`;


DROP TABLE IF EXISTS `Registration`;
CREATE TABLE IF NOT EXISTS `Registration`(
   registration_id VARCHAR(45),
   reg_date DATE,
   student_id VARCHAR(45),
   intake_id VARCHAR(45),
   CONSTRAINT PRIMARY KEY (registration_id),
   CONSTRAINT FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE
);
SHOW TABLES ;
DESCRIBE `Registration`;


CREATE TABLE IF NOT EXISTS Payment(
   payment_id VARCHAR(45),
   date DATE,
   cost DOUBLE DEFAULT 0.00,
   registration_id VARCHAR(45),
   CONSTRAINT PRIMARY KEY (payment_id),
   CONSTRAINT FOREIGN KEY (registration_id) REFERENCES `Registration`(registration_id) ON DELETE CASCADE ON UPDATE CASCADE
);
SHOW TABLES ;
DESCRIBE Payment;

INSERT INTO Student VALUES('S-001','Janith','Janith@gmail.com','077','Piliyandala','4474787V'),
('S-002','Kelum','kelum@gmail.com','07756','Kaluthara','4474787V'),
('S-003','Janidu','Janidu@gmail.com','077656','Pnadura','4474787V');

SELECT * FROM Student;

INSERT INTO Teacher VALUES('T-001','Saman','353535v','07734634','Piliyandala'),
('T-002','Kelum','56888v','0775776','Kaluthara'),
('T-003','Janidu','646465v','077654556','Pnadura');

SELECT * FROM Teacher;

INSERT INTO Subject VALUES('Sub-001','DBP','56','T-001'),
('Sub-002','DBMS','59','T-002'),
('Sub-003','AAD','64','T-003');

SELECT * FROM Subject;

INSERT INTO Course VALUES('C-001','DBMS',1,200,'3 months','Sub-002'),
('C-002','DBMS','5,560','2 months','Sub-002'),
('C-003','AAD','3,456',' 5 months','Sub-003');

SELECT * FROM Course;


INSERT INTO `intake` VALUES('I-001',2022-2-22, 'DDA',' schollership','C-001'),
('I-002',2020-2-12,'DBP','schollership','C-002'),
('I-003',2012-12-22,'DBA','schollership','C-003');

SELECT * FROM `intake`;


INSERT INTO `Registration` VALUES('R-001',2022-2-22, 'S-001','I-001'),
('R-002',2012-2-24, 'S-002','I-001'),
('R-003',2020-2-02, 'S-001','I-001');

SELECT * FROM `Registration`;

INSERT INTO Payment VALUES('P-001',2022-2-22, 20,000,' schollership','R-001'),
('P-002',2020-2-12,'DBP',34,000,'R-002'),
('P-003',2012-12-22,'DBA',12,000,'R-003');

SELECT * FROM Payment;




