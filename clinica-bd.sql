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



-- Datos de ejemplo
INSERT INTO  medico (nombre,apellido,matricula,especialidad,email,telefono) VALUES
('Nicolás','Perez','FR 789 ZT','Cirujia','nicolasperez021@gmail.com','261456789'),
('Diego','Rodriguez','AG 135 OL','Pediatria','diegorodriguez39@gmail.com','261236549'),
('Ramiro','Martin','PL 523 QN','Cardiología','ramiromartin90@gmail.com','261784026');


INSERT INTO paciente (nombre,apellido,dni,email,fecha_nacimiento,telefono) VALUES
('María','Gómez','30123456','maria.gomez@gmail.com','1985-07-12','261334455'),
('Lucas','Fernández','40111222','lucas.fernandez@gmail.com','1992-03-05','261667788'),
('Ana','Torres','45123123','ana.torres@gmail.com','2000-09-22','261998877');


INSERT INTO estado_turno (nombre) VALUES
('Pendiente'),
('Confirmado'),
('Cancelado'),
('Atendido');


INSERT INTO consultorio (nombre,ubicacion,piso) VALUES
('Consultorio A','Edificio Central',1),
('Consultorio B','Edificio Central',2),
('Consultorio C','Sucursal Norte',1);

INSERT INTO motivo_cancelacion (nombre,descripcion) VALUES
('Enfermedad del paciente','El paciente no puede asistir por enfermedad'),
('Inconveniente del médico','El médico no puede atender en el horario previsto');

INSERT INTO turno (id_paciente,id_medico,id_consultorio,id_estado_turno,id_motivo_cancelacion,fecha,hora) VALUES
(1,1,1,1,NULL,'2025-09-15','09:00:00'), -- Pendiente
(2,2,2,2,NULL,'2025-09-15','10:30:00'), -- Confirmado
(3,3,3,3,1,'2025-09-16','11:00:00');   -- Cancelado con motivo


INSERT INTO diagnostico (id_turno,descripcion,fecha_diagnostico) VALUES
(2,'Infección respiratoria leve','2025-09-15'),
(1,'Chequeo prequirúrgico sin complicaciones','2025-09-15');


INSERT INTO factura (id_paciente,fecha,monto) VALUES
(1,'2025-09-15',15000.50),
(2,'2025-09-15',8000.00),
(3,'2025-09-16',12000.75);


INSERT INTO resultado_estudio (id_paciente,resultado,fecha_carga,observaciones) VALUES
(1,'Análisis de sangre dentro de parámetros normales','2025-09-15','Sin observaciones'),
(2,'Radiografía muestra leve inflamación','2025-09-16','Requiere seguimiento');


INSERT INTO tipo_evento (nombre) VALUES
('Internación'),
('Alta médica'),
('Estudio de laboratorio'),
('Cirugía programada');

INSERT INTO historial_paciente (id_paciente,id_tipo_evento,fecha,observacion) VALUES
(1,1,'2025-08-20 08:30:00','Internación por cirugía de apéndice'),
(1,2,'2025-08-25 10:00:00','Alta médica sin complicaciones'),
(2,3,'2025-09-10 09:00:00','Análisis de laboratorio rutinario'),
(3,4,'2025-09-12 14:00:00','Cirugía programada de rodilla');



