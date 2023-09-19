-- 1. Returns a list with the first last name, second last name and first name of all the students. 
-- The list must be ordered alphabetically from lowest to highest by first last name, second last name and first name.
USE universidad; SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- 2. Find out the first and last names of students who have not registered their phone number in the database.
USE universidad; SELECT apellido1, apellido2 FROM persona WHERE (telefono IS NULL) AND (tipo = 'alumno');
-- 3. Returns the list of students who were born in 1999.
USE universidad; SELECT * FROM persona WHERE (fecha_nacimiento REGEXP '1999') AND (tipo = 'alumno');
-- 4. Returns the list of teachers who have not registered their phone number in the database and also their NIF ends in K.
USE universidad; SELECT * FROM persona WHERE (tipo = 'profesor') AND (telefono IS NULL) AND (nif REGEXP 'K$');
-- 5. Returns the list of subjects that are taught in the first semester, in the third year of the degree that has the identifier 7.
USE universidad; SELECT * FROM asignatura WHERE (cuatrimestre = '1') AND (id_grado = '7') AND (curso = '3');
-- 6. Returns a list of teachers along with the name of the department to which they are linked. 
-- The listing should return four columns, first last name, second last name, first name and department name. 
-- The result will be sorted alphabetically from lowest to highest by last name and first name.
USE universidad; SELECT p.apellido1, p.apellido2, p.nombre,d.nombre AS 'departamento' FROM persona p JOIN profesor prof ON p.id = prof.id_profesor JOIN departamento d ON prof.id_departamento = d.id ORDER BY apellido1, nombre ASC;
-- 7. Returns a list with the name of the subjects, start year and end year of the student's school year with NIF 26902806M.
USE universidad; SELECT a.nombre AS 'asignatura', ce.anyo_inicio, ce.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura asm ON p.id = asm.id_alumno JOIN curso_escolar ce ON ce.id = asm.id_curso_escolar JOIN asignatura a ON a.id = asm.id_asignatura WHERE nif REGEXP '26902806M';
-- 8. Returns a list with the name of all the departments that have professors who teach a subject in the Degree in Computer Engineering (Plan 2015).
USE universidad; SELECT DISTINCT d.nombre FROM grado g JOIN asignatura a ON g.id = a.id_grado JOIN profesor prof ON prof.id_profesor = a.id_profesor JOIN departamento d ON d.id = prof.id_departamento;
-- 9. Returns a list of all the students who have enrolled in a subject during the 2018/2019 school year.
USE universidad; SELECT DISTINCT p.nombre, p.apellido1, ce.anyo_inicio, ce.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura asm ON p.id = asm.id_alumno JOIN curso_escolar ce ON ce.id = asm.id_curso_escolar WHERE anyo_inicio = '2018' AND anyo_fin = '2019';

-- Solve the following 6 queries using the LEFT JOIN and RIGHT JOIN clauses.
-- 10. Returns a list with the names of all the professors and the departments they are linked to. 
-- The list must also show those professors who do not have any associated department. 
-- The listing must return four columns, department name, first last name, second last name and teacher's name. The result will be sorted alphabetically from lowest to highest by department name, last name and first name.
USE universidad; SELECT d.nombre AS 'Departamento', ppl.apellido1, ppl.apellido2, ppl.nombre FROM profesor p LEFT JOIN departamento d ON p.id_departamento = d.id INNER JOIN persona ppl ON ppl.id = p.id_profesor ORDER BY d.nombre ASC, ppl.apellido1 ASC, ppl.nombre ASC;
-- 11. Returns a list of professors who are not associated with a department.
USE universidad; SELECT * FROM profesor p LEFT JOIN departamento d ON p.id_departamento = d.id INNER JOIN persona ppl ON ppl.id = p.id_profesor WHERE d.nombre IS NULL;
-- 12. Returns a list of departments that do not have associate professors.
USE universidad; SELECT d.nombre AS 'Departamento' FROM profesor p RIGHT JOIN departamento d ON p.id_departamento = d.id WHERE id_profesor IS NULL;
-- 13. Returns a list of teachers who do not teach any subjects.
USE universidad; SELECT * FROM profesor p LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor INNER JOIN persona ppl ON ppl.id = p.id_profesor WHERE a.nombre IS NULL;
-- 14. Returns a list of subjects that do not have an assigned teacher.
USE universidad; SELECT * FROM asignatura a LEFT JOIN profesor p ON a.id_profesor = p.id_profesor WHERE a.id_profesor IS NULL;
-- 15. Returns a list of all departments that have not taught subjects in any school year.
USE universidad; SELECT * FROM departamento d LEFT JOIN profesor p ON d.id = p.id_profesor LEFT JOIN asignatura a ON a.id_profesor = p.id_profesor LEFT JOIN alumno_se_matricula_asignatura asm ON asm.id_asignatura = a.id LEFT JOIN curso_escolar ce ON ce.id = asm.id_curso_escolar WHERE ce.id IS NULL;

-- Summary Queries:
-- 16. Returns the total number of students there.
USE universidad; SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';
-- 17. Calculate how many students were born in 1999.
USE universidad; SELECT COUNT(*) FROM persona WHERE (tipo = 'alumno') AND (fecha_nacimiento REGEXP '1999'); 
-- 18. Calculate how many teachers there are in each department. 
-- The result should only show two columns, one with the name of the department and another with the number of teachers 
-- in that department. The result must only include the departments that have associate professors and must be 
-- ordered from highest to lowest by the number of professors.
USE universidad; SELECT d.nombre AS 'Departamento', COUNT(*) AS 'profesores' FROM departamento d INNER JOIN profesor p ON d.id = p.id_departamento GROUP BY id_departamento ORDER BY profesores DESC;
-- 19. Returns a list with all the departments and the number of professors in each of them. Keep in mind that there may be departments that do not have associate professors. These departments must also appear in the list.
USE universidad; SELECT d.nombre AS 'Departamento', COUNT(*) AS 'profesores' FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY Departamento ORDER BY profesores DESC;
-- 20. Returns all data for the youngest student.
USE universidad; SELECT * FROM persona p JOIN alumno_se_matricula_asignatura asm ON p.id = asm.id_alumno JOIN curso_escolar ce ON ce.id = asm.id_curso_escolar JOIN asignatura a ON a.id = asm.id_asignatura JOIN grado g ON g.id = a.id_grado WHERE p.tipo = 'alumno' ORDER BY p.fecha_nacimiento DESC LIMIT 1;



