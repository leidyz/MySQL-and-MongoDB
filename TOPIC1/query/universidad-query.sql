-- 1. Returns a list with the first last name, second last name and first name of all the students. 
-- The list must be ordered alphabetically from lowest to highest by first last name, second last name and first name.
USE universidad; SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
-- 2. Find out the first and last names of students who have not registered their phone number in the database.
SELECT apellido1, apellido2 FROM persona WHERE (telefono IS NULL) AND (tipo = 'alumno');
-- 3. Returns the list of students who were born in 1999.
SELECT * FROM persona WHERE (fecha_nacimiento REGEXP '1999') AND (tipo = 'alumno');
-- 4. Returns the list of teachers who have not registered their phone number in the database and also their NIF ends in K.
SELECT * FROM persona WHERE (tipo = 'profesor') AND (telefono IS NULL) AND (nif REGEXP 'K$');
-- 5. Returns the list of subjects that are taught in the first semester, in the third year of the degree that has the identifier 7.
SELECT * FROM asignatura WHERE (cuatrimestre = '1') AND (id_grado = '7') AND (curso = '3');
-- 6. Returns a list of teachers along with the name of the department to which they are linked. 
-- The listing should return four columns, first last name, second last name, first name and department name. 
-- The result will be sorted alphabetically from lowest to highest by last name and first name.
SELECT p.apellido1, p.apellido2, p.nombre,d.nombre AS 'departamento' FROM persona p JOIN profesor prof ON p.id = prof.id_profesor JOIN departamento d ON prof.id_departamento = d.id ORDER BY apellido1, nombre ASC;
-- 7. Returns a list with the name of the subjects, start year and end year of the student's school year with NIF 26902806M.
SELECT a.nombre AS 'asignatura', ce.anyo_inicio, ce.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura asm ON p.id = asm.id_alumno JOIN curso_escolar ce ON ce.id = asm.id_curso_escolar JOIN asignatura a ON a.id = asm.id_asignatura WHERE nif REGEXP '26902806M';
-- 8. Returns a list with the name of all the departments that have professors who teach a subject in the Degree in Computer Engineering (Plan 2015).
SELECT DISTINCT d.nombre FROM grado g JOIN asignatura a ON g.id = a.id_grado JOIN profesor prof ON prof.id_profesor = a.id_profesor JOIN departamento d ON d.id = prof.id_departamento;
-- 9. Returns a list of all the students who have enrolled in a subject during the 2018/2019 school year.
SELECT DISTINCT p.nombre, p.apellido1, ce.anyo_inicio, ce.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura asm ON p.id = asm.id_alumno JOIN curso_escolar ce ON ce.id = asm.id_curso_escolar WHERE anyo_inicio = '2018' AND anyo_fin = '2019';

-- Solve the following 6 queries using the LEFT JOIN and RIGHT JOIN clauses.
-- 1. Returns a list with the names of all the professors and the departments they are linked to. 
-- The list must also show those professors who do not have any associated department. 
-- The listing must return four columns, department name, first last name, second last name and teacher's name. The result will be sorted alphabetically from lowest to highest by department name, last name and first name.
SELECT d.nombre AS 'Departamento', ppl.apellido1, ppl.apellido2, ppl.nombre FROM profesor p LEFT JOIN departamento d ON p.id_departamento = d.id LEFT JOIN persona ppl ON ppl.id = p.id_profesor ORDER BY COALESCE (d.nombre, ''), ppl.apellido1, ppl.nombre;
-- 2. Returns a list of professors who are not associated with a department.
SELECT * FROM profesor p LEFT JOIN departamento d ON p.id_departamento = d.id LEFT JOIN persona ppl ON ppl.id = p.id_profesor WHERE d.nombre IS NULL;
-- 3. Returns a list of departments that do not have associate professors.
SELECT d.nombre AS 'Departamento' FROM profesor p RIGHT JOIN departamento d ON p.id_departamento = d.id WHERE id_profesor IS NULL;
-- 4. Returns a list of teachers who do not teach any subjects.
SELECT * FROM profesor p LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor INNER JOIN persona ppl ON ppl.id = p.id_profesor WHERE a.nombre IS NULL;
-- 5. Returns a list of subjects that do not have an assigned teacher.
SELECT * FROM asignatura a LEFT JOIN profesor p ON a.id_profesor = p.id_profesor WHERE a.id_profesor IS NULL;
-- 6. Returns a list of all departments that have not taught subjects in any school year.
SELECT * FROM departamento d LEFT JOIN profesor p ON d.id = p.id_profesor LEFT JOIN asignatura a ON a.id_profesor = p.id_profesor LEFT JOIN alumno_se_matricula_asignatura asm ON asm.id_asignatura = a.id LEFT JOIN curso_escolar ce ON ce.id = asm.id_curso_escolar WHERE ce.id IS NULL;

