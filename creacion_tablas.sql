-- Crear una base de datos que gestione información sobre:
-- cursos, estudiantes, profesores y matrículas.
-- Las tablas estarán relacionadas entre sí mediante claves foráneas.

BEGIN;


CREATE TABLE IF NOT EXISTS public.personas
(
    id serial NOT NULL,
    nombre "char" NOT NULL,
    apellido "char" NOT NULL,
    email "char",
    telefono "char",
    direccion "char",
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.alumnos
(
    id serial NOT NULL,
    persona_id integer,
    matricula text,
    fecha_inscripcion date,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.profesores
(
    id serial NOT NULL,
    persona_id integer,
    departamento text,
    fecha_contratacion date,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.cursos
(
    id serial,
    nombre text,
    descripcion text,
    creditos integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.inscripciones
(
    id serial,
    alumno_id integer,
    curso_id integer,
    fecha_inscripcion date,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.asignaciones
(
    id serial,
    profesor_id integer,
    curso_id integer,
    semestre text,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.alumnos
    ADD FOREIGN KEY (persona_id)
    REFERENCES public.personas (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.profesores
    ADD FOREIGN KEY (persona_id)
    REFERENCES public.personas (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.inscripciones
    ADD FOREIGN KEY (alumno_id)
    REFERENCES public.alumnos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.inscripciones
    ADD FOREIGN KEY (curso_id)
    REFERENCES public.cursos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.asignaciones
    ADD FOREIGN KEY (profesor_id)
    REFERENCES public.profesores (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.asignaciones
    ADD FOREIGN KEY (curso_id)
    REFERENCES public.cursos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;