-- Una vista que muestra los alumnos inscritos en cada curso.

CREATE VIEW vista_alumnos_por_curso AS
SELECT c.nombre AS curso, a.matricula, p.nombre, p.apellido
FROM Cursos c
JOIN Inscripciones i ON c.id = i.curso_id
JOIN Alumnos a ON i.alumno_id = a.id
JOIN Personas p ON a.persona_id = p.id;

-- Una vista que muestre los profesores agrupados por departamento.

CREATE VIEW vista_profesores_por_departamento AS
SELECT p.departamento, COUNT(*) AS total_profesores
FROM Profesores p
JOIN Personas pe ON p.persona_id = pe.id
GROUP BY p.departamento;
