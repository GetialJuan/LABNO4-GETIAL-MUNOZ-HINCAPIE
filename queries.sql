-- ingresamos a la bd
\c oficinaregistro

-- (a) dept y title de los instructores
SELECT dept,title FROM instructor;

-- (b) nombre y programa del student_id 7656
SELECT name,program FROM student WHERE student_id=7656;

-- (c) nombres de los estudiantes matriculados en el course_id = 837873
SELECT name FROM student,enrols 
WHERE student.student_id = enrols.student_id AND enrols.course_id = 837873;

-- (d) vista con los estudaintes con nostas mas altas por cada semestre 
--      entre 1900 y 2018
--CREATE VIEW better_students AS
SELECT semester, MAX(grade) AS max_nota 
FROM enrols group by semester;