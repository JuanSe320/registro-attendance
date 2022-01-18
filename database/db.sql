CREATE DATABASE attendance

CREATE TABLE sedes(
    id_sede VARCHAR(4) UNIQUE PRIMARY KEY NOT NULL,
    nombre_sede VARCHAR(75) NOT NULL,
    ubicacion VARCHAR(255) NOT NULL
);

CREATE TABLE cuentas(
    id_cuenta VARCHAR(4) UNIQUE PRIMARY KEY NOT NULL,
    usuario VARCHAR(40) NOT NULL,
    password VARCHAR(18) NOT NULL,
    tipo_cuenta VARCHAR(13) NOT NULL,
    email VARCHAR(255) NOT NULL 
);

CREATE TABLE datos_trabajador(
    id_datos_trabajador VARCHAR(4) UNIQUE PRIMARY KEY NOT NULL,
    arl VARCHAR(70) NOT NULL,
    salario VARCHAR(255) NOT NULL 
);

CREATE TABLE profesores(
    id_profesor VARCHAR(4) UNIQUE PRIMARY KEY NOT NULL,
    identificacion VARCHAR(13) UNIQUE NOT NULL,
    FOREIGN KEY(identificacion) REFERENCES personas(identificacion),
    id_datos_trabajador VARCHAR(4) UNIQUE NOT NULL,
    FOREIGN KEY(id_datos_trabajador) REFERENCES datos_trabajador(id_datos_trabajador)
);

CREATE TABLE administradores(
    id_admin VARCHAR(4) UNIQUE PRIMARY KEY NOT NULL,
    identificacion VARCHAR(13) UNIQUE NOT NULL,
    FOREIGN KEY(identificacion) REFERENCES personas(identificacion),
    id_datos_trabajador VARCHAR(4) UNIQUE NOT NULL,
    FOREIGN KEY(id_datos_trabajador) REFERENCES datos_trabajador(id_datos_trabajador)
);

CREATE TABLE estudiantes(
    id_estudiante VARCHAR(4) UNIQUE PRIMARY KEY NOT NULL,
    identificacion VARCHAR(13) UNIQUE NOT NULL,
    FOREIGN KEY(identificacion) REFERENCES personas(identificacion),
    id_matricula VARCHAR(13) UNIQUE NOT NULL,
    FOREIGN KEY(id_matricula) REFERENCES matriculas(id_matricula)
);

CREATE TABLE asistencia(
    id_asistencia VARCHAR(255) UNIQUE PRIMARY KEY NOT NULL,
    identificacion VARCHAR(13) NOT NULL,
    FOREIGN KEY(identificacion) REFERENCES personas(identificacion),
    id_sede VARCHAR(4) NOT NULL,
    FOREIGN KEY(id_sede) REFERENCES sedes(id_sede),
    fecha_asistencia TIMESTAMP NOT NULL
);


CREATE TABLE matriculas(
    id_matricula VARCHAR(13) UNIQUE PRIMARY KEY NOT NULL,
    matricula_actual BOOLEAN NOT NULL,
    semestre VARCHAR(2) NOT NULL,
    fecha_matricula TIMESTAMP NOT NULL
);


CREATE TABLE personas(
    identificacion VARCHAR(13) UNIQUE PRIMARY KEY NOT NULL,
    nombre_1 VARCHAR(15) NOT NULL,
    nombre_2 VARCHAR(15),
    apellido_1 VARCHAR(15) NOT NULL,
    apellido_2 VARCHAR(15) NOT NULL,
    direccion VARCHAR(255),
    eps VARCHAR(55) NOT NULL,
    tipo_persona VARCHAR(13) NOT NULL,
    id_cuenta VARCHAR(4) UNIQUE NOT NULL,
    FOREIGN KEY(id_cuenta) REFERENCES cuentas(id_cuenta),
    id_sede VARCHAR(4) NOT NULL,
    FOREIGN KEY(id_sede) REFERENCES sedes(id_sede)
);

CREATE TABLE grupos(
    id_grupo VARCHAR(4) PRIMARY KEY NOT NULL,
    codigo_grupo VARCHAR(15) NOT NULL,
    id_estudiante VARCHAR(13) NOT NULL,
    FOREIGN KEY(id_estudiante) REFERENCES estudiantes(id_estudiante)
);
CREATE TABLE clases(
    id_clase VARCHAR(4) PRIMARY KEY NOT NULL,
    codigo_clase VARCHAR(15) NOT NULL,
    id_curso VARCHAR(4) NOT NULL,
    FOREIGN KEY(id_curso) REFERENCES cursos(id_curso),
    id_grupo VARCHAR(4) NOT NULL,
    FOREIGN KEY(id_grupo) REFERENCES grupos(id_grupo)
);
CREATE TABLE cursos(
    id_curso VARCHAR(4) UNIQUE PRIMARY KEY NOT NULL,
    codigo_curso VARCHAR(4) NOT NULL, 
    nombre_curso VARCHAR(70) NOT NULL,
    id_profesor VARCHAR(4) NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesores(id_profesor),
    horario_curso VARCHAR(150) NOT NULL,
    max_alumnos VARCHAR(2) NOT NULL,
    id_asignaturas VARCHAR(4) NOT NULL,
    FOREIGN KEY(id_asignaturas) REFERENCES asignaturas(id_asignaturas)
);

CREATE TABLE asignaturas(
    id_asignaturas VARCHAR(4) UNIQUE PRIMARY KEY NOT NULL,
    nombre_asignatura VARCHAR(70) NOT NULL,
);


INSERT INTO asignaturas(id_asignaturas,nombre_asignatura) VALUES ('0004','Bases de datos')
INSERT INTO matriculas(id_asignaturas,nombre_asignatura) VALUES ('0004','Bases de datos')
INSERT INTO personas(identificacion,nombre_1,nombre_2,apellido_1,apellido_2,direccion,eps,tipo_persona,id_cuenta,id_sede) VALUES ('1334256789','Ramiro','Alvares','Marmolejo','Casas','Calle Abril Montero 6 Casa 8','SantaCura','profesor','0002','0001')
INSERT INTO matriculas(id_matricula,matricula_actual,semestre,fecha_matricula) VALUES ('0000000000004','true',1,'1999-07-6 15:50:15')
INSERT INTO estudiantes(id_estudiante,identificacion,id_matricula) VALUES ('0003','1254367823','0000000000004')
SELECT * FROM sedes
SELECT * FROM asignaturas
SELECT * FROM cuentas
SELECT * FROM personas
SELECT * FROM matriculas
SELECT * FROM estudiantes
UPDATE sedes SET ubicacion = 'Calle Irene 9 Nro 21' WHERE id_sede = '0001'












