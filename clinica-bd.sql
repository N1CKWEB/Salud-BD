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

-- 5. Motivo de cancelación
CREATE TABLE motivo_cancelacion (
    id_motivo_cancelacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(100)
);

-- 6. Turno
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
    CONSTRAINT fk_turno_motivo       FOREIGN KEY (id_motivo_cancelacion) REFERENCES motivo_cancelacion(id_motivo_cancelacion)
);

-- 7. Diagnóstico
CREATE TABLE diagnostico (
    id_diagnostico INT AUTO_INCREMENT PRIMARY KEY,
    id_turno INT NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_diagnostico DATE NOT NULL,
    CONSTRAINT fk_diagnostico_turno FOREIGN KEY (id_turno) REFERENCES turno(id_turno)
);

-- 8. Factura
CREATE TABLE factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    fecha DATE NOT NULL,
    monto DECIMAL(10,2) NOT NULL, 
    CONSTRAINT fk_factura_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

-- 9. Resultado de estudio
CREATE TABLE resultado_estudio (
    id_resultado_estudio INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    resultado TEXT NOT NULL,
    fecha_carga DATE NOT NULL,
    observaciones TEXT,
    CONSTRAINT fk_resultado_paciente FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente)
);

-- 10. Tipo de evento
CREATE TABLE tipo_evento (
    id_tipo_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- 11. Historial del paciente
CREATE TABLE historial_paciente (
    id_historial_paciente INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_tipo_evento INT NOT NULL,
    fecha DATETIME NOT NULL,
    observacion TEXT,
    CONSTRAINT fk_historial_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    CONSTRAINT fk_historial_evento   FOREIGN KEY (id_tipo_evento) REFERENCES tipo_evento(id_tipo_evento)
);
-- 12. especialidad 
CREATE TABLE especialidad(
id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(20) NOT NULL,
descripcion VARCHAR(150) NOT NULL
);


-- 13. telefono_paciente
CREATE TABLE telefono_paciente(
id_telefono INT AUTO_INCREMENT PRIMARY KEY,
id_paciente INT NOT NULL,
numero VARCHAR(20) NOT NULL,
tipo VARCHAR(20),
CONSTRAINT fk_paciente_medico FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

-- 14. Obra Social
CREATE TABLE obra_social(
 id_obra_social INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(50) NOT NULL,
 plan VARCHAR(50) NOT NULL
);

