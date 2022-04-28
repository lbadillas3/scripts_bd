select cc.con_id,hfh.for_his_metadata::json->>'pro_sponsor' as sponsor,las.con_id,
pdc.pro_campana as "CAMPAÑA",
pdc.pro_cod_plan as "PRODUCTO",
'1' as "PLAN",
to_char(hfh.for_his_date_form::date,'YYYYMMDD') as "FECHA VENTA",
'' as "FECHA TÉRMINO",
'76916180-5' as "RUT VENDEDOR",
cc.con_metadata::json->>'rut' as "RUT CLIENTE",
case when hfh.for_his_metadata::json->>'Nombre' = '' then cc.con_metadata::json->>'nombre_servicio' else  hfh.for_his_metadata::json->>'Nombre' end as "PRIMER NOMBRE",
'' as "SEGUNDO NOMBRE",
concat(hfh.for_his_metadata::json->>'ApPaterno',' ', hfh.for_his_metadata::json->>'ApMaterno')  as "APELLIDOS",
cc.con_metadata::json->>'direccion' as "DIRECCIÓN",
'' as "REGIÓN",
cc.con_metadata::json->>'localidad' as "CIUDAD",
cc.con_metadata::json->>'comuna' as "COMUNA",
'' as "PAÍS",
cc.con_metadata::json->>'fijo' as "FONO",
case when hfh.for_his_metadata::json->>'Mail' = 'notiene@notiene.cl' then '' else hfh.for_his_metadata::json->>'Mail' end as "CORREO ELECTRÓNICO",
hfh.for_his_metadata::json->>'Fechanacimiento' as "FECHA NACIMIENTO",
'' as "CÓD SEX",
''as "CUOTAS",
''as "CÓD_MP1",
''as "TIPO",
''as "EMISOR",
''as "N°TC",
hfh.for_his_genesys_id as "ID VENTA",
cc.con_metadata::json->>'numero_servicio' as "NUMERO SERVICIO",
cc.con_metadata::json->>'direccion' as "DIRECCION ASEGURADO",
cc.con_metadata::json->>'localidad' as "CIUDAD ASEGURADO",
cc.con_metadata::json->>'comuna' as "COMUNA ASEGURADO",
cc.con_metadata::json->>'fono1' as "CELULAR",
'' as "NUMERO FORMULARIO"
from "Genesys".his_form_history hfh
left join "Genesys".cam_contact cc on cc.con_id::varchar = for_his_con_id
left join "Genesys".his_gestion_history hgh on	hgh.ges_his_genesys_id = hfh.for_his_genesys_id
left join calidad_app.cal_assignments ca on	ca.cal_assig_interaction = hfh.for_his_genesys_id and hfh.for_his_con_id::varchar = ca.cal_assig_contact
left join calidad_app.cal_evaluations ce on ce.cal_eval_interaction = hfh.for_his_genesys_id
left join calidad_app.cal_estado ce2 on ce2.est_id::varchar = ce.cal_eval_typing
left join "Genesys".pro_desc_cam pdc on pdc.pro_cod_plan = hfh.for_his_metadata::json->>'pro_cod_plan'
left join chubb.log_altas_saesa las on las.con_id = hfh.for_his_con_id
where
	cc.con_genesys_campaing_id is not null and hfh.for_his_date_form::date > '20210601' and ce.cal_eval_state is null
	and hgh.ges_his_tipificacion_4 in ('Acepta regalo') and length(for_his_genesys_id) > 30
	and hfh.for_his_metadata::json->>'pro_sponsor' in ('Luz Osorno') and las.con_id is null and hfh.for_his_metadata::json->>'id_campana' in ('265a9d74-69d5-4d58-8996-ad019d2e1fad','98995a51-9e56-444a-a16d-d3cea1dc6683')
	and ce2.est_descripcion in ('OK','RECUPERADA')	