select distinct dv.mdata::json->>'cod_venta' as "COD",
--c.id as campana_id,
--dv.mdata::json->>'cod_venta' as "COD",
dv.mdata::json->>'folio' as "Folio",
dv.mdata::json->>'rut_aseg'as "RUT",
dv.mdata::json->>'plan' as "Plan",
dv.mdata::json->>'ramo' as "Ramo",
da."name" as "Nombre Ejecutivo",
To_date(dv.mdata::json->>'fecha','YYYYMMDD') as "Fecha",
dv.mdata::json->>'hora' as "Hora",
dv.mdata::json->>'obs_venta' as "Observacion",
dv.mdata::json->>'estado_venta'as "Estado Venta",
dv.mdata::json->>'tipo_rechazo' as "TIPO RECHAZO",
dv.mdata::json->>'ws_fecha_calidad' as "Fecha Calidad",
dv.mdata::json->>'ws_estado_calidad' as "Hora Calidad",
dv.mdata::json->>'ws_obs_calidad' as "Obs Calidad",
dv.mdata::json->>'cod_confirmacion' as "cod_confirmacion"
FROM dw_nuevo.dw_ventas dv 
left join dw_nuevo.campanas c ON c.id = dv.campana_id
left join dw_nuevo.dw_agentes da on da.mdata->>'idusuario'::varchar = dv.mdata::json->>'ws_id_usuario'
where c.id = 48 
and  To_date(dv.mdata::json->>'fecha','YYYYMMDD') between to_char(now (),'YYYYMM01')::date and to_char(now () - INTERVAL '1 DAY','YYYYMMDD')::date
--and  To_date(dv.mdata::json->>'fecha','YYYYMMDD') between '20211101' and '20211130'
and dv.mdata::json->>'estado_venta' in ('OK','PENDIENTE','RECUPERADO','RECHAZADO')