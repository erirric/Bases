CREATE TABLE "SGM_P_Pais" (
  "id_pais" int PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "SGM_P_Division_Politica" (
  "id_division" int PRIMARY KEY,
  "nombre" varchar,
  "id_pais" int
);

CREATE TABLE "SGM_P_Ciudad" (
  "id_ciudad" int PRIMARY KEY,
  "nombre" varchar,
  "id_division" int
);

CREATE TABLE "SGM_P_Campo_Estudio" (
  "id_campo" int PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "SGM_M_Carrera" (
  "id_carrera" int PRIMARY KEY,
  "nombre" varchar,
  "modalidad" varchar,
  "descripcion" varchar,
  "estado" varchar,
  "semestres" varchar,
  "id_campo" int
);

CREATE TABLE "SGM_P_Modalidad" (
  "id_modalidad" int PRIMARY KEY,
  "nombre" varchar,
  "descripcion" text
);

CREATE TABLE "SGM_P_Carrera_Modalidad" (
  "id_modalidad_carrera" int PRIMARY KEY,
  "id_carrera" int,
  "id_modalidad" int
);

CREATE TABLE "SGM_M_Estudiante" (
  "id_estudiante" int PRIMARY KEY,
  "nombre" varchar,
  "apellido" varchar,
  "cedula" varchar,
  "fecha_nacimiento" date,
  "genero" varchar,
  "celular" varchar,
  "correo" varchar,
  "id_ciudad" int,
  "direccion" varchar
);

CREATE TABLE "SGM_P_Periodo_Academico" (
  "id_periodo" int PRIMARY KEY,
  "nombre" varchar,
  "fecha_inicio" date,
  "fecha_fin" date,
  "inicio_matricula" date,
  "fin_matricula" date
);

CREATE TABLE "SGM_P_Estado_Matricula" (
  "id_estado" int PRIMARY KEY,
  "descripcion" varchar
);

CREATE TABLE "SGM_T_Matricula" (
  "id_matricula" int PRIMARY KEY,
  "id_estudiante" int,
  "id_modalidad_carrera" int,
  "id_periodo" int,
  "id_estado" int,
  "fecha_matricula" date
);

CREATE TABLE "SGM_P_Metodo_Pago" (
  "id_metodo" int PRIMARY KEY,
  "descripcion" varchar
);

CREATE TABLE "SGM_T_Pago" (
  "id_pago" int PRIMARY KEY,
  "id_matricula" int,
  "fecha_pago" date,
  "monto" decimal,
  "id_metodo" int,
  "estado" varchar
);

CREATE TABLE "SGM_P_Tipo_Evaluacion" (
  "id_tipo_evaluacion" int PRIMARY KEY,
  "nombre" varchar,
  "descripcion" text
);

CREATE TABLE "SGM_P_Jornada" (
  "id_jornada" int PRIMARY KEY,
  "nombre" varchar
);

CREATE TABLE "SGM_P_Paralelo" (
  "id_paralelo" int PRIMARY KEY,
  "nombre" varchar,
  "id_jornada" int
);

CREATE TABLE "SGM_P_Tipo_Asignatura" (
  "id_tipo_asignatura" int PRIMARY KEY,
  "descripcion" varchar
);

CREATE TABLE "SGM_P_Asignatura" (
  "id_asignatura" int PRIMARY KEY,
  "nombre" varchar,
  "horas_semanales" int,
  "creditos" int,
  "nivel" varchar,
  "id_tipo" int,
  "id_asignatura_aprobada" int
);

CREATE TABLE "SGM_P_Tipo_Aula" (
  "id_tipo_aula" int PRIMARY KEY,
  "descripcion" varchar
);

CREATE TABLE "SGM_P_Edificio" (
  "id_edificio" int PRIMARY KEY,
  "nombre" varchar,
  "descripcion" varchar,
  "ubicacion" text
);

CREATE TABLE "SGM_M_Aula" (
  "id_aula" int PRIMARY KEY,
  "capacidad" int,
  "numero_aula" varchar,
  "id_tipo_aula" int,
  "id_edificio" int
);

CREATE TABLE "SGM_M_Horario" (
  "id_horario" int PRIMARY KEY,
  "hora_inicio" time,
  "hora_fin" time,
  "dia" varchar,
  "id_turno" int
);

CREATE TABLE "SGM_P_Turno" (
  "id_turno" int PRIMARY KEY,
  "nombre" varchar,
  "hora_inicio" time,
  "hora_fin" time
);

CREATE TABLE "SGM_M_Docente" (
  "id_docente" int PRIMARY KEY,
  "nombre" varchar,
  "correo" varchar,
  "celular" varchar,
  "id_titulo" int,
  "id_ciudad" int,
  "fecha_ingreso" date,
  "direccion" varchar
);

CREATE TABLE "SGM_P_Titulo" (
  "id_titulo" int PRIMARY KEY,
  "descropcion" varchar
);

CREATE TABLE "SGM_T_Curso_Horario" (
  "id_curso_horario" int PRIMARY KEY,
  "id_oferta" int,
  "id_horario" int,
  "id_aula" int
);

CREATE TABLE "SGM_T_Oferta_Curso_Periodo" (
  "id_oferta" int PRIMARY KEY,
  "id_curso" int,
  "id_periodo" int,
  "id_docente" int,
  "id_paralelo" int,
  "cupos_max" int,
  "estado" varchar
);

CREATE TABLE "SGM_M_Detalle_Matricula" (
  "id_detalle_matricula" int PRIMARY KEY,
  "id_matricula" int,
  "id_oferta" int
);

CREATE TABLE "SGM_P_Calificacion" (
  "id_calificacion" int PRIMARY KEY,
  "id_oferta" int,
  "id_tipo_evaluacion" int,
  "nota" decimal,
  "fecha" date
);

CREATE TABLE "SGM_M_Curso" (
  "id_curso" int PRIMARY KEY,
  "nombre" varchar,
  "id_asignatura" int,
  "descripcion" text
);

ALTER TABLE "SGM_P_Division_Politica" ADD FOREIGN KEY ("id_pais") REFERENCES "SGM_P_Pais" ("id_pais");

ALTER TABLE "SGM_P_Ciudad" ADD FOREIGN KEY ("id_division") REFERENCES "SGM_P_Division_Politica" ("id_division");

ALTER TABLE "SGM_M_Estudiante" ADD FOREIGN KEY ("id_ciudad") REFERENCES "SGM_P_Ciudad" ("id_ciudad");

ALTER TABLE "SGM_M_Carrera" ADD FOREIGN KEY ("id_campo") REFERENCES "SGM_P_Campo_Estudio" ("id_campo");

ALTER TABLE "SGM_M_Docente" ADD FOREIGN KEY ("id_ciudad") REFERENCES "SGM_P_Ciudad" ("id_ciudad");

ALTER TABLE "SGM_M_Docente" ADD FOREIGN KEY ("id_titulo") REFERENCES "SGM_P_Titulo" ("id_titulo");

ALTER TABLE "SGM_T_Matricula" ADD FOREIGN KEY ("id_estudiante") REFERENCES "SGM_M_Estudiante" ("id_estudiante");

ALTER TABLE "SGM_T_Matricula" ADD FOREIGN KEY ("id_modalidad_carrera") REFERENCES "SGM_P_Carrera_Modalidad" ("id_modalidad_carrera");

ALTER TABLE "SGM_T_Matricula" ADD FOREIGN KEY ("id_periodo") REFERENCES "SGM_P_Periodo_Academico" ("id_periodo");

ALTER TABLE "SGM_T_Matricula" ADD FOREIGN KEY ("id_estado") REFERENCES "SGM_P_Estado_Matricula" ("id_estado");

ALTER TABLE "SGM_T_Pago" ADD FOREIGN KEY ("id_matricula") REFERENCES "SGM_T_Matricula" ("id_matricula");

ALTER TABLE "SGM_T_Pago" ADD FOREIGN KEY ("id_metodo") REFERENCES "SGM_P_Metodo_Pago" ("id_metodo");

ALTER TABLE "SGM_P_Asignatura" ADD FOREIGN KEY ("id_tipo") REFERENCES "SGM_P_Tipo_Asignatura" ("id_tipo_asignatura");

ALTER TABLE "SGM_P_Asignatura" ADD FOREIGN KEY ("id_asignatura") REFERENCES "SGM_P_Asignatura" ("id_asignatura_aprobada");

ALTER TABLE "SGM_P_Paralelo" ADD FOREIGN KEY ("id_jornada") REFERENCES "SGM_P_Jornada" ("id_jornada");

ALTER TABLE "SGM_M_Aula" ADD FOREIGN KEY ("id_tipo_aula") REFERENCES "SGM_P_Tipo_Aula" ("id_tipo_aula");

ALTER TABLE "SGM_M_Aula" ADD FOREIGN KEY ("id_edificio") REFERENCES "SGM_P_Edificio" ("id_edificio");

ALTER TABLE "SGM_M_Horario" ADD FOREIGN KEY ("id_turno") REFERENCES "SGM_P_Turno" ("id_turno");

ALTER TABLE "SGM_P_Carrera_Modalidad" ADD FOREIGN KEY ("id_carrera") REFERENCES "SGM_M_Carrera" ("id_carrera");

ALTER TABLE "SGM_P_Carrera_Modalidad" ADD FOREIGN KEY ("id_modalidad") REFERENCES "SGM_P_Modalidad" ("id_modalidad");

ALTER TABLE "SGM_T_Curso_Horario" ADD FOREIGN KEY ("id_oferta") REFERENCES "SGM_T_Oferta_Curso_Periodo" ("id_oferta");

ALTER TABLE "SGM_T_Curso_Horario" ADD FOREIGN KEY ("id_horario") REFERENCES "SGM_M_Horario" ("id_horario");

ALTER TABLE "SGM_T_Curso_Horario" ADD FOREIGN KEY ("id_aula") REFERENCES "SGM_M_Aula" ("id_aula");

ALTER TABLE "SGM_M_Detalle_Matricula" ADD FOREIGN KEY ("id_matricula") REFERENCES "SGM_T_Matricula" ("id_matricula");

ALTER TABLE "SGM_M_Detalle_Matricula" ADD FOREIGN KEY ("id_oferta") REFERENCES "SGM_T_Oferta_Curso_Periodo" ("id_oferta");

ALTER TABLE "SGM_P_Calificacion" ADD FOREIGN KEY ("id_oferta") REFERENCES "SGM_T_Oferta_Curso_Periodo" ("id_oferta");

ALTER TABLE "SGM_P_Calificacion" ADD FOREIGN KEY ("id_tipo_evaluacion") REFERENCES "SGM_P_Tipo_Evaluacion" ("id_tipo_evaluacion");

ALTER TABLE "SGM_T_Oferta_Curso_Periodo" ADD FOREIGN KEY ("id_docente") REFERENCES "SGM_M_Docente" ("id_docente");

ALTER TABLE "SGM_T_Oferta_Curso_Periodo" ADD FOREIGN KEY ("id_paralelo") REFERENCES "SGM_P_Paralelo" ("id_paralelo");

ALTER TABLE "SGM_T_Oferta_Curso_Periodo" ADD FOREIGN KEY ("id_periodo") REFERENCES "SGM_P_Periodo_Academico" ("id_periodo");

ALTER TABLE "SGM_M_Curso" ADD FOREIGN KEY ("id_asignatura") REFERENCES "SGM_P_Asignatura" ("id_asignatura");

ALTER TABLE "SGM_T_Oferta_Curso_Periodo" ADD FOREIGN KEY ("id_curso") REFERENCES "SGM_M_Curso" ("id_curso");
