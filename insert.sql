-- Accedemos a la db
\c oficinaregistro

-- insertar valores a student
INSERT INTO student (name, program)
VALUES
  ("Oleg Lara",3762),
  ("Hoyt Wong",3805),
  ("Palmer Henson",3960),
  ("Gavin Trevino",3975),
  ("Hedy Benton",3919);

-- insertar valores a instructor
INSERT INTO instructor (instructor_id,name,dept,constant)
VALUES
  (1,"Jasper Shelton","611737","Mollis Lectus Corp."),
  (2,"Eric Bean","56-88","Tempus Risus Corporation"),
  (3,"Quemby Moore","15924","Scelerisque Dui Suspendisse Corp."),
  (4,"Nadine Moses","1151-8037","Aenean Massa Foundation"),
  (5,"Dominic Buchanan","652243","Non Industries");

-- insertar valores a course
INSERT INTO course (title,syllabus,credits)
VALUES
  ("curso1","ed",1),
  ("curso2","poo",4),
  ("curso3","bd",5),
  ("curso4","pf",4),
  ("curso5","poe",3);