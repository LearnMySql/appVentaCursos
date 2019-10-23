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
('45678744', 'Arnulfo', 'Manco Yaya', '1979-02-18', '978665324', 'arnulfo.manco@gmail.com', 'M', 'EMP', 'Cerro Azul', '45678744'), 
('15634377', 'Carmen', 'Francia Pérez', '1980-03-24', '', 'carmen.francia@yahoo.com', 'F', 'EMP', 'San Vicente', '15634377'),
('56470988', 'Mileth', 'Figueroa Ramírez', '1978-04-20', '', 'mileth.figueroa@outlook.com', 'F', 'EMP', 'Asia', '56470988'),
('12547699', 'Rosa', 'Loyola Palomino', '1977-09-25', '978654234', 'rosa.loyola@gmail.com', 'F', 'EMP', 'Imperial', '12547699'),
('65740972', 'Fabian', 'Dominguez Quispe', '1977-03-22', '956432876', 'fabian.dominguez@outlook.com', 'M', 'EMP', 'Nuevo Imperial', '65740972'),
('43789023', 'Facundo', 'Cáceres Paz', '1977-10-24', '', 'facundo.caceres@gmail.com', 'M', 'EMP', 'San Vicente', '43789023'),
('76543209', 'Roxana', 'Candela Torres', '1975-10-20', '', 'roxana.candela@gmail.com', 'F', 'EMP', 'Mala', '76543209'),
('45657612', 'Francisco', 'Rodríguez Conca', '1977-11-15', '98765432', 'francisco.rodriguez@outlook.com', 'M', 'EMP', 'San Vicente', '45657612');

-- Insertar registros en la tabla DEPARTAMENTO
-- ====================================================
INSERT INTO DEPARTAMENTO
(NOMDEP, DNIPER, SALJEFDEP)
VALUES
('DIRECTOR', '76543209', 9000), 
('ACCOUNTING', '45657612', 6500), 
('TRAINING', '65740972', 6000), 
('SALES', '56470988', 5500);

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
(DNIPER, FECINGEMP, CARGEMP, SALEMP, IDDEP, ESTEMP)
VALUES
('15439876', '2000-01-01', 'PROFESOR', 2500, 3, 'A'),
('12547699', '1999-05-15', 'PROFESOR', 2500, 3, 'A'),
('15634377', '2001-06-20', 'PROFESOR', 2500, 3, 'A'),
('43786544', '2002-05-02', 'ASISTENTE', 2000, 3, 'A'),
('43789023', '2001-07-12', 'TESORERO', 3000, 2, 'A'),
('45343211', '2001-07-12', 'TESORERO', 3000, 2, 'A'),
('45638743', '2001-10-25', 'VENDEDOR', 3250, 4, 'A'),
('45678744', '2003-10-15', 'VENDEDOR', 3250, 4, 'A');

show full columns in empleado;
select * from persona;
select * from curso;
select * from departamento;
select * from PERSONA WHERE TIPPER = 'EMP';
delete from departamento;
ALTER TABLE departamento AUTO_INCREMENT = 1;
ALTER TABLE empleado AUTO_INCREMENT = 1;
SHOW FULL COLUMNS IN empleado;

