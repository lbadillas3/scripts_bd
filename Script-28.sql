SELECT update_date, esquema, name_table,
mdata::json->>'est_id' as id,
mdata::json->>'est_descripcion' as estado
FROM dw_nuevo.genesys_esquemas
where name_table = 'cal_estado'


SELECT --mdata ,
case when mdata::json->>'cal_eval_typing' in ('1') then 'OK'
when mdata::json->>'cal_eval_typing' in ('9','10','11','15') then 'RECHAZADO'
when mdata::json->>'cal_eval_typing' in ('2','5','8','12','13') then 'PENDIENTE'
when mdata::json->>'cal_eval_typing' in ('4','14') then 'RECUPERADO'
when mdata::json->>'cal_eval_typing' is null then 'Venta No Auditada'
when mdata::json->>'cal_eval_typing' = '' then 'Venta No Auditada'
end as etiquetas,
--mdata::json->>'cal_eval_typing' as id, 
update_date as fecha
FROM dw_nuevo.genesys_esquemas
where name_table = 'cal_evaluations'
and mdata::json->>'cal_eval_state' is null


