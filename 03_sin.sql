
-- =========================================================
-- NUEVAS ESPECIALIDADES
-- =========================================================
INSERT INTO especialidad (nombre, descripcion) VALUES
('Gastroenterología', 'Trastornos del sistema digestivo'),
('Neumología', 'Trastornos respiratorios'),
('Otorrinolaringología', 'Oído, nariz y garganta'),
('Reumatología', 'Enfermedades articulares y autoinmunes'),
('Oncología', 'Tratamiento de cáncer'),
('Nefrología', 'Enfermedades renales'),
('Hematología', 'Trastornos de la sangre'),
('Endodoncia', 'Trastornos dentales y endodoncia'),
('Medicina del Deporte', 'Salud y rendimiento deportivo'),
('Infectología', 'Enfermedades infecciosas');


-- =========================================================
-- MÉDICOS (se preservan matriculas y emails únicos; si ya existen, se ignoran)
-- =========================================================
INSERT INTO medico (nombre, apellido, matricula, especialidad, email, telefono) VALUES
('María', 'Fernández', 'MAT606', 'Cardiología', 'm01fernandez1@clinica.com', '3875550101'),
('José', 'García', 'MAT107', 'Cardiología', 'jgarcia1@clinica.com', '3875550102'),
('Paula', 'López', 'MAT008', 'Pediatría', 'plopez1@clinica.com', '3875550103'),
('Hernán', 'Castro', 'MAT009', 'Neurología', 'hcastro1@clinica.com', '3875550104'),
('Claudia', 'Luna', 'MAT010', 'Cardiología', 'cluna@clinica.com', '3875550105'),
('Andrés', 'Castillo', 'MAT011', 'Cardiología', 'acastillo@clinica.com', '3875550106'),
('Laura', 'Benítez', 'MAT012', 'Cardiología', 'lbenitez@clinica.com', '3875550107'),
('Paula', 'Mendoza', 'MAT013', 'Pediatría', 'pmendoza@clinica.com', '3875550108'),
('Rodrigo', 'Santos', 'MAT014', 'Pediatría', 'rsantos@clinica.com', '3875550109'),
('Julia', 'Vega', 'MAT015', 'Pediatría', 'jvega@clinica.com', '3875550110'),
('Luciano', 'Campos', 'MAT016', 'Pediatría', 'lcampos@clinica.com', '3875550111'),
('Carolina', 'López', 'MAT017', 'Pediatría', 'clopez@clinica.com', '3875550112'),
('Santiago', 'Herrera', 'MAT018', 'Neurología', 'sherrera@clinica.com', '3875550113'),
('Elena', 'Figueroa', 'MAT118', 'Neurología', 'efigueroa@clinica.com', '3875550114'),
('Ignacio', 'Suárez', 'MAT019', 'Neurología', 'isuarez@clinica.com', '3875550115'),
('Patricia', 'Ortega', 'MAT020', 'Neurología', 'portega@clinica.com', '3875550116'),
('Marcelo', 'Núñez', 'MAT021', 'Neurología', 'mnunez@clinica.com', '3875550117'),
('Gabriela', 'Paz', 'MAT022', 'Dermatología', 'gpaz@clinica.com', '3875550118'),
('Fernando', 'Delgado', 'MAT023', 'Dermatología', 'fdelgado@clinica.com', '3875550119'),
('Romina', 'Gómez', 'MAT024', 'Dermatología', 'rgomez@clinica.com', '3875550120'),
('Leandro', 'Torres', 'MAT025', 'Dermatología', 'ltorres@clinica.com', '3875550121'),
('Valeria', 'Ruiz', 'MAT026', 'Dermatología', 'vruiz@clinica.com', '3875550122'),
('Matías', 'Cabrera', 'MAT027', 'Traumatología', 'mcabrera@clinica.com', '3875550123'),
('Sofía', 'Romero', 'MAT028', 'Traumatología', 'sromero@clinica.com', '3875550124'),
('Juan', 'Salas', 'MAT029', 'Traumatología', 'jsalas@clinica.com', '3875550125'),
('Liliana', 'Correa', 'MAT030', 'Traumatología', 'lcorrea@clinica.com', '3875550126'),
('Esteban', 'Pereyra', 'MAT031', 'Traumatología', 'epereyra@clinica.com', '3875550127'),
('Nadia', 'Vargas', 'MAT032', 'Oftalmología', 'nvargas@clinica.com', '3875550128'),
('Hugo', 'Molina', 'MAT033', 'Oftalmología', 'hmolina@clinica.com', '3875550129'),
('Rocío', 'Arias', 'MAT034', 'Oftalmología', 'rarias@clinica.com', '3875550130'),
('Tomás', 'Miranda', 'MAT035', 'Oftalmología', 'tmiranda@clinica.com', '3875550131'),
('Daniela', 'Flores', 'MAT036', 'Oftalmología', 'dflores@clinica.com', '3875550132'),
('Martina', 'Ponce', 'MAT037', 'Ginecología', 'mponce@clinica.com', '3875550133'),
('Pablo', 'Navarro', 'MAT038', 'Ginecología', 'pnavarro@clinica.com', '3875550134'),
('Julieta', 'Bravo', 'MAT039', 'Ginecología', 'jbravo@clinica.com', '3875550135'),
('Leonardo', 'Ibarra', 'MAT040', 'Ginecología', 'libarra@clinica.com', '3875550136'),
('Celeste', 'Morales', 'MAT041', 'Ginecología', 'cmorales@clinica.com', '3875550137'),
('Diego', 'Luna', 'MAT042', 'Urología', 'dluna@clinica.com', '3875550138'),
('Natalia', 'Serrano', 'MAT043', 'Urología', 'nserrano@clinica.com', '3875550139'),
('Mauricio', 'Vázquez', 'MAT044', 'Urología', 'mvazquez@clinica.com', '3875550140'),
('Carla', 'Acosta', 'MAT045', 'Urología', 'cacosta@clinica.com', '3875550141'),
('Ezequiel', 'Medina', 'MAT046', 'Urología', 'emedina@clinica.com', '3875550142'),
('Agustina', 'Quiroga', 'MAT047', 'Psiquiatría', 'aquiroga@clinica.com', '3875550143'),
('Federico', 'Benítez', 'MAT048', 'Psiquiatría', 'fbenitez@clinica.com', '3875550144'),
('Marina', 'Leiva', 'MAT049', 'Psiquiatría', 'mleiva@clinica.com', '3875550145'),
('Cristian', 'Aguilar', 'MAT050', 'Psiquiatría', 'caguilar@clinica.com', '3875550146'),
('Camila', 'Pereyra', 'MAT051', 'Psiquiatría', 'cpereyra@clinica.com', '3875550147'),
('Guillermo', 'Soto', 'MAT052', 'Endocrinología', 'gsoto@clinica.com', '3875550148'),
('Antonella', 'Paz', 'MAT053', 'Endocrinología', 'apaz@clinica.com', '3875550149'),
('Franco', 'Gómez', 'MAT054', 'Endocrinología', 'fgomez@clinica.com', '3875550150'),
('Brenda', 'Molina', 'MAT055', 'Endocrinología', 'bmolina@clinica.com', '3875550151'),
('Damián', 'Rivas', 'MAT056', 'Endocrinología', 'drivas@clinica.com', '3875550152'),
('Verónica', 'Salazar', 'MAT057', 'Cardiología', 'vsalazar@clinica.com', '3875550153'),
('Ramón', 'Ibáñez', 'MAT058', 'Cardiología', 'ribanez@clinica.com', '3875550154'),
('Noelia', 'Sosa', 'MAT059', 'Cardiología', 'nsosa@clinica.com', '3875550155'),
('Diego', 'Ferrer', 'MAT060', 'Cardiología', 'dferrer@clinica.com', '3875550156'),
('Lorena', 'Valdez', 'MAT061', 'Cardiología', 'lvaldez@clinica.com', '3875550157'),
('Emiliano', 'Márquez', 'MAT062', 'Pediatría', 'emarquez@clinica.com', '3875550158'),
('Tamara', 'Rosales', 'MAT063', 'Pediatría', 'trosales@clinica.com', '3875550159'),
('Cristian', 'Figueroa', 'MAT064', 'Pediatría', 'cfigueroa@clinica.com', '3875550160'),
('Marina', 'Zambrano', 'MAT065', 'Pediatría', 'mzambrano@clinica.com', '3875550161'),
('Hernán', 'Lara', 'MAT066', 'Pediatría', 'hlara@clinica.com', '3875550162'),
('Agustina', 'Méndez', 'MAT068', 'Neurología', 'amendez@clinica.com', '3875550163'),
('Fernando', 'Córdoba', 'MAT168', 'Neurología', 'fcordoba@clinica.com', '3875550164'),
('Natalia', 'Paredes', 'MAT069', 'Neurología', 'nparedes@clinica.com', '3875550165'),
('Javier', 'Reyes', 'MAT070', 'Neurología', 'jreyes@clinica.com', '3875550166'),
('Valentina', 'Ochoa', 'MAT171', 'Neurología', 'vochoa@clinica.com', '3875550167'),
('Alejandro', 'Cabrera', 'MAT241', 'Dermatología', 'acabrera@clinica.com', '3875550168'),
('Carolina', 'Bravo', 'MAT072', 'Dermatología', 'cbravo@clinica.com', '3875550169'),
('Diego', 'Rojas', 'MAT073', 'Dermatología', 'drojas@clinica.com', '3875550170'),
('Luz', 'Vargas', 'MAT074', 'Dermatología', 'lvargas@clinica.com', '3875550171'),
('Fabián', 'Ortiz', 'MAT075', 'Dermatología', 'fortiz@clinica.com', '3875550172'),
('Jimena', 'Salinas', 'MAT076', 'Traumatología', 'jsalinas@clinica.com', '3875550173'),
('Tomás', 'Villalba', 'MAT077', 'Traumatología', 'tvillalba@clinica.com', '3875550174'),
('Daniela', 'Ríos', 'MAT078', 'Traumatología', 'drios@clinica.com', '3875550175'),
('Gonzalo', 'Crespo', 'MAT079', 'Traumatología', 'gcrespo@clinica.com', '3875550176'),
('Laura', 'Fuentes', 'MAT080', 'Traumatología', 'lfuentes@clinica.com', '3875550177'),
('Emanuel', 'Salcedo', 'MAT081', 'Oftalmología', 'esalcedo@clinica.com', '3875550178'),
('Rocío', 'Villanueva', 'MAT082', 'Oftalmología', 'rvillanueva@clinica.com', '3875550179'),
('Julian', 'Beltrán', 'MAT083', 'Oftalmología', 'jbeltran@clinica.com', '3875550180'),
('Mónica', 'Alonso', 'MAT084', 'Oftalmología', 'malonso@clinica.com', '3875550181'),
('Sebastián', 'Peña', 'MAT085', 'Oftalmología', 'spena@clinica.com', '3875550182'),
('Florencia', 'Salvador', 'MAT086', 'Ginecología', 'fsalvador@clinica.com', '3875550183'),
('Gabriel', 'Molina', 'MAT087', 'Ginecología', 'gmolina@clinica.com', '3875550184'),
('María', 'Fierro', 'MAT088', 'Ginecología', 'mfierro@clinica.com', '3875550185'),
('Héctor', 'Castro', 'MAT089', 'Ginecología', 'hcastro2@clinica.com', '3875550186'),
('Isabel', 'Ramos', 'MAT090', 'Ginecología', 'iramos2@clinica.com', '3875550187'),
('Diego', 'Vera', 'MAT091', 'Urología', 'dvera@clinica.com', '3875550188'),
('Sofía', 'Paz', 'MAT092', 'Urología', 'spaz2@clinica.com', '3875550189'),
('Martín', 'Cruz', 'MAT093', 'Urología', 'mcruz@clinica.com', '3875550190'),
('Camila', 'Aguirre', 'MAT094', 'Urología', 'caguirre@clinica.com', '3875550191'),
('Andrés', 'León', 'MAT095', 'Urología', 'aleon@clinica.com', '3875550192'),
('Valentina', 'Méndez', 'MAT096', 'Psiquiatría', 'vmendez2@clinica.com', '3875550193'),
('Hugo', 'Giménez', 'MAT097', 'Psiquiatría', 'hgimenez@clinica.com', '3875550194'),
('Clara', 'Romero', 'MAT098', 'Psiquiatría', 'cromero@clinica.com', '3875550195'),
('Ramiro', 'López', 'MAT099', 'Psiquiatría', 'rlopez2@clinica.com', '3875550196'),
('Martina', 'Vargas', 'MAT100', 'Psiquiatría', 'mvargas2@clinica.com', '3875550197'),
('Gustavo', 'Paredes', 'MAT101', 'Endocrinología', 'gparedes@clinica.com', '3875550198'),
('Marcela', 'Flores', 'MAT102', 'Endocrinología', 'mflores2@clinica.com', '3875550199'),
('Luciano', 'Rojas', 'MAT103', 'Endocrinología', 'lrojas2@clinica.com', '3875550200'),
('Verónica', 'López', 'MAT104', 'Endocrinología', 'vlopez2@clinica.com', '3875550201'),
('Emilio', 'Sánchez', 'MAT105', 'Endocrinología', 'esanchez@clinica.com', '3875550202'),
('Martina', 'Reyes', 'MAT106', 'Gastroenterología', 'mreyes@clinica.com', '3875550203'),
('Luciano', 'Figueroa', 'MAT1070', 'Gastroenterología', 'lfigueroa@clinica.com', '3875550204'),
('Paula', 'Giménez', 'MAT108', 'Gastroenterología', 'pgimenez@clinica.com', '3875550205'),
('Andrés', 'Torres', 'MAT109', 'Gastroenterología', 'atorres@clinica.com', '3875550206'),
('Carla', 'Sánchez', 'MAT110', 'Gastroenterología', 'csanchez2@clinica.com', '3875550207'),
('Diego', 'Luna2', 'MAT111', 'Neumología', 'dluna2@clinica.com', '3875550208'),
('Valentina', 'Rojas', 'MAT112', 'Neumología', 'vrojas@clinica.com', '3875550209'),
('Hugo', 'Mendoza', 'MAT113', 'Neumología', 'hmendoza@clinica.com', '3875550210'),
('Lucía', 'Bravo', 'MAT114', 'Neumología', 'lbravo2@clinica.com', '3875550211'),
('Federico', 'Navarro', 'MAT115', 'Neumología', 'fnavarro@clinica.com', '3875550212'),
('Camila', 'Vega', 'MAT116', 'Otorrinolaringología', 'cvega@clinica.com', '3875550213'),
('Esteban', 'Salas2', 'MAT117', 'Otorrinolaringología', 'esalas@clinica.com', '3875550214'),
('Isabella', 'Paz', 'MAT521', 'Otorrinolaringología', 'ipaz2@clinica.com', '3875550215'),
('Ramiro', 'Molina', 'MAT119', 'Otorrinolaringología', 'rmolina@clinica.com', '3875550216'),
('Martina', 'Cruz', 'MAT120', 'Otorrinolaringología', 'mcruz2@clinica.com', '3875550217'),
('Sofía', 'Acosta', 'MAT121', 'Reumatología', 'sacosta@clinica.com', '3875550218'),
('Ignacio', 'Ríos', 'MAT122', 'Reumatología', 'irios2@clinica.com', '3875550219'),
('Julieta', 'Paredes', 'MAT123', 'Reumatología', 'jparedes@clinica.com', '3875550220'),
('Hernán', 'Bravo', 'MAT124', 'Reumatología', 'hbravo@clinica.com', '3875550221'),
('Camila', 'Gutiérrez', 'MAT125', 'Reumatología', 'cgutierrez@clinica.com', '3875550222'),
('Lucas', 'Salazar', 'MAT126', 'Oncología', 'lsalazar@clinica.com', '3875550223'),
('Martina', 'Torres', 'MAT127', 'Oncología', 'mtorres2@clinica.com', '3875550224'),
('Diego', 'Castillo', 'MAT128', 'Oncología', 'dcastillo@clinica.com', '3875550225'),
('Paula', 'Vargas', 'MAT129', 'Oncología', 'pvargas@clinica.com', '3875550226'),
('Fernando', 'Ramos', 'MAT130', 'Oncología', 'framos@clinica.com', '3875550227'),
('Valentina', 'Domínguez', 'MAT131', 'Nefrología', 'vdominguez@clinica.com', '3875550228'),
('Julián', 'Navarro', 'MAT132', 'Nefrología', 'jnavarro2@clinica.com', '3875550229'),
('Martín', 'Paz', 'MAT133', 'Nefrología', 'mpaz@clinica.com', '3875550230'),
('Lucía', 'Gómez', 'MAT134', 'Nefrología', 'lgomez2@clinica.com', '3875550231'),
('Agustina', 'Rojas', 'MAT135', 'Nefrología', 'arojas@clinica.com', '3875550232'),
('Diego', 'Salas', 'MAT136', 'Hematología', 'dsalas2@clinica.com', '3875550233'),
('Camila', 'Pereira', 'MAT137', 'Hematología', 'cpereira2@clinica.com', '3875550234'),
('Hugo', 'Vargas2', 'MAT138', 'Hematología', 'hvargas@clinica.com', '3875550235'),
('Martina', 'Ríos', 'MAT139', 'Hematología', 'mrios@clinica.com', '3875550236'),
('Julieta', 'Castro', 'MAT140', 'Hematología', 'jcastro2@clinica.com', '3875550237'),
('Luciano', 'Fierro', 'MAT141', 'Endodoncia', 'lfierro@clinica.com', '3875550238'),
('Valentina', 'Salinas', 'MAT142', 'Endodoncia', 'vsalinas@clinica.com', '3875550239'),
('Esteban', 'Navarro2', 'MAT143', 'Endodoncia', 'enavarro2@clinica.com', '3875550240'),
('Martina', 'Paz2', 'MAT144', 'Endodoncia', 'mpaz2@clinica.com', '3875550241'),
('Diego', 'Beltrán', 'MAT145', 'Endodoncia', 'dbeltran@clinica.com', '3875550242'),
('Camila', 'Torres', 'MAT146', 'Medicina del Deporte', 'ctorres@clinica.com', '3875550243'),
('Lucas', 'Giménez', 'MAT147', 'Medicina del Deporte', 'lgimenez2@clinica.com', '3875550244'),
('Sofía', 'Bravo2', 'MAT148', 'Medicina del Deporte', 'sbravo2@clinica.com', '3875550245'),
('Martín', 'Rojas2', 'MAT149', 'Medicina del Deporte', 'mrojas2@clinica.com', '3875550246'),
('Valentina', 'Córdoba', 'MAT150', 'Medicina del Deporte', 'vcordoba@clinica.com', '3875550247'),
('Diego', 'Vega', 'MAT151', 'Infectología', 'dvega@clinica.com', '3875550248'),
('Lucía', 'Molina', 'MAT152', 'Infectología', 'lmolina2@clinica.com', '3875550249'),
('Hugo', 'Torres2', 'MAT153', 'Infectología', 'htorres@clinica.com', '3875550250'),
('Martina', 'Paz3', 'MAT154', 'Infectología', 'mpaz3@clinica.com', '3875550251'),
('Camilo', 'Ríos', 'MAT155', 'Infectología', 'crios2@clinica.com', '3875550252');


