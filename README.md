# Gestión de Cursos - Base de Datos

## Descripción
Este proyecto consiste en la creación de una base de datos para gestionar información sobre cursos, estudiantes, profesores y matrículas.
Las tablas están relacionadas entre sí mediante claves foráneas.

## Estructura de la Base de Datos

### Tablas

- **Personas**
  - `id serial`
  - `nombre text`
  - `apellido text`
  - `email text`
  - `telefono text`
  - `direccion text`

- **Alumnos**
  - `id serial`
  - `persona_id references Personas(id)`
  - `matricula text`
  - `fecha_inscripcion date`

- **Profesores**
  - `id serial`
  - `persona_id references Personas(id)`
  - `departamento text`
  - `fecha_contratacion date`

- **Cursos**
  - `id serial`
  - `nombre text`
  - `descripcion text`
  - `creditos integer`

- **Inscripciones**
  - `id serial`
  - `alumno_id references Alumnos(id)`
  - `curso_id references Cursos(id)`
  - `fecha_inscripcion date`

- **Asignaciones**
  - `id serial`
  - `profesor_id references Profesores(id)`
  - `curso_id references Cursos(id)`
  - `semestre text`

## Vistas

1. **Vista de Alumnos Inscritos en Cada Curso**
   - Muestra los alumnos inscritos en cada curso.

2. **Vista de Profesores Agrupados por Departamento**
   - Agrupa a los profesores según su departamento.

## Procedimientos

1. **Número de Alumnos por Curso**
   - Función que devuelve el número de alumnos inscritos en un curso específico.

2. **Duración del Contrato de un Profesor**
   - Función que calcula el número de años que un profesor ha estado contratado.

## Uso
Para crear las tablas y funciones, ejecuta los scripts SQL en pgAdmin. Asegúrate de estar conectado a la base de datos correcta.
