-- Creación de la BD
CREATE DATABASE IF NOT EXISTS clinica;
USE clinica;

-- Limpieza opcional (evita choques por definiciones previas)
DROP TABLE IF EXISTS diagnostico;
DROP TABLE IF EXISTS historial_paciente;
DROP TABLE IF EXISTS resultado_estudio;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS turno;
DROP TABLE IF EXISTS tipo_evento;
DROP TABLE IF EXISTS motivo_cancelacion;
DROP TABLE IF EXISTS consultorio;
DROP TABLE IF EXISTS estado_turno;
DROP TABLE IF EXISTS paciente;
DROP TABLE IF EXISTS medico;

-- 1. Médico
CREATE TABLE medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(25) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL
);

-- 2. Paciente
CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- 3. Estado del turno (catálogo)
CREATE TABLE estado_turno (
    id_estado_turno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE
);

-- 4. Consultorio
CREATE TABLE consultorio (
    id_consultorio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(50) NOT NULL,
    piso INT NOT NULL
);

-- 5. Motivo de cancelación (catálogo opcional)
CREATE TABLE motivo_cancelacion (
    id_motivo_cancelacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(100)
);

-- 6. Turno
-- Nota: agrego FK opcional a motivo_cancelacion y unique para evitar doble asignación del médico y del consultorio a la misma fecha/hora
CREATE TABLE turno (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_consultorio INT NOT NULL,
    id_estado_turno INT NOT NULL,
    id_motivo_cancelacion INT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT fk_turno_paciente     FOREIGN KEY (id_paciente)      REFERENCES paciente(id_paciente),
    CONSTRAINT fk_turno_medico       FOREIGN KEY (id_medico)        REFERENCES medico(id_medico),
    CONSTRAINT fk_turno_consultorio  FOREIGN KEY (id_consultorio)   REFERENCES consultorio(id_consultorio),
    CONSTRAINT fk_turno_estado       FOREIGN KEY (id_estado_turno)  REFERENCES estado_turno(id_estado_turno),
    CONSTRAINT fk_turno_motivo       FOREIGN KEY (id_motivo_cancelacion) REFERENCES motivo_cancelacion(id_motivo_cancelacion),
    -- Evitar que un médico tenga dos turnos a la misma hora
    CONSTRAINT uq_turno_medico UNIQUE (id_medico, fecha, hora),
    -- Evitar que un consultorio tenga doble ocupación a la misma hora
    CONSTRAINT uq_turno_consultorio UNIQUE (id_consultorio, fecha, hora)
);

-- 7. Diagnóstico (depende de un turno)
CREATE TABLE diagnostico (
    id_diagnostico INT AUTO_INCREMENT PRIMARY KEY,
    id_turno INT NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_diagnostico DATE NOT NULL,
    CONSTRAINT fk_diagnostico_turno FOREIGN KEY (id_turno) REFERENCES turno(id_turno)
);

-- 8. Factura (por paciente; los ítems podrían ir en otra tabla si se necesitara)
CREATE TABLE factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    fecha DATE NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_factura_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

-- 9. Resultado de estudio (asociado al paciente; si querés atarlo a un turno específico, agregá id_turno NULL + FK)
CREATE TABLE resultado_estudio (
    id_resultado_estudio INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    resultado TEXT NOT NULL,
    fecha_carga DATE NOT NULL,
    observaciones TEXT,
    CONSTRAINT fk_resultado_paciente FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente)
);