-- =========================================================
-- PACIENTES (unicidad por dni; fechas corregidas en formato YYYY-MM-DD)
-- =========================================================
INSERT INTO paciente (nombre, apellido, dni, email, fecha_nacimiento, telefono) VALUES
('Camila', 'Domínguez', '45111221', 'cadominguez1@mail.com', '1991-04-15', '3875552001'),
('Nicolás', 'Torres', '45111222', 'ntorres1@mail.com', '1988-09-10', '3875552002'),
('Julieta', 'Mendoza', '45111223', 'jmendoza1@mail.com', '1995-03-28', '3875552003'),
('Tomás', 'Ruiz', '45111224', 'truiz1@mail.com', '1999-07-17', '3875552004'),
('Valentina', 'Silva', '45111225', 'vsilva1@mail.com', '1984-11-04', '3875552005'),
('Santiago', 'Morales', '45111226', 'smorales1@mail.com', '1992-08-21', '3875552006'),
('Martina', 'Pereira', '45111227', 'mpereira1@mail.com', '1986-12-09', '3875552007'),
('Franco', 'Ledesma', '45111228', 'fledesma1@mail.com', '2000-01-30', '3875552008'),
('Lucía', 'Ramos', '45111229', 'lramos1@mail.com', '1997-03-14', '3875552009'),
('Agustín', 'García', '45111230', 'agarcia1@mail.com', '1989-06-12', '3875552010'),
('Milagros', 'Vega', '45111231', 'mvega1@mail.com', '1994-10-19', '3875552011'),
('Ezequiel', 'Navarro', '45111232', 'enavarro1@mail.com', '1990-02-08', '3875552012'),
('Rocío', 'Arias', '45111233', 'rarias1@mail.com', '2002-05-27', '3875552013'),
('Matías', 'Campos', '45111234', 'mcampos1@mail.com', '1987-09-03', '3875552014'),
('Bárbara', 'Sánchez', '45111235', 'bsanchez1@mail.com', '1983-11-25', '3875552015'),
('Fernando', 'Delgado', '45111236', 'fdelgado1@mail.com', '1998-07-06', '3875552016'),
('Emilia', 'Paz', '45111237', 'epaz1@mail.com', '1991-02-11', '3875552017'),
('Lucas', 'Gómez', '45111238', 'lgomez1@mail.com', '1985-03-18', '3875552018'),
('Melina', 'Acosta', '45111239', 'macosta1@mail.com', '1993-05-22', '3875552019'),
('Gonzalo', 'Correa', '45111240', 'gcorrea1@mail.com', '1980-08-02', '3875552020'),
('Renata', 'Ibarra', '45111241', 'ribarra1@mail.com', '1996-10-13', '3875552021'),
('Diego', 'Fernández', '45111242', 'dfernandez1@mail.com', '1979-11-29', '3875552022'),
('Lautaro', 'Salas', '45111243', 'lsalas1@mail.com', '1994-09-01', '3875552023'),
('Josefina', 'Villar', '45111244', 'jvillar1@mail.com', '1988-12-24', '3875552024'),
('Benjamín', 'Ortega', '45111245', 'bortega1@mail.com', '1999-06-10', '3875552025'),
('Micaela', 'Ponce', '45111246', 'mponce1@mail.com', '2001-03-05', '3875552026'),
('Iván', 'Luna', '45111247', 'iluna1@mail.com', '1986-01-16', '3875552027'),
('Tatiana', 'Bravo', '45111248', 'tbravo1@mail.com', '1993-09-29', '3875552028'),
('Federico', 'Molina', '45111249', 'fmolina1@mail.com', '1995-05-07', '3875552029'),
('Catalina', 'Rivas', '45111250', 'crivas1@mail.com', '1990-02-14', '3875552030'),
('Pablo', 'Soto', '45111251', 'psoto1@mail.com', '1982-06-11', '3875552031'),
('Sofía', 'Quiroga', '45111252', 'squiroga1@mail.com', '1997-10-23', '3875552032'),
('Ramiro', 'Benítez', '45111253', 'rbenitez1@mail.com', '1989-12-02', '3875552033'),
('Candela', 'Leiva', '45111254', 'cleiva1@mail.com', '2000-07-19', '3875552034'),
('Julián', 'Aguilar', '45111255', 'jaguilar1@mail.com', '1992-11-27', '3875552035'),
('Carla', 'Pereyra', '45111256', 'cpereyra1@mail.com', '1991-03-16', '3875552036'),
('Thiago', 'Serrano', '45111257', 'tserrano1@mail.com', '1988-08-05', '3875552037'),
('Malena', 'Vázquez', '45111258', 'mvazquez1@mail.com', '1999-09-11', '3875552038'),
('Germán', 'Acosta', '45111259', 'gacosta1@mail.com', '1985-04-09', '3875552039'),
('Juliana', 'Medina', '45111260', 'jmedina1@mail.com', '2001-12-18', '3875552040'),
('Ignacio', 'Ramos', '45111261', 'iramos1@mail.com', '1994-02-22', '3875552041'),
('Clara', 'Domínguez', '45111262', 'claradominguez2@mail.com', '1986-09-04', '3875552042'),
('Esteban', 'Giménez', '45111263', 'egimenez1@mail.com', '1983-07-25', '3875552043'),
('Valeria', 'Figueroa', '45111264', 'vfigueroa1@mail.com', '1990-11-13', '3875552044'),
('Facundo', 'Núñez', '45111265', 'fnunez1@mail.com', '1987-05-01', '3875552045'),
('Rosa', 'Delgado', '45111266', 'rdelgado1@mail.com', '1978-08-22', '3875552046'),
('Elías', 'Martínez', '45111267', 'emartinez1@mail.com', '2003-10-06', '3875552047'),
('Jimena', 'Cruz', '45111268', 'jcruz1@mail.com', '1995-03-31', '3875552048'),
('Álvaro', 'Gutiérrez', '45111269', 'agutierrez1@mail.com', '1989-06-18', '3875552049'),
('Rocío', 'Paz', '45111270', 'rpaz1@mail.com', '1992-12-27', '3875552050');