-- Summary Queries:
-- 1. Returns the total number of students there.
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';
-- 2. Calculate how many students were born in 1999.
SELECT COUNT(*) FROM persona WHERE (tipo = 'alumno') AND (fecha_nacimiento REGEXP '1999'); 
-- 3. Calculate how many teachers there are in each department. 
-- The result should only show two columns, one with the name of the department and another with the number of teachers 
-- in that department. The result must only include the departments that have associate professors and must be 
-- ordered from highest to lowest by the number of professors.
SELECT d.nombre AS 'Departamento', COUNT(*) AS 'profesores' FROM departamento d INNER JOIN profesor p ON d.id = p.id_departamento GROUP BY id_departamento ORDER BY profesores DESC;
-- 4. Returns a list with all the departments and the number of professors in each of them. Keep in mind that there may be departments that do not have associate professors. These departments must also appear in the list.
SELECT d.nombre AS 'Departamento', IFNULL(COUNT(p.id_profesor), 0) AS 'profesores' FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY Departamento ORDER BY profesores DESC;
-- 5.Returns a list with the name of all the existing degrees in the database and the number of subjects each one has. 
-- Please note that there may be degrees that do not have associated subjects. These grades must also appear in the listing. 
-- The result must be ordered from highest to lowest by the number of subjects.
SELECT g.nombre AS 'Grado', IFNULL(COUNT(a.nombre), 0) AS 'asignaturas' FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY Grado ORDER BY asignaturas DESC;
-- 6.Returns a list with the name of all the existing degrees in the database and the number of subjects each has, 
-- of the degrees that have more than 40 associated subjects.
SELECT g.nombre AS 'Grado', IFNULL(COUNT(a.nombre), 0) AS 'asignaturas' FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY Grado HAVING COUNT(a.nombre) > 40;
-- 7. Returns a list showing the name of the degrees and the sum of the total number of credits for each subject type. 
-- The result must have three columns: name of the degree, type of subject and the sum of the credits of all subjects of that type.
SELECT g.nombre, a.tipo, SUM(a.creditos) AS 'Total_creditos' FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id, a.tipo;
-- 8. Returns a list showing how many students have enrolled in a subject in each of the school years. 
-- The result must show two columns, one column with the start year of the school year and another with the number of enrolled students.
SELECT ce.anyo_inicio, COUNT(asm.id_alumno) AS 'estudiantes_matriculados' FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura asm ON ce.id = asm.id_curso_escolar GROUP BY ce.anyo_inicio;
-- 9. Returns a list with the number of subjects taught by each teacher. 
-- The list must take into account those professors who do not teach any subjects. 
-- The result will show five columns: id, name, first last name, second last name and number of subjects. 
-- The result will be ordered from highest to lowest by the number of subjects.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, IFNULL(COUNT(a.nombre), 0) AS 'asignaturas' FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor GROUP BY p.id ORDER BY asignaturas DESC;
-- 10. Returns all data for the youngest student.
SELECT * FROM persona p JOIN alumno_se_matricula_asignatura asm ON p.id = asm.id_alumno JOIN curso_escolar ce ON ce.id = asm.id_curso_escolar JOIN asignatura a ON a.id = asm.id_asignatura JOIN grado g ON g.id = a.id_grado WHERE p.tipo = 'alumno' ORDER BY p.fecha_nacimiento DESC LIMIT 1;
-- 11. Returns a list of professors who have an associated department and who do not teach any subjects.
SELECT p.id, p.nombre, prof.id_departamento, a.nombre AS 'asignatura' FROM persona p JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor WHERE a.nombre IS NULL;