-- 10. Tipo de evento (catálogo para el historial)
CREATE TABLE tipo_evento (
    id_tipo_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- 11. Historial del paciente (usa catálogo de tipo_evento)
CREATE TABLE historial_paciente (
    id_historial_paciente INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_tipo_evento INT NOT NULL,
    fecha DATETIME NOT NULL,
    observacion TEXT,
    CONSTRAINT fk_historial_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    CONSTRAINT fk_historial_evento   FOREIGN KEY (id_tipo_evento) REFERENCES tipo_evento(id_tipo_evento)
);

-- ----------------------------------------------------
-- INSERTS DE DATOS DE EJEMPLO
-- ----------------------------------------------------

-- Datos para la tabla 'medico'
INSERT INTO medico (nombre, apellido, matricula, especialidad, email, telefono) VALUES
('Ana', 'Gómez', 'MG-12345', 'Cardiología', 'ana.gomez@clinica.com', '555-1234'),
('Carlos', 'López', 'MG-67890', 'Pediatría', 'carlos.lopez@clinica.com', '555-5678'),
('Marta', 'Pérez', 'MG-11223', 'Dermatología', 'marta.perez@clinica.com', '555-9101');

-- Datos para la tabla 'paciente'
INSERT INTO paciente (nombre, apellido, dni, email, fecha_nacimiento, telefono) VALUES
('Juan', 'Díaz', '12345678', 'juan.diaz@email.com', '1990-05-15', '555-2345'),
('Sofía', 'Ramírez', '98765432', 'sofia.ramirez@email.com', '1985-11-20', '555-6789'),
('Pedro', 'Castro', '11223344', 'pedro.castro@email.com', '2000-03-25', '555-3456');

-- Datos para la tabla 'estado_turno'
INSERT INTO estado_turno (nombre) VALUES
('Programado'),
('Confirmado'),
('Atendido'),
('Cancelado');

-- Datos para la tabla 'consultorio'
INSERT INTO consultorio (nombre, ubicacion, piso) VALUES
('Consultorio 1', 'Ala Norte', 2),
('Consultorio 2', 'Ala Sur', 1),
('Consultorio 3', 'Ala Norte', 3);

-- Datos para la tabla 'motivo_cancelacion'
INSERT INTO motivo_cancelacion (nombre, descripcion) VALUES
('Fuerza Mayor', 'Cancelación por motivos de fuerza mayor'),
('Enfermedad', 'Cancelación por enfermedad del paciente'),
('Recambio de turno', 'Se reprogramó el turno en otra fecha');

-- Datos para la tabla 'turno'
INSERT INTO turno (id_paciente, id_medico, id_consultorio, id_estado_turno, fecha, hora) VALUES
(1, 1, 1, 2, '2025-09-20', '10:00:00'),
(2, 2, 2, 1, '2025-09-21', '11:30:00'),
(3, 1, 1, 1, '2025-09-22', '09:00:00');

-- Datos para la tabla 'diagnostico'
INSERT INTO diagnostico (id_turno, descripcion, fecha_diagnostico) VALUES
(1, 'Dolor en el pecho. Se recomienda realizar un electrocardiograma.', '2025-09-20');

-- Datos para la tabla 'factura'
INSERT INTO factura (id_paciente, fecha, monto) VALUES
(1, '2025-09-20', 1500.00);

-- Datos para la tabla 'resultado_estudio'
INSERT INTO resultado_estudio (id_paciente, resultado, fecha_carga, observaciones) VALUES
(1, 'Electrocardiograma normal. Ritmo sinusal.', '2025-09-21', 'Resultados dentro de los parámetros esperados.');

-- Datos para la tabla 'tipo_evento'
INSERT INTO tipo_evento (nombre) VALUES
('Cita Agendada'),
('Cita Cancelada'),
('Cita Atendida');

-- Datos para la tabla 'historial_paciente'
INSERT INTO historial_paciente (id_paciente, id_tipo_evento, fecha, observacion) VALUES
(1, 1, '2025-09-19 14:00:00', 'Turno agendado con Dr. Gómez para cardiología.'),
(1, 3, '2025-09-20 10:30:00', 'Turno con Dr. Gómez finalizado.'),
(2, 1, '2025-09-20 16:00:00', 'Turno agendado con Dr. López para pediatría.');

-- ----------------------------------------------------
-- VISTAS
-- ----------------------------------------------------

-- Vista para mostrar todos los turnos con detalles de paciente, médico y consultorio
CREATE OR REPLACE VIEW vista_turnos_detallados AS
SELECT
    t.id_turno,
    p.nombre AS nombre_paciente,
    p.apellido AS apellido_paciente,
    m.nombre AS nombre_medico,
    m.apellido AS apellido_medico,
    c.nombre AS nombre_consultorio,
    t.fecha,
    t.hora,
    e.nombre AS estado,
    mc.nombre AS motivo_cancelacion
FROM
    turno t
JOIN
    paciente p ON t.id_paciente = p.id_paciente
JOIN
    medico m ON t.id_medico = m.id_medico
JOIN
    consultorio c ON t.id_consultorio = c.id_consultorio
JOIN
    estado_turno e ON t.id_estado_turno = e.id_estado_turno
LEFT JOIN
    motivo_cancelacion mc ON t.id_motivo_cancelacion = mc.id_motivo_cancelacion;

-- Vista para ver el historial completo de los pacientes
CREATE OR REPLACE VIEW vista_historial_pacientes AS
SELECT
    p.dni,
    p.nombre AS nombre_paciente,
    p.apellido AS apellido_paciente,
    te.nombre AS tipo_evento,
    hp.fecha,
    hp.observacion
FROM
    historial_paciente hp
JOIN
    paciente p ON hp.id_paciente = p.id_paciente
JOIN
    tipo_evento te ON hp.id_tipo_evento = te.id_tipo_evento;


-- ----------------------------------------------------
-- PROCEDIMIENTOS ALMACENADOS
-- ----------------------------------------------------

-- Procedimiento para agendar un nuevo turno y registrarlo en el historial
DELIMITER $$
CREATE PROCEDURE sp_agendar_turno (
    IN p_id_paciente INT,
    IN p_id_medico INT,
    IN p_id_consultorio INT,
    IN p_fecha DATE,
    IN p_hora TIME
)
BEGIN
    DECLARE v_id_turno INT;

    -- Insertar el nuevo turno con estado 'Programado'
    INSERT INTO turno (id_paciente, id_medico, id_consultorio, id_estado_turno, fecha, hora)
    VALUES (p_id_paciente, p_id_medico, p_id_consultorio, 1, p_fecha, p_hora);

    -- Obtener el ID del turno recién creado
    SET v_id_turno = LAST_INSERT_ID();

    -- Registrar el evento en el historial del paciente
    INSERT INTO historial_paciente (id_paciente, id_tipo_evento, fecha, observacion)
    VALUES (p_id_paciente, 1, NOW(), CONCAT('Turno agendado con el médico con ID: ', p_id_medico, ' para la fecha ', p_fecha, ' a las ', p_hora));

    SELECT 'Turno agendado y evento registrado con éxito.';
END$$
DELIMITER ;

-- Procedimiento para cancelar un turno y registrar el motivo
DELIMITER $$
CREATE PROCEDURE sp_cancelar_turno (
    IN p_id_turno INT,
    IN p_id_motivo_cancelacion INT
)
BEGIN
    DECLARE v_id_paciente INT;
    DECLARE v_fecha_turno DATE;
    DECLARE v_hora_turno TIME;

    -- Obtener datos del turno antes de actualizar
    SELECT id_paciente, fecha, hora INTO v_id_paciente, v_fecha_turno, v_hora_turno FROM turno WHERE id_turno = p_id_turno;

    -- Actualizar el estado del turno a 'Cancelado'
    UPDATE turno
    SET id_estado_turno = 4, id_motivo_cancelacion = p_id_motivo_cancelacion
    WHERE id_turno = p_id_turno;

    -- Registrar el evento de cancelación en el historial del paciente
    INSERT INTO historial_paciente (id_paciente, id_tipo_evento, fecha, observacion)
    VALUES (v_id_paciente, 2, NOW(), CONCAT('Turno de la fecha ', v_fecha_turno, ' a las ', v_hora_turno, ' cancelado.'));

    SELECT 'Turno cancelado y evento registrado con éxito.';
END$$
DELIMITER ;