USE clinica;

-- =========================================================
-- ESTADOS DE TURNO (se insertan solo si no existen)
-- =========================================================
INSERT IGNORE INTO estado_turno (nombre) VALUES
('Programado'),
('Cancelado'),
('Completado'),
('En espera'),
('Reprogramado'),
('En curso'),
('Finalizado sin asistencia'),
('Pendiente de confirmación');

-- =========================================================
-- TIPOS DE EVENTO (sin duplicados)
-- =========================================================
INSERT IGNORE INTO tipo_evento (nombre) VALUES
('Alta de paciente'),
('Cambio de obra social'),
('Reconsulta'),
('Suspensión de turno'),
('Actualización de datos'),
('Cambio de médico'),
('Anulación de turno');

-- =========================================================
-- CONSULTORIOS (únicos)
-- =========================================================
INSERT IGNORE INTO consultorio (nombre, ubicacion, piso) VALUES
('Consultorio A', 'Ala Norte', 1),
('Consultorio B', 'Ala Sur', 1),
('Consultorio C', 'Ala Oeste', 2),
('Consultorio D', 'Ala Este', 2),
('Consultorio E', 'Ala Norte', 3),
('Consultorio F', 'Ala Sur', 2),
('Consultorio G', 'Ala Oeste', 3),
('Consultorio H', 'Ala Central', 1);

