---ranking por ejecutivo 
select 
concat(uu.use_name,' ',uu.use_appaterno ,' ',uu.use_apmaterno) as ejecutivo
from calidad_app.cal_evaluations ce
left join calidad_app.use_user uu on uu.use_id = ce.cal_eval_id


---informe de calidad
select 
'' as "CRM",
ce.cal_eval_id as "ID",
concat(uu.use_name,' ',uu.use_appaterno ,' ',uu.use_apmaterno) as "EJECUTIVO VENTA",
hfh.for_his_metadata::json->>'Telefono' as "FONO CONTACTO",
to_char(hfh.for_his_date_form, 'dd-mm-yyyy') as "FECHA VENTA",
split_part(hfh.for_his_metadata::json->>'Rut','-',1)  as "RUT VENTA",
split_part(hfh.for_his_metadata::json->>'Rut','-',2) as "DV VENTA",
concat(hfh.for_his_metadata::json->>'PrimerNombre',' ',hfh.for_his_metadata::json->>'SegundoNombre',' ',
hfh.for_his_metadata::json->>'ApPaterno',' ',hfh.for_his_metadata::json->>'ApMaterno') as "NOMBRE VENTA",
'' as "NOMBRE GRABACION",
ce.cal_eval_typing as "PRIMER ESTADO",
ce.cal_eval_typing as "SEGUNDO ESTADO",
ce.cal_pauta_evaluada as "PRIMER MOTIVO",
ce.cal_pauta_evaluada::json->>'observacion'  as "OBSERVACION PRIMER ESTADO"
from calidad_app.cal_evaluations ce
left join calidad_app.use_user uu on uu.use_id = ce.use_id_cal
left join "Genesys".his_form_history hfh on hfh.for_his_genesys_id = ce.cal_eval_interaction
where ce.cal_eval_campaign in ('0a831458-dfea-4395-8fa4-2bd97079b7ce','a62e618b-c08b-4754-ae47-a9201a7a1e53','80bc9d0e-8b2c-40c9-bbd6-17c047405e05','6c1eca3a-c4ac-4736-af3e-cb8ce71774d3')
and ce.cal_eval_state is not null