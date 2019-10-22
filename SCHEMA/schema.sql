drop database appventacurso;
-- ============================================
-- Crear base de datos
-- ============================================
CREATE DATABASE IF NOT EXISTS appVentaCurso
DEFAULT CHARACTER SET utf8;

-- Poner en uso la base de daros
USE appVentaCurso;

-- ============================================
-- Crear tablas con sus respectivos campos
-- ============================================
-- Tabla PERSONA
-- --------------------------------------------
CREATE OR REPLACE TABLE PERSONA (
   DNIPER char(8) NOT NULL COMMENT 'Número de DNI (Documento Nacional de Identificación)',
   NOMPER varchar(50) NULL COMMENT 'Contiene los nombres de la persona.',
   APEPER varchar(80) NULL COMMENT 'Contiene los apellidos de la persona.',
   FECNACPER date NULL COMMENT 'Contiene la fecha de nacimiento de la persona.',
   CELPER char(9) NOT NULL COMMENT 'Contiene el número de celular de la persona.',
   EMAPER varchar(100) NOT NULL COMMENT 'Contiene el correo electrónico de la persona.',
   SEXPER char(1) NULL COMMENT 'Contiene el sexo de la persona, sólo admite M para Masculino y F para femenino.',
   TIPPER char(3) NULL COMMENT 'Determina si la persona es un empleado (EMP) o un estudiante (EST).',
   DISTPER varchar(80) NULL COMMENT 'Contiene el nombre del distrito de procedencia de la persona. Sólo se admite distritos de la provincia de Cañete.',
   FECREGPER timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT 'Fecha de registro de persona.',
   PWSPER varchar(20) NOT NULL COMMENT 'Contraseña de usuario.',
   CONSTRAINT PERSONA_pk PRIMARY KEY (DNIPER)
) COMMENT 'Contiene la información necesaria de las personas pero también diferencia si es estudiante o empleado.';

-- Tabla DEPARTAMENTO
-- --------------------------------------------
CREATE OR REPLACE TABLE DEPARTAMENTO (
   IDDEP int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cada departamento.',
   NOMDEP varchar(50) NULL COMMENT 'Nombre descriptivo de departamento.',
   DNIPER char(8) NOT NULL COMMENT 'Identificador de persona que será el jefe de departamento.',
   SALJEFDEP decimal(8,2) NOT NULL COMMENT 'Salario de Jefe de Departamento',
   CONSTRAINT DEPARTAMENTO_pk PRIMARY KEY (IDDEP)
) COMMENT 'Contiene toda la información de los departamentos en los que trabajan los empleados.';

-- Tabla EMPLEADO
-- --------------------------------------------
CREATE OR REPLACE TABLE EMPLEADO (
   IDEMP int NOT NULL AUTO_INCREMENT COMMENT 'Es el dato identificador de todo empleado.',
   DNIPER char(8) NOT NULL COMMENT 'Identificador de la persona que ahora es empleado.',
   FECINGEMP date NULL COMMENT 'Contiene la fecha de ingreso del empleado a la empresa.',
   CARGEMP varchar(40) NULL COMMENT 'Descripción del cargo del empleado.',
   SALEMP decimal(6,2) NULL COMMENT 'Monto de salario del empleado (no incluye bonos).',
   IDDEP int NOT NULL COMMENT 'Identificador de departamento en que trabaja el empleado.',
   ESTEMP char(1) NOT NULL COMMENT 'Determina si es A activo o I inactivo. Si está trabajando actualmente o no. Por default será A.',
   CONSTRAINT EMPLEADO_pk PRIMARY KEY (IDEMP)
) COMMENT 'Contiene la información necesaria del empleado.';

-- Tabla HISTORICO
-- --------------------------------------------
CREATE OR REPLACE TABLE HISTORICO (
   IDHIS int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de Histórico.',
   DNIPER char(8) NOT NULL COMMENT 'Identificador de la persona que puede ser un empleado o un estudiante.',
   FECFINHIST date NULL COMMENT 'Fin de fecha de intervalo de trabajo, ya sea por despido o por cambios de cargo.',
   TIPHIS char(3) NULL COMMENT 'Tipo de Histórico: CAMB cambio de departamento ó FIN término de labores en la empresa.',
   COMEHIST varchar(100) NOT NULL COMMENT 'Comentarios del motivo de cambio y/o finalización de labores en la empresa.',
   CONSTRAINT HISTORICO_pk PRIMARY KEY (IDHIS)
) COMMENT 'contiene la información histórica de los años trabajados de un empleado dentro de la empresa.';

-- Tabla CURSO
-- --------------------------------------------
CREATE OR REPLACE TABLE CURSO (
   CODCUR char(3) NOT NULL COMMENT 'Contiene el código único para cada curso ofertado.',
   DESCUR varchar(30) NULL COMMENT 'Descripción corta del curso.',
   CATCUR char(3) NULL COMMENT 'Categoría de curso (GEN = General, DEV = Desarrollo y ADS = Análisis y Diseño de Sistemas).',
   DURCUR int NULL COMMENT 'Duración del curso en número de días.',
   CONSTRAINT CURSO_pk PRIMARY KEY (CODCUR)
) COMMENT 'Contiene toda la información referente a los cursos que se ofertan.';