-- =========================================================
-- TIPOS DE DIAGNÓSTICO (sin repetir)
-- =========================================================
INSERT IGNORE INTO diagnostico_tipo (nombre, descripcion) VALUES
('Hipertensión', 'Presión arterial elevada'),
('Migraña', 'Dolor de cabeza severo'),
('Diabetes', 'Nivel elevado de azúcar en sangre'),
('Asma', 'Enfermedad respiratoria crónica'),
('Anemia', 'Deficiencia de glóbulos rojos o hemoglobina'),
('Artritis', 'Inflamación de las articulaciones'),
('Depresión', 'Trastorno del estado de ánimo');

-- =========================================================
-- OBRAS SOCIALES (IDs únicos)
-- =========================================================
INSERT IGNORE INTO obra_social (id_obra_social, nombre, plan) VALUES
(1, 'OSDE', 'A1'),
(2, 'SWISS MEDICAL', 'B2'),
(3, 'GALENO', 'C1'),
(4, 'MEDIFE', 'A2');

-- =========================================================
-- TURNOS (IDs válidos y médicos/pacientes existentes)
-- =========================================================
-- ⚠️ Asegurate de que existan los médicos con id_medico = 1–5 y pacientes con id_paciente = 1–5.
INSERT INTO turno (id_paciente, id_medico, id_consultorio, id_estado_turno, fecha, hora, asistencia) VALUES
(1, 1, 1, 1, '2025-10-10', '09:00:00', TRUE),
(2, 2, 2, 1, '2025-10-10', '09:30:00', TRUE),
(3, 3, 3, 2, '2025-10-11', '10:00:00', FALSE),
(4, 4, 4, 1, '2025-10-12', '11:00:00', TRUE),
(5, 5, 5, 3, '2025-10-13', '11:30:00', FALSE);

-- =========================================================
-- FACTURAS (id_paciente 1–5 deben existir)
-- =========================================================
INSERT INTO factura (id_paciente, fecha, monto_total, monto_cubierto_obra_social, monto_afiliado) VALUES
(1, '2025-10-10', 18000, 12000, 6000),
(2, '2025-10-11', 20000, 15000, 5000),
(3, '2025-10-12', 15000, 10000, 5000),
(4, '2025-10-13', 22000, 16000, 6000),
(5, '2025-10-14', 17000, 12000, 5000);


-- =========================================================
-- DIAGNÓSTICOS (referencias a médicos y tipo válidos)
-- =========================================================
INSERT INTO diagnostico (descripcion, fecha_diagnostico, id_medico, id_diagnostico_tipo) VALUES
('Presión alta detectada', '2025-10-10', 1, 1),
('Dolor de cabeza recurrente', '2025-10-11', 2, 2),
('Nivel elevado de glucosa detectado', '2025-10-12', 3, 3),
('Crisis asmática leve', '2025-10-13', 4, 4),
('Deficiencia de hemoglobina diagnosticada', '2025-10-14', 5, 5);
