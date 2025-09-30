-- Creación de la BD
CREATE DATABASE IF NOT EXISTS clinica;
USE clinica;

-- Limpieza opcional
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

-- 3. Estado del turno
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

-- 5. Turno
CREATE TABLE turno (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_consultorio INT NOT NULL,
    id_estado_turno INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT fk_turno_paciente     FOREIGN KEY (id_paciente)      REFERENCES paciente(id_paciente),
    CONSTRAINT fk_turno_medico       FOREIGN KEY (id_medico)        REFERENCES medico(id_medico),
    CONSTRAINT fk_turno_consultorio  FOREIGN KEY (id_consultorio)   REFERENCES consultorio(id_consultorio),
    CONSTRAINT fk_turno_estado       FOREIGN KEY (id_estado_turno)  REFERENCES estado_turno(id_estado_turno)
);


-- 6. Diagnóstico
CREATE TABLE diagnostico (
    id_diagnostico INT AUTO_INCREMENT PRIMARY KEY,
    id_turno INT NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_diagnostico DATE NOT NULL,
    CONSTRAINT fk_diagnostico_turno FOREIGN KEY (id_turno) REFERENCES turno(id_turno)
);

-- 7. Factura
CREATE TABLE factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT fk_factura_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

-- 8. Resultado de estudio
CREATE TABLE resultado_estudio (
    id_resultado_estudio INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    resultado TEXT NOT NULL,
    fecha_carga DATE NOT NULL,
    observaciones TEXT,
    CONSTRAINT fk_resultado_paciente FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente)
);

