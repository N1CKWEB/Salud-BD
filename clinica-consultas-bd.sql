# -- Consultas
# 1)_ Pacientes y médicos, listar todos los turnos programados mostrando nombre del paciente, nombre del médico, especialidad y consultorio, solo de aquellos que no fueron cancelados.

# 2)_ Diagnósticos recientes, obtener los diagnósticos realizados en los últimos 7 días, mostrando el nombre y apellido del paciente, la fecha del turno y la descripción del diagnóstico.

# 3)_ Facturación total por especialidad, calcular la suma de los montos facturados agrupados por especialidad médica. Mostrar también el promedio de facturación por especialidad.

# 4)_ Médico con más turnos confirmados, determinar qué médico tiene la mayor cantidad de turnos en estado "Confirmado", mostrando nombre, apellido y cantidad de turnos.

# 5)_ Pacientes con más de un evento clínico, listar aquellos pacientes que tienen más de un registro en el historial clínico, mostrando su nombre y la cantidad de eventos.

# 6)_ Consultorios ocupados, obtener los consultorios que tuvieron más de un turno asignado en un mismo día, indicando el nombre del consultorio, la fecha y la cantidad de turnos.

# 7)_ Pacientes sin estudios cargados, listar los pacientes que no tienen ningún resultado de estudio registrado.

# 8)_ Turnos cancelados con motivo, mostrar todos los turnos cancelados junto al motivo de cancelación, nombre del paciente y nombre del médico asignado.

# 9)_ Facturación promedio por paciente, calcular el monto promedio de las facturas emitidas a cada paciente y listar solo aquellos cuyo promedio supere los 10.000.

# 10)_ Eventos por tipo, listar los tipos de evento clínico (internación, alta, cirugía, etc.) y la cantidad de veces que ocurrieron en la base de datos. Ordenar de mayor a menor frecuencia.

# 11)_ Turnos por médico y estado, obtener un reporte que muestre para cada médico la cantidad de turnos en cada estado (Pendiente, Confirmado, Cancelado, Atendido).

# 12)_ Médicos sin pacientes atendidos, listar los médicos que no tienen ningún turno en estado “Atendido”, mostrando nombre, apellido y especialidad.

# 13)_ Paciente con mayor facturación total, obtener el paciente que generó la facturación acumulada más alta en la clínica. Mostrar nombre, apellido y el total facturado.
# (Tip: usar SUM(monto) con ORDER BY y LIMIT o subconsulta con MAX)

# 14)_ Médicos con más de un diagnóstico distinto en un día, listar los médicos que realizaron más de un diagnóstico diferente en la misma fecha, mostrando nombre, apellido, fecha y la cantidad de diagnósticos distintos.
# (Tip: COUNT(DISTINCT descripcion) + HAVING > 1)

# 15)_ Turnos no atendidos sin reprogramación, mostrar los pacientes que tienen un turno en estado “Cancelado” y no poseen ningún otro turno en estado Pendiente o Confirmado.
# (Tip: usar NOT EXISTS o LEFT JOIN con condición IS NULL)

# 16)_ Consultorios con más especialidades diferentes atendidas, obtener los consultorios que alojaron médicos de más de 2 especialidades distintas en los turnos registrados. Mostrar nombre del consultorio y la cantidad de especialidades.
# (Tip: COUNT(DISTINCT especialidad) + HAVING)

# 17)_ Top 3 pacientes más activos clínicamente, listar los 3 pacientes con mayor cantidad de registros combinados entre historial clínico, turnos y estudios. Mostrar nombre, apellido y el total de registros sumados.
# (Tip: subconsultas o UNION ALL con COUNT por paciente)

# 18)_ Especialidad con mayor cantidad de turnos atendidos, obtener la especialidad médica que haya tenido la mayor cantidad de turnos en estado "Atendido", mostrando el nombre de la especialidad y la cantidad de turnos.
# (Tip: JOIN entre turno y medico, agrupar por especialidad y filtrar con WHERE estado = 'Atendido' + ORDER BY)

# 19)_ Pacientes con facturas y estudios en el mismo mes, listar los pacientes que tengan al menos una factura emitida y un estudio cargado en el mismo mes/año, mostrando nombre, apellido y las fechas de ambos registros.
# (Tip: comparar MONTH(fecha) y YEAR(fecha) entre tablas factura y resultado_estudio)

# 20)_ Reporte integral de productividad médica (consulta estrella ⭐), generar un reporte que muestre para cada médico:
# Nombre y apellido del médico, cantidad total de turnos asignados.
# Cantidad de turnos confirmados y atendidos (separados).
# Monto total facturado por sus pacientes.
# Cantidad de diagnósticos registrados.
# El resultado debe ordenar los médicos de mayor a menor según el monto facturado.
#(Tip: requiere múltiples JOIN entre medico, turno, paciente, factura y diagnostico, junto con COUNT y SUM + GROUP BY).