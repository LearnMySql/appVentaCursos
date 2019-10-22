-- ============================================
-- Ingreso de registros
-- ============================================

-- Poner en uso la base de datos
-- ====================================================
USE appVentaCurso;

-- Insertar registros en la tabla PERSONA
-- ====================================================
INSERT INTO PERSONA
(DNIPER, NOMPER, APEPER, FECNACPER, CELPER, EMAPER, SEXPER, TIPPER, DISTPER, PWSPER)
VALUES
('45343211', 'Juan', 'Campos Quispe', '1979-07-20', '998765432', 'juan.campos@gmail.com', 'M', 'EMP', 'San Vicente','45343211' ),
('15439876', 'Andrea', 'Dávila Martínez', '1980-10-15', '997854321', 'andrea.davila@outlook.com', 'F', 'EMP','Imperial', '15439876' ),
('26453200', 'Sofía', 'Torres López', '1985-10-12', '', 'sofia.torres@gmail.com',  'F', 'EST', 'Imperial', '26453200' ),
('43658799', 'María', 'Casas Campos', '1990-06-06', '', 'maria.casas@outlook.com', 'F', 'EST', 'Mala', '43658799'),
('46389800', 'Alberto', 'Ramos Tarazona', '1995-04-04', '', 'alberto.ramos@outlook.com', 'M', 'EST', 'San Vicente', '46389800'),
('16480943', 'Andrés', 'Luyo Zapata', '1990-04-20', '998765456', 'andres.luyo@yahoo.com', 'M', 'EST', 'Imperial', '16480943'),
('43786544', 'Hilario', 'Taipe Quiroz', '1991-03-15', '967845102', 'hilario.taipe@yahoo.com', 'M', 'EMP', 'Mala', '43786544'),
('12785400', 'Gloria', 'López Valenzuela', '1996-06-06', '996743012','gloria.lopez@gmail.com', 'F', 'EST', 'Asia', '12785400'),
('34769822', 'Pedro', 'Guerra Solano', '1997-04-30', '', 'pedro.guerra@gmail.com', 'M', 'EST', 'Mala', '34769822'),
('43658399', 'Miguel', 'Francia Abregú', '1999-02-02', '986542345', 'migue.francia@yahoo.com', 'M', 'EST', 'Nuevo Imperial', '43658399'),
('45638743', 'Carlos', 'Franco Lombardi', '1995-05-16', '943687431', 'carlos.franco@gmail.com', 'M', 'EMP', 'San Vicente', '45638743'),
('45678744', 'Arnulfo', 'Manco Yaya', '1979-02-18', '978665324', 'arnulfo.manco@gmail.com', 'M', 'EMP', 'Cerro Azul', '45678744');

-- Insertar registros en la tabla DEPARTAMENTO
-- ====================================================
INSERT INTO DEPARTAMENTO
(NOMDEP, DNIPER, SALJEFDEP)
VALUES
('DIRECTOR', '', ), 
('ACCOUNTING', '', ), 
('TRAINING', '',), 
('SALES', '',);

-- Insertar registros en la tabla CURSO
-- ====================================================
INSERT INTO CURSO
(CODCUR, DESCUR, CATCUR, DURCUR)
VALUES
('JAV', 'Java for Oracle developers', 'DEV', 4),
('PLS', 'Introduction to PL/SQL', 'DEV', 1),
('XML', 'XML for Oracle developers', 'DEV', 2),
('ERM', 'Data modeling with ERM', 'ADS', 3),
('GEN', 'System generation', 'ADS', 4),
('PMT', 'Process modeling techniques', 'ADS', 1),
('PRO', 'Prototyping', 'GEN', 5),
('RSD', 'Relational system design', 'ADS', 2),
('OAU', 'Oracle for application users', 'DEV', 1),
('SQL', 'Introduction to SQL', 'DEV', 4);




-- Insertar registros en la tabla EMPLEADO
-- ====================================================
INSERT INTO EMPLEADO
(IDPER, FECINGEMP, CARGEMP, JEFE_IDEMP, SALEMP, IDNIVSUE, IDDEP, ESTEMP)
VALUES
(12, '2000-01-01', '');


select * from persona;
select * from PERSONA WHERE TIPPER = 'EMP';
delete from persona;
ALTER TABLE persona AUTO_INCREMENT = 1;
ALTER TABLE empleado AUTO_INCREMENT = 1;
SHOW FULL COLUMNS IN empleado;

