-- Accedemos a la db
\c oficinaregistro

-- insertar valores a student
INSERT INTO student (name, program)
VALUES
  ('Oleg Lara',3762),
  ('Hoyt Wong',3805),
  ('Palmer Henson',3960),
  ('Gavin Trevino',3975),
  ('Hedy Benton',3919);

-- insertar valores a instructor
INSERT INTO instructor (instructor_id,name,dept,title)
VALUES
  (1,'Jasper Shelton','611737','Mollis Lectus Corp.'),
  (2,'Eric Bean','56-88','Tempus Risus Corporation'),
  (3,'Quemby Moore','15924','Scelerisque Dui Suspendisse Corp.'),
  (4,'Nadine Moses','1151-8037','Aenean Massa Foundation'),
  (5,'Dominic Buchanan','652243','Non Industries');

-- insertar valores a course
INSERT INTO course (title,syllabus,credits)
VALUES
  ('curso1','ed',1),
  ('curso2','poo',4),
  ('curso3','bd',5),
  ('curso4','pf',4),
  ('curso5','poe',3);

-- insertar valores course_offering
INSERT INTO course_offering (course_id,sec_id,year,semester,time,classroom)
VALUES
  (837827,2586,2016,6,'7:15 AM','salon4'),
  (837850,2693,2014,2,'1:38 AM','salon3'),
  (837873,6047,2014,1,'8:22 AM','salon2'),
  (837827,3653,2013,5,'3:14 AM','salon3'),
  (837850,2664,2007,7,'9:30 PM','salon3');

-- insertar valores enrols
INSERT INTO enrols (student_id,course_id,sec_id,semester,year,grade)
VALUES
  (7488,837827,3911,6,2004,2.00),
  (7656,837850,2392,9,2000,4.50),
  (7824,837873,5223,6,2003,3.50),
  (7488,837827,6558,4,2003,1.50),
  (7656,837850,2158,4,2006,2.50);

-- insertar valores teaches
INSERT INTO teaches (course_id,sec_id,semester,year,instructor_id)
VALUES
  (837827,3911,6,2004,1),
  (837850,2392,9,2000,2),
  (837873,5223,6,2003,5),
  (837827,6558,4,2003,4),
  (837850,2158,4,2006,3);

-- insertar valores requires
INSERT INTO requires (main_course,prerequisite)
VALUES
  (837827,837850),
  (837850,837873),
  (837873,837896),
  (837896,837850),
  (837919,837896);