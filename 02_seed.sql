USE clinica;

-- =========================================================
-- Carga mínima de datos
-- =========================================================

-- Especialidades
INSERT INTO especialidad (nombre, descripcion) VALUES
('Cardiología', 'Tratamiento de enfermedades del corazón'),
('Pediatría', 'Atención médica a niños'),
('Neurología', 'Trastornos del sistema nervioso'),
('Dermatología', 'Trastornos de la piel'),
('Traumatología', 'Lesiones musculares y óseas'),
('Oftalmología', 'Salud visual'),
('Ginecología', 'Salud reproductiva femenina'),
('Urología', 'Tracto urinario y sistema reproductor masculino'),
('Psiquiatría', 'Salud mental'),
('Endocrinología', 'Trastornos hormonales');

-- Médicos
INSERT INTO medico (nombre, apellido, matricula, especialidad, email, telefono) VALUES
('Juan', 'Pérez', 'MAT001', 'Cardiología', 'jperez@clinica.com', '3875550001'),
('Lucía', 'Ramírez', 'MAT002', 'Pediatría', 'lramirez@clinica.com', '3875550002'),
('Andrés', 'López', 'MAT003', 'Neurología', 'alopez@clinica.com', '3875550003'),
('Marta', 'Gómez', 'MAT004', 'Dermatología', 'mgomez@clinica.com', '3875550004'),
('Carlos', 'Sosa', 'MAT005', 'Traumatología', 'csosa@clinica.com', '3875550005');


-- Pacientes
INSERT INTO paciente (nombre, apellido, dni, email, fecha_nacimiento, telefono) VALUES
('Ana', 'Martínez', '44111222', 'amartinez@mail.com', '1990-02-15', '3875551001'),
('Diego', 'Rojas', '40122333', 'drojas@mail.com', '1985-07-10', '3875551002'),
('Laura', 'Pérez', '39123444', 'lperez@mail.com', '1993-11-23', '3875551003'),
('Sofía', 'Vera', '38124555', 'svera@mail.com', '2001-01-04', '3875551004'),
('Mario', 'Suárez', '35122666', 'msuarez@mail.com', '1980-05-20', '3875551005');

-- Estado Turno
INSERT INTO estado_turno (nombre) VALUES
('Programado'), ('Cancelado'), ('Completado');

-- Consultorios
INSERT INTO consultorio (nombre, ubicacion, piso) VALUES
('Consultorio A', 'Ala Norte', 1),
('Consultorio B', 'Ala Sur', 1),
('Consultorio C', 'Ala Oeste', 2);

-- Turnos
INSERT INTO turno (id_paciente, id_medico, id_consultorio, id_estado_turno, fecha, hora, asistencia) VALUES
(1,1,1,1,'2025-10-05','09:00:00',TRUE),
(2,2,2,1,'2025-10-05','09:30:00',TRUE),
(3,3,3,1,'2025-10-05','10:00:00',FALSE);

-- Diagnóstico tipo
INSERT INTO diagnostico_tipo (nombre, descripcion) VALUES
('Hipertensión', 'Presión arterial elevada'),
('Migraña', 'Dolor de cabeza severo');

-- Diagnósticos
INSERT INTO diagnostico (descripcion, fecha_diagnostico, id_medico, id_diagnostico_tipo)
VALUES ('Presión alta detectada', '2025-10-05', 1, 1),
       ('Dolor de cabeza recurrente', '2025-10-06', 3, 2);

-- Facturas
INSERT INTO factura (id_paciente, fecha, monto_total, monto_cubierto_obra_social, monto_afiliado)
VALUES (1, '2025-10-05', 15000, 10000, 5000),
       (2, '2025-10-05', 12000, 8000, 4000);

-- Tipo de evento
INSERT INTO tipo_evento (nombre) VALUES ('Alta de paciente'), ('Cambio de obra social');

-- Obra Social
INSERT INTO obra_social (id_obra_social, nombre, plan)
VALUES (1, 'OSDE', 'A1');

-- Administración paciente
INSERT INTO administracion_paciente (cambio_de_obra_social, id_factura, id_obra_social, id_turno, id_tipo_evento)
VALUES (FALSE, 1, 1, 1, 1),
       (TRUE, 2, 1, 2, 2);
