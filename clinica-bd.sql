-- Creación de la BD
CREATE DATABASE IF NOT EXISTS clinica;
USE clinica;

#🔑 Explicación de relaciones
# Turno conecta paciente, medico, consultorio y estado_turno.
# Diagnóstico se vincula a un turno.
# Historial_paciente y resultado_estudio se vinculan directamente a paciente.
# Factura también se vincula a paciente.
# Motivo_cancelacion podría usarse si extendés turno con una FK id_motivo_cancelacion (opcional).




-- 1. Médico 
CREATE TABLE IF NOT EXISTS medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(25) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL
);

-- 2. Paciente
CREATE TABLE IF NOT EXISTS paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- 3. Estado del turno
CREATE TABLE IF NOT EXISTS estado_turno (
    id_estado_turno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL
);

-- 4. Consultorio
CREATE TABLE IF NOT EXISTS consultorio (
    id_consultorio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(50) NOT NULL,
    piso INT NOT NULL
);

-- 5. Turno
CREATE TABLE IF NOT EXISTS turno (
    id_turno INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_consultorio INT NOT NULL,
    id_estado_turno INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT fk_turno_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    CONSTRAINT fk_turno_medico FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    CONSTRAINT fk_turno_consultorio FOREIGN KEY (id_consultorio) REFERENCES consultorio(id_consultorio),
    CONSTRAINT fk_turno_estado FOREIGN KEY (id_estado_turno) REFERENCES estado_turno(id_estado_turno)
);

-- 6. Diagnóstico
CREATE TABLE IF NOT EXISTS diagnostico (
    id_diagnostico INT AUTO_INCREMENT PRIMARY KEY,
    id_turno INT NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_diagnostico DATE NOT NULL,
    CONSTRAINT fk_diagnostico_turno FOREIGN KEY (id_turno) REFERENCES turno(id_turno)
);

-- 7. Historial de paciente
CREATE TABLE IF NOT EXISTS historial_paciente (
    id_historial_paciente INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    evento VARCHAR(100) NOT NULL,
    fecha DATETIME NOT NULL,
    observacion TEXT,
    CONSTRAINT fk_historial_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

-- 8. Factura
CREATE TABLE IF NOT EXISTS factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    fecha DATE NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_factura_paciente FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

-- 9. Motivo de cancelación
CREATE TABLE IF NOT EXISTS motivo_cancelacion (
    id_motivo_cancelacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100)
);

-- 10. Resultado de estudio
CREATE TABLE IF NOT EXISTS resultado_estudio (
    id_resultado_estudio INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    resultado TEXT NOT NULL,
    fecha_carga DATE NOT NULL,
    observaciones TEXT,
    CONSTRAINT fk_resultado_paciente FOREIGN KEY (id_paciente)
        REFERENCES paciente (id_paciente)
);

-- Insertamos datos

INSERT INTO  medico (nombre,apellido,matricula,especialidad,email,telefono) VALUES ('Nicolás','Perez','FR 789 ZT','Cirujia','nicolasperez021@gmail.com','261456789');
INSERT INTO  medico (nombre,apellido,matricula,especialidad,email,telefono) VALUES ('Diego','Rodriguez','AG 135 OL','Pediatria','diegorodriguez39@gmail.com','261236549');
INSERT INTO  medico (nombre,apellido,matricula,especialidad,email,telefono) VALUES ('Ramiro','Martin','PL 523 QN','Cardiología','ramiromartin90@gmail.com','261784026');





 