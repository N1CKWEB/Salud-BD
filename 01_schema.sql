-- =========================================================
-- 01_schema.sql
-- Definición del esquema lógico-físico de la BD "clinica"
-- Cumple con 2FN/3FN, buenas prácticas y restricciones
-- =========================================================

CREATE DATABASE IF NOT EXISTS clinica CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE clinica;

-- Limpieza previa (para idempotencia)
DROP TABLE IF EXISTS diagnostico;
DROP TABLE IF EXISTS historia_clinica_diagnostico;
DROP TABLE IF EXISTS historia_clinica;
DROP TABLE IF EXISTS administracion_paciente;
DROP TABLE IF EXISTS medico_especialidad;
DROP TABLE IF EXISTS telefono_medico;
DROP TABLE IF EXISTS telefono_paciente;
DROP TABLE IF EXISTS especialidad;
DROP TABLE IF EXISTS obra_social;
DROP TABLE IF EXISTS observacion;
DROP TABLE IF EXISTS factura;
DROP TABLE IF EXISTS turno;
DROP TABLE IF EXISTS consultorio;
DROP TABLE IF EXISTS estado_turno;
DROP TABLE IF EXISTS tipo_evento;
DROP TABLE IF EXISTS diagnostico_tipo;
DROP TABLE IF EXISTS paciente;
DROP TABLE IF EXISTS medico;

-- =========================================================
-- 1. Médico
-- =========================================================
CREATE TABLE medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(25) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- =========================================================
-- 2. Paciente
-- =========================================================
CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

-- =========================================================
-- 3. Estado del turno
-- =========================================================
CREATE TABLE estado_turno (
    id_estado_turno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- =========================================================
-- 4. Consultorio
-- =========================================================
CREATE TABLE consultorio (
    id_consultorio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(50) NOT NULL,
    piso INT NOT NULL
) ENGINE=InnoDB;

-- =========================================================
-- 5. Turno
-- =========================================================
CREATE TABLE turno (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_consultorio INT NOT NULL,
    id_estado_turno INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    asistencia BOOLEAN,
    CONSTRAINT fk_turno_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    CONSTRAINT fk_turno_medico FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    CONSTRAINT fk_turno_consultorio FOREIGN KEY (id_consultorio) REFERENCES consultorio(id_consultorio),
    CONSTRAINT fk_turno_estado FOREIGN KEY (id_estado_turno) REFERENCES estado_turno(id_estado_turno)
) ENGINE=InnoDB;


-- =========================================================
-- 6. Diagnostico Tipo
-- =========================================================
CREATE TABLE diagnostico_tipo (
    id_diagnostico_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL
) ENGINE=InnoDB;

-- =========================================================
-- 7. Diagnóstico
-- =========================================================
CREATE TABLE diagnostico (
    id_diagnostico INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    fecha_diagnostico DATE NOT NULL,
    id_medico INT,
    id_diagnostico_tipo INT,
    CONSTRAINT fk_medico_diagnostico FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    CONSTRAINT fk_dg_diagnostico_tipo FOREIGN KEY (id_diagnostico_tipo) REFERENCES diagnostico_tipo (id_diagnostico_tipo)
) ENGINE=InnoDB;

-- =========================================================
-- 8. Factura
-- =========================================================
CREATE TABLE factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    fecha DATE NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL,
    monto_cubierto_obra_social DECIMAL(10,2) NOT NULL,
    monto_afiliado DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_factura_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
) ENGINE=InnoDB;

-- =========================================================
-- 9. Tipo de evento
-- =========================================================
CREATE TABLE tipo_evento (
    id_tipo_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- =========================================================
-- 10. Especialidad
-- =========================================================
CREATE TABLE especialidad (
    id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150) NOT NULL
) ENGINE=InnoDB;

-- =========================================================
-- 11. Obra Social
-- =========================================================
CREATE TABLE obra_social (
    id_obra_social INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    plan VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

-- =========================================================
-- 12. Teléfono del Paciente
-- =========================================================
CREATE TABLE telefono_paciente (
    id_telefono INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    tipo VARCHAR(20),
    CONSTRAINT fk_tp_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
) ENGINE=InnoDB;

-- =========================================================
-- 13. Teléfono del Médico
-- =========================================================
CREATE TABLE telefono_medico (
    id_telefono_medico INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    CONSTRAINT fk_tm_medico FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
) ENGINE=InnoDB;

-- =========================================================
-- 14. Relaciones M:N
-- =========================================================
CREATE TABLE medico_especialidad (
    id_medico INT,
    id_especialidad INT,
    PRIMARY KEY (id_medico, id_especialidad),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
) ENGINE=InnoDB;

-- =========================================================
-- 15. Historia clínica
-- =========================================================
CREATE TABLE historia_clinica (
    id_historia_clinica INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_turno INT NOT NULL,
    fecha_atencion DATETIME NOT NULL,
    observaciones TEXT,
    CONSTRAINT fk_hc_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    CONSTRAINT fk_hc_medico FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
) ENGINE=InnoDB;


-- =========================================================
-- 16. Administración del paciente
-- =========================================================
CREATE TABLE administracion_paciente (
    id_administrativo INT AUTO_INCREMENT PRIMARY KEY,
    cambio_de_obra_social BOOLEAN NOT NULL,
    id_factura INT NOT NULL,
    id_obra_social INT NOT NULL,
    id_turno INT NOT NULL,
    id_tipo_evento INT NOT NULL,
    CONSTRAINT fk_adm_factura FOREIGN KEY (id_factura) REFERENCES factura(id_factura),
    CONSTRAINT fk_adm_obra FOREIGN KEY (id_obra_social) REFERENCES obra_social(id_obra_social),
    CONSTRAINT fk_adm_turno FOREIGN KEY (id_turno) REFERENCES turno(id_turno),
    CONSTRAINT fk_adm_evento FOREIGN KEY (id_tipo_evento) REFERENCES tipo_evento(id_tipo_evento)
) ENGINE=InnoDB;

-- =========================================================
-- 17. Observaciones
-- =========================================================
CREATE TABLE observacion (
    id_observacion INT AUTO_INCREMENT PRIMARY KEY,
    id_turno INT NOT NULL,
    fecha_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    titulo VARCHAR(120),
    contenido TEXT NOT NULL,
    es_preliminar BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT fk_obs_turno FOREIGN KEY (id_turno) REFERENCES turno(id_turno)
) ENGINE=InnoDB;

-- Vincular Paciente con Obra Social
ALTER TABLE paciente ADD COLUMN id_obra_social INT;
ALTER TABLE paciente ADD CONSTRAINT fk_paciente_obra FOREIGN KEY (id_obra_social) REFERENCES obra_social(id_obra_social);


-- Vincular Historia Clinica con Diagnostico
ALTER TABLE historia_clinica ADD COLUMN id_diagnostico INT;
ALTER TABLE historia_clinica 
ADD CONSTRAINT fk_diagnostico_clinica FOREIGN KEY (id_diagnostico) REFERENCES diagnostico (id_diagnostico);