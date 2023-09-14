-- 1. Returns a list with the first last name, second last name and first name of all the students. 
-- The list must be ordered alphabetically from lowest to highest by first last name, second last name and first name.
USE universidad; SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- 2. Find out the first and last names of students who have not registered their phone number in the database.
USE universidad; SELECT apellido1, apellido2 FROM persona WHERE (telefono IS NULL) AND (tipo = 'alumno');
-- 3. Returns the list of students who were born in 1999.
USE universidad; SELECT * FROM persona WHERE fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
USE universidad; SELECT * FROM persona WHERE fecha_nacimiento REGEXP '1999';
-- 4. Returns the list of teachers who have not registered their phone number in the database and also their NIF ends in K.

-- 5. Returns the list of subjects that are taught in the first semester, in the third year of the degree that has the identifier 7.
-- 6. Returns a list of teachers along with the name of the department to which they are linked. The listing should return four columns, first last name, second last name, first name and department name. The result will be sorted alphabetically from lowest to highest by last name and first name.
-- 7. Returns a list with the name of the subjects, start year and end year of the student's school year with NIF 26902806M.
-- 8. Returns a list with the name of all the departments that have professors who teach a subject in the Degree in Computer Engineering (Plan 2015).
-- 9. Returns a list of all the students who have enrolled in a subject during the 2018/2019 school year.