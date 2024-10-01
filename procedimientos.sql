-- Función para Obtener el Número de Alumnos por Curso
-- Devuelve el número de alumnos inscritos en un curso específico.

CREATE FUNCTION numero_alumnos_por_curso(curso_id INT) RETURNS INT AS
$$
SELECT COUNT(*)
FROM Inscripciones
WHERE curso_id = curso_id;
$$ LANGUAGE sql;

-- Función para Calcular la Duración del Contrato de un Profesor

-- Calcula el número de años que un profesor ha estado contratado.

CREATE FUNCTION duracion_contrato_profesor(profesor_id INT) RETURNS INT AS
$$
SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_contratacion))
FROM Profesores
WHERE id = profesor_id;
$$ LANGUAGE sql;
