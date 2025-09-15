
# Vistas / View

CREATE VIEW vista_inscriptos_activos AS SELECT
a.nombre, i.fecha_inscripcion FROM inscripciones i
JOIN alumnos a ON i.id_alumno=a.id;
SELECT * FROM vista_inscriptos_activos;

# 1)_ Vista de facturación por paciente, crear una vista que muestre nombre y apellido del paciente, la suma total de facturación y la cantidad de facturas emitidas.
CREATE VIEW view_facturacion_por_paciente AS SELECT
p.nombre,p.apellido,SUM(f.monto) AS suma_total_de_facturacion,
COUNT(f.monto) AS cantidad_de_facturas_emitidas
FROM factura f  
JOIN paciente p ON p.id_paciente = f.id_paciente
GROUP BY p.id_paciente,p.nombre,p.apellido;

SELECT * FROM view_facturacion_por_paciente;

# 2)_ Vista de turnos confirmados, crear una vista que liste todos los turnos con estado "Confirmado", mostrando: paciente, médico, especialidad, fecha y hora.

# 3)_ Vista de diagnósticos recientes, crear una vista que muestre los diagnósticos realizados en los últimos 30 días, incluyendo: paciente, fecha del diagnóstico y descripción.

# 4)_ Vista de médicos y cantidad de turnos atendidos, crear una vista que muestre cada médico junto con la cantidad de turnos en estado "Atendido".

# 5)_ Vista integral de historial del paciente, crear una vista que una historial_paciente, paciente y tipo_evento para mostrar: paciente, tipo de evento, fecha y observación.



# Procedimientos Almacenados / Stored Procedures

# 1)_ Insertar turno automáticamente, procedimiento que reciba: id_paciente, id_medico, id_consultorio, fecha, hora, y cree un turno con estado inicial "Pendiente".

# 2)_ Facturación total por especialidad (dinámico), procedimiento que reciba una especialidad médica como parámetro y devuelva el total facturado por esa especialidad.

# 3)_ Actualizar estado de turno, procedimiento que reciba id_turno y un nuevo estado, y actualice la tabla turno.

# 4)_ Historial clínico de un paciente, procedimiento que reciba id_paciente y devuelva todos los eventos de su historial (tipo_evento, fecha, observacion).

# 5)_ Reporte integral de un médico (avanzado), procedimiento que reciba id_medico y devuelva:
# Nombre y apellido del médico.
# Cantidad de turnos asignados.
# Cantidad de turnos confirmados y atendidos.
# Total facturado por sus pacientes.
# Cantidad de diagnósticos realizados.