-- Tabla OFERTA
-- --------------------------------------------
CREATE OR REPLACE TABLE OFERTA (
   IDOFER int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de oferta.',
   CODCUR char(3) NOT NULL COMMENT 'Identificador de curso que se está ofertando.',
   FECOFER date NULL COMMENT 'Fecha de inicio de oferta de curso.',
   FECINICCUROFER date NULL COMMENT 'Fecha de inicio de curso ofertado.',
   IDEMP int NOT NULL COMMENT 'Identificador de empleado que sería el profesor del curso ofertado.',
   CONSTRAINT OFERTA_pk PRIMARY KEY (IDOFER)
) COMMENT 'contiene las ofertas de cursos con su respectiva fecha de inicio y profesor.';

-- Tabla INSCRIPCION
-- --------------------------------------------
CREATE OR REPLACE TABLE INSCRIPCION (
   IDINSC int NOT NULL COMMENT 'Identificador de la inscripción realizada.',
   DNIPER char(8) NOT NULL COMMENT 'Identificador de la persona de tipo estudiante que se registra en un curso.',
   IDEMP int NOT NULL COMMENT 'Identificador del empleado del departamento de ventas que realiza la inscripción.',
   IDOFER int NOT NULL COMMENT 'Identificador de la oferta en la que se basa la inscripción.',
   FECINS date NULL COMMENT 'Fecha en que se realiza la inscripción.',
   EVALINSC int NOT NULL COMMENT 'Opinión sobre la persona que lo atendió (escala del 1 - 5)',
   CONSTRAINT INSCRIPCION_pk PRIMARY KEY (IDINSC)
) COMMENT 'contiene todas las inscripciones realizadas a los cursos ofertados y que son atendidos por los empleados del departamento de ventas.';

-- ============================================
-- Crear relaciones entre tablas
-- ============================================
-- Relación 01: CURSO_OFERTA_CODCUR (table: OFERTA)
ALTER TABLE OFERTA ADD CONSTRAINT CURSO_OFERTA_CODCUR FOREIGN KEY CURSO_OFERTA_CODCUR (CODCUR)
    REFERENCES CURSO (CODCUR);

-- Relación 02: DEPARTAMENTO_EMPLEADO_IDEP (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT DEPARTAMENTO_EMPLEADO_IDEP FOREIGN KEY DEPARTAMENTO_EMPLEADO_IDEP (IDDEP)
    REFERENCES DEPARTAMENTO (IDDEP);

-- Relación 03: EMPLEADO_INSCRIPCION_IDEMP (table: INSCRIPCION)
ALTER TABLE INSCRIPCION ADD CONSTRAINT EMPLEADO_INSCRIPCION_IDEMP FOREIGN KEY EMPLEADO_INSCRIPCION_IDEMP (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Relación 04: EMPLEADO_OFERTA_IDEMP (table: OFERTA)
ALTER TABLE OFERTA ADD CONSTRAINT EMPLEADO_OFERTA_IDEMP FOREIGN KEY EMPLEADO_OFERTA_IDEMP (IDEMP)
    REFERENCES EMPLEADO (IDEMP);

-- Relación 05: OFERTA_INSCRIPCION_IDOFER (table: INSCRIPCION)
ALTER TABLE INSCRIPCION ADD CONSTRAINT OFERTA_INSCRIPCION_IDOFER FOREIGN KEY OFERTA_INSCRIPCION_IDOFER (IDOFER)
    REFERENCES OFERTA (IDOFER);

-- Relación 06: PERSONA_DEPARTAMENTO_IDPER (table: DEPARTAMENTO)
ALTER TABLE DEPARTAMENTO ADD CONSTRAINT PERSONA_DEPARTAMENTO_IDPER FOREIGN KEY PERSONA_DEPARTAMENTO_IDPER (DNIPER)
    REFERENCES PERSONA (DNIPER);

-- Relación 07: PERSONA_EMPLEADO_DNIPER (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT PERSONA_EMPLEADO_DNIPER FOREIGN KEY PERSONA_EMPLEADO_DNIPER (DNIPER)
    REFERENCES PERSONA (DNIPER);

-- Relación 08: PERSONA_HISTORICO_DNIPER (table: HISTORICO)
ALTER TABLE HISTORICO ADD CONSTRAINT PERSONA_HISTORICO_DNIPER FOREIGN KEY PERSONA_HISTORICO_DNIPER (DNIPER)
    REFERENCES PERSONA (DNIPER);

-- Relación 09: PERSONA_INSCRIPCION_DNIPER (table: INSCRIPCION)
ALTER TABLE INSCRIPCION ADD CONSTRAINT PERSONA_INSCRIPCION_DNIPER FOREIGN KEY PERSONA_INSCRIPCION_DNIPER (DNIPER)
    REFERENCES PERSONA (DNIPER);