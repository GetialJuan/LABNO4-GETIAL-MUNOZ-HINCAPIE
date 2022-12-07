----##ESTO DEBE QUITARSE A LA HORA DE LA ENTREGA
-- Create DataBase
CREATE DATABASE oficinaregistro
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    TEMPLATE template0;

-- Conecct to oficinaregistro db
\c oficinaregistro
----##ESTO DEBE QUITARSE A LA HORA DE LA ENTREGA

-- (a) Serial que empieza en 7488 y aumenta en 168 
CREATE SEQUENCE seq_students
INCREMENT 168
START 7488;

-- Table student
CREATE TABLE student (
    student_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_students'),
    name VARCHAR(100) NOT NULL,
    program VARCHAR(100) NOT NULL
);

-- Table instructor
CREATE TABLE instructor (
    instructor_id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dept VARCHAR(100) NOT NULL,
    title VARCHAR(100) NOT NULL
);

-- (B) Serial que empieza en 837827 y aumenta en 23 
CREATE SEQUENCE seq_course
INCREMENT 23
START 837827;

-- Table course
CREATE TABLE course (
    course_id INTEGER PRIMARY KEY DEFAULT NEXTVAL('seq_course'),
    title VARCHAR(100) NOT NULL,
    syllabus VARCHAR(100) NOT NULL,
    credits INTEGER NOT NULL
);

-- Table course_offering
CREATE TABLE course_offering (
    course_id INTEGER,
    sec_id INTEGER,
    year INTEGER,
    semester INTEGER,
    time INTEGER NOT NULL,
    classroom INTEGER NOT NULL,
    PRIMARY KEY(course_id, sec_id, year, semester),
    CONSTRAINT Pk_course_course_offering
        FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- (c) gradeType
CREATE DOMAIN grade_type AS NUMERIC(3,2)
    CHECK(VALUE > 1.00 AND VALUE < 5.00);

-- Table enrols
CREATE TABLE enrols (
    student_id INTEGER,
    course_id INTEGER,
    sec_id INTEGER,
    semester INTEGER,
    year INTEGER,
    grade grade_type,
    PRIMARY KEY(student_id, course_id, sec_id, semester, year)
);

-- Table teaches
CREATE TABLE teaches (
    course_id INTEGER,
    sec_id INTEGER,
    semester INTEGER,
    year INTEGER,
    instructor_id INTEGER,
    PRIMARY KEY(course_id, sec_id, semester, year, instructor_id),
    CONSTRAINT pk_course_teaches
        FOREIGN KEY (course_id) REFERENCES course(course_id),
    CONSTRAINT pk_instructor_teaches
        FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id)
);

-- Table requires
CREATE TABLE requires (
    main_course INTEGER,
    prerequisite INTEGER,
    PRIMARY KEY(main_course, prerequisite),
    CONSTRAINT pk_courseM_requires
        FOREIGN KEY (main_course) REFERENCES course(course_id),
    CONSTRAINT pk_courseP_requires
        FOREIGN KEY (prerequisite) REFERENCES course(course_id)
);