-- Eliminar procedimiento (Ejercicio 4.b)
DROP PROCEDURE create_teaches;

-- Elimina Trigger (Ejercicio 4.a.ii)
DROP TRIGGER alter_grade_enrols ON enrols;
-- Elimina funcion del trigger alter_grade_enrols
DROP FUNCTION alter_grade_enrols_function;

-- Elimina Trigger (Ejercicio 4.a.i)
DROP TRIGGER valor_incorecto_enrols_grade ON enrols;
-- Elimina funcion del trigger valor_incorecto_enrols_grade
DROP FUNCTION exception_enrols_grade;

--Eliminacion de Tablas (considerar que tablas depende de otras)
DROP TABLE requires;
DROP TABLE teaches;
DROP TABLE enrols;
DROP TABLE course_offering;
DROP TABLE course;
DROP TABLE instructor;
DROP TABLE student;

--Eliminacion de secuencias
DROP SEQUENCE seq_students;
DROP SEQUENCE seq_course;

--Eliminar Base de datos
DROP DATABASE oficinaregistro;