select distinct dv.mdata::json->>'id_contacto',
c.id as campana_id,
dv.mdata::json->>'id_contacto' as "COD",
concat(split_part(dv.mdata::json->>'Rut','-', 1),dv.mdata::json->>'id_contacto') as "Folio",
dv.mdata::json->>'Rut' as "RUT",
dv.mdata::json->>'pro_desc_plan' as "Plan",
dv.mdata::json->>'pro_valu_plan' as "Ramo",
da."name" as "Nombre Ejecutivo",
dv.mdata::json->>'for_his_date_form',
To_date(dv.mdata::json->>'for_his_date_form','YYYYMMDD') as "Fecha",
TO_TIMESTAMP(dv.mdata::json->>'for_his_date_form', 'HH24MISS')::text as "Hora",
dtg2.mdata::json->>'cal_eval_observation'  as "Observacion",
dtg2.mdata::json->>'cal_eval_state' as "Estado Venta",
dtg2.mdata::json->>'cal_eval_reject_type' as "TIPO RECHAZO",
dtg2.mdata::json->>'eval_date_hour' as "Fecha Calidad",
dtg2.mdata::json->>'cal_eval_state' as "Hora Calidad",
dtg2.mdata::json->>'cal_eval_observation' as "Obs Calidad",
dtg2.mdata::json->>'cal_eval_id' as "cod_confirmacion"
FROM dw_nuevo.dw_ventas dv 
left join dw_nuevo.campanas c ON c.id = dv.campana_id
left join dw_nuevo.dw_agentes da on da.mdata->>'idusuario'::varchar = dv.mdata::json->>'ws_id_usuario'
left join dw_nuevo.dw_tablas_genesys dtg2 on dtg2.mdata::json->>'cal_eval_campaign' = c.mdata::json->>'genesys_campaing_id'  and dtg2.name_table = 'calidad_app.cal_evaluations'
where c.id in (125)
and dtg2.mdata::json->>'cal_eval_typing' in ('1','2','5','8','12','13','9','10','11','15')
and dtg2.mdata::json->>'cal_eval_state' is null


select * 
FROM dw_nuevo.dw_ventas dv 
left join dw_nuevo.campanas c ON c.id = dv.campana_id
where c.id in (125)
limit 100





and dv.mdata::json->>'for_his_date_form' > '2021-01-08'
--and dv.mdata::json->>'ws_fecha_calidad' > '2021-01-08'