  select rut, nombre, operacion, material, monto_asegurable,
  tipo_moneda, estado_poliza, estado_informe, fecha_inicio_poliza,
  fecha_termino_poliza, clausulas, coberturas_faltantes, descr_rubro,
  rc_pactada, tipo, patente, descr_bien, telefono, celular,
  contacto_nombre, cargo, email, observacion, bitacora, poliza,
  contrato_banco, comentario, usuario, fecha, ejecutivo,
  ejecutivo_email, jefe, jefe_email
FROM leasing.leasing_completa_20210909
where rut = '78791070-K'

select rut, count(rut)
FROM leasing.leasing_completa_20210909
group by rut