-- 9. Tipo de evento
CREATE TABLE tipo_evento (
    id_tipo_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- 10. Historial del paciente
CREATE TABLE historial_paciente (
    id_historial_paciente INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_tipo_evento INT NOT NULL,
    fecha DATETIME NOT NULL,
    observacion TEXT,
    CONSTRAINT fk_historial_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    CONSTRAINT fk_historial_evento   FOREIGN KEY (id_tipo_evento) REFERENCES tipo_evento(id_tipo_evento)
);

-- 11. especialidad 
CREATE TABLE especialidad(
id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
descripcion VARCHAR(150) NOT NULL
);


-- 12. telefono_paciente
CREATE TABLE telefono_paciente(
id_telefono INT AUTO_INCREMENT PRIMARY KEY,
id_paciente INT NOT NULL,
numero VARCHAR(20) NOT NULL,
tipo VARCHAR(20),
CONSTRAINT fk_paciente_medico FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

-- 13. Obra Social
CREATE TABLE obra_social(
 id_obra_social INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL,
 plan VARCHAR(50) NOT NULL
);

-- 14. telefono_medico
CREATE TABLE telefono_medico(
    id_telefono_medico int auto_increment primary key,
    id_medico int not null,
    telefono varchar(20) not null,
    tipo varchar(20) NOT NULL,
    CONSTRAINT FK_medico_telefono foreign key (id_medico) REFERENCES medico(id_medico)
);

-- 15. Creamos una tabla intermedia para una relación de muchos a muchos entre Médico y Especialidad
CREATE TABLE medico_especialidad (
    id_medico INT,
    id_especialidad INT,
    PRIMARY KEY (id_medico, id_especialidad),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

-- 16. Creación de nueva tabla historia_clinica
CREATE TABLE historia_clinica(
id_historia_clinica INT AUTO_INCREMENT PRIMARY KEY,
id_paciente INT NOT NULL,
id_medico INT NOT NULL,
fecha_atencion DATETIME NOT NULL,
observaciones TEXT,
CONSTRAINT fk_hc_paciente FOREIGN KEY (id_paciente) REFERENCES pacientec(id_paciente),
CONSTRAINT fk_hc_medico FOREIGN KEY (id_medico) REFERENCES medico (id_medico)
);

-- 17. Creación de nueva tabla diagnostico_posible o diagnostico_tipo
CREATE TABLE diagnostico_tipo(
id_diagnostico_tipo INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
descripcion TEXT
);

-- 18. Creamos una tabla intermedia para una relación de muchos a muchos entre historia_clinica y diagnostico_tipo
CREATE TABLE historia_clinica_diagnostico(
id_historial_clinica INT NOT NULL,
id_diagnostico INT NOT NULL,
CONSTRAINT fk_hcd_hc FOREIGN KEY (id_historial_clinica) REFERENCES historial_clinica (id_historial_clinica),
CONSTRAINT fk_hcd_dg FOREIGN KEY (id_diagnostico) REFERENCES diagnostico_tipo (id_diagnostico),
PRIMARY KEY (id_historial_clinica,id_diagnostico)
);

-- 19. Creación de nueva tabla tipo_estudio
CREATE TABLE tipo_estudio (
    id_tipo_estudio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);


-- Agregación de campo 'Asistencia' tabla turno
ALTER TABLE turno ADD COLUMN asistencia boolean;

-- Vinculamos Obra Social con Paciente
ALTER TABLE paciente ADD COLUMN id_obra_social INT;

-- Crear la clave foranea de paciente con obra_social
ALTER TABLE paciente
ADD CONSTRAINT fk_paciente_obra
FOREIGN KEY (id_obra_social)
REFERENCES obra_social(id_obra_social);

-- Mejoras 23-09-2025 --
 
-- Agregación de campo 'monto_total' tabla Factura
ALTER TABLE factura ADD COLUMN monto_total DECIMAL(10,2) NOT NULL;

-- Agregación de campo 'monto_cubierto_obra_social' tabla Factura
ALTER TABLE factura ADD COLUMN  monto_cubierto_obra_social DECIMAL (10,2) NOT NULL; 

-- Agregación de campo 'monto_afiliado' tabla Factura
ALTER TABLE factura ADD COLUMN monto_afiliado DECIMAL(10,2) NOT NULL;

-- Vinculamos Médico con Especialidad
ALTER TABLE medico 
ADD COLUMN id_especialidad INT;

-- Crear la clave foránea de médico con especialidad
ALTER TABLE medico 
ADD CONSTRAINT fk_especialidad_medico
FOREIGN KEY (id_especialidad)
REFERENCES especialidad (id_especialidad);

-- Vinculamos Médico con Consultorio
ALTER TABLE medico ADD COLUMN id_consultorio INT;

-- Crear la clave foranea de médico con consultorio
ALTER TABLE medico
ADD CONSTRAINT fk_consultorio_medico
FOREIGN KEY (id_consultorio)
REFERENCES consultorio (id_consultorio);

-- Vinculamos Diagnostico con Médico
ALTER TABLE diagnostico ADD COLUMN id_medico INT;

-- Crear la clave foranea de diagnostico con médico
ALTER TABLE diagnostico
ADD CONSTRAINT fk_medico_diagnostico
FOREIGN KEY (id_medico)
REFERENCES medico (id_medico);


-- Eliminación de motivo_cancelacion
ALTER TABLE turno 
DROP FOREIGN KEY id_motivo_cancelacion;

-- Eliminación de foreign key motivo_cancelacion en la tabla turno
ALTER TABLE turno 
DROP FOREIGN KEY fk_turno_motivo;

-- Eliminación de la tabla Motivo Cancelación
DROP TABLE motivo_cancelacion;

-- Eliminación de foreign key de turno en la tabla diagnostico
ALTER TABLE diagnostico 
DROP FOREIGN KEY fk_diagnostico_turno;


-- Eliminación de turno de diagnostico
ALTER TABLE diagnostico
DROP COLUMN id_turno;

-- Eliminación de foreign key de diagnostico en la tabla médico
ALTER TABLE medico 
DROP FOREIGN KEY fk_diagnostico_medico;

-- Eliminación de diagnostico de médico
ALTER TABLE medico
DROP COLUMN id_diagnostico; 

-- Mejoras 30-09-2025 --

-- Vinculamos resultado_estudio con tipo_estudio
ALTER TABLE resultado_estudio
ADD id_tipo_estudio INT NOT NULL,
ADD CONSTRAINT fk_resultado_tipo FOREIGN KEY (id_tipo_estudio) REFERENCES tipo_estudio(id_tipo_estudio);


-- Vinculamos resultado_estudio con turno
ALTER TABLE resultado_estudio
ADD id_turno INT NULL,
ADD CONSTRAINT fk_resultado_turno FOREIGN KEY (id_turno) REFERENCES turno(id_turno);