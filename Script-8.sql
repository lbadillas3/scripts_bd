select cc.con_id,
hfh.for_his_con_id,
lacch.con_id as log_con_id,
 hfh.for_his_metadata::json->>'pro_cod_plan_sponsor' as cod_plan,
'05' as canal,
'HGFS3' as campana, --"CAMPAÑA",
hfh.for_his_metadata::json->>'CodigoOperacion' as indice,
'' as suc_sucrec,
'' as seg_folio,
'' as dv_folio,
to_char(hfh.for_his_date_form::date,'YYYYMMDD') as fecha_solicitud,
'' as clasificacion_empresa,
split_part(hfh.for_his_metadata::json->>'Rut', '-',  1) as RUT,
split_part(hfh.for_his_metadata::json->>'Rut', '-',  2) as DV,
UPPER(hfh.for_his_metadata::json->>'ApPaterno') as "APELLIDO PATERNO",
UPPER(hfh.for_his_metadata::json->>'ApMaterno') as "APELLIDO MATERNO",
UPPER(hfh.for_his_metadata::json->>'Nombre') as "PRIMER NOMBRE",
UPPER(hfh.for_his_metadata::json->>'SegundoNombre') as "SEGUNDO NOMBRE",
to_char((hfh.for_his_metadata::json->>'Fechanacimiento')::date,'YYYYMMDD') as "FECHA NACIMIENTO",
'44'  as tipo_de_seguro,
'hospitalizacion grupo familiar' as descripcion_seguro,
(case 
 when replace(hfh.for_his_metadata::json->>'Tipoplan','A','')='31' then 'A3'
 when replace(hfh.for_his_metadata::json->>'Tipoplan','A','')='32' then 'A3'
 when replace(hfh.for_his_metadata::json->>'Tipoplan','A','')='41' then 'A4'
 when replace(hfh.for_his_metadata::json->>'Tipoplan','A','')='42' then 'A4'
 else 'A'||replace(hfh.for_his_metadata::json->>'Tipoplan','A','') end) as tipo_de_plan,
 hfh.for_his_metadata::json->>'pro_desc_plan' as descripcion_del_plan,
 hfh.for_his_metadata::json->>'pro_valu_plan' as monto_prima,
''  as tipo_caducidad,
''  as descrip_caducidad,
''  as fecha_caducidad,
'' as tipo_de_afiliado,
'' as descripcion_de_afiliado,
cc.con_metadata::json->>'direccion' as direccion_asegurada,
cc.con_metadata::json->>'comuna' as cod_comuna_asegurada,
cc.con_metadata::json->>'ciudad' as cod_ciudad_asegurada,
cc.con_metadata::json->>'telefono1' as telefonos,
cc.con_metadata::json->>'telefono1' as telefonos,
cc.con_metadata::json->>'mail' as no_email,
'' as no_mail,
'' as cod_tipo,
'' as cod_marca,
'' as cod_modelo,
'' as anio,
'' as cod_tipo_veh,
'' as patente,
'' as motor,
cc.con_metadata::json->>'direccion' as direccion_asegurada,
'' as comuna_asegurada,
'' as ciudad_asegurada,
concat(cc.con_metadata::json->>'rut','-',cc.con_metadata::json->>'dv') as rut_vendedor,
cc.con_metadata::json->>'ciudad' as cod_ciudad_asegurada,
cc.con_metadata::json->>'comuna' as cod_comuna_asegurada,
'' as rut_vendedor,
'' as nombre_vendedor,
'' as genero_afiliado,
'' as estado_civil_afiliado,
'' as estado_civil_afiliado
---completar Beneficiario
from "Genesys".his_form_history hfh
left join "Genesys".cam_contact cc on cc.con_id::varchar = for_his_con_id
left join "Genesys".his_gestion_history hgh on	hgh.ges_his_genesys_id = hfh.for_his_genesys_id
left join calidad_app.cal_assignments ca on	ca.cal_assig_interaction = hfh.for_his_genesys_id and hfh.for_his_con_id::varchar = ca.cal_assig_contact
left join calidad_app.cal_evaluations ce on ce.cal_eval_interaction = hfh.for_his_genesys_id
left join calidad_app.cal_estado ce2 on ce2.est_id::varchar = ce.cal_eval_typing
left join "Genesys".pro_desc_cam pdc on pdc.pro_cod_plan = hfh.for_his_metadata::json->>'pro_cod_plan_sponsor'
left join (SELECT
mi_resultado.ben_his_con_id,
'' as cod_benef1,
'' as cod_aseg1,
mi_resultado.rut_benef1,
mi_resultado.nombre_benef1,
mi_resultado.segundo_nombre_benef1,
mi_resultado.paterno_benef1,
mi_resultado.materno_benef1,
mi_resultado.porcentaje_benef1,
mi_resultado.telefono_benef1,
'' as cel_benef1,
mi_resultado.mail_benef1,
mi_resultado.direccion_benef1,
mi_resultado.comuna_benef1,
mi_resultado.ciudad_benef1,
'' as cod_benef2,
'' as cod_aseg2,
mi_resultado.rut_benef2,
mi_resultado.nombre_benef2,
mi_resultado.segundo_nombre_benef2,
mi_resultado.paterno_benef2,
mi_resultado.materno_benef2,
mi_resultado.porcentaje_benef2,
mi_resultado.telefono_benef2,
'' as cel_benef2,
mi_resultado.mail_benef2,
mi_resultado.direccion_benef2,
mi_resultado.comuna_benef2,
mi_resultado.ciudad_benef2,
'' as cod_benef3,
'' as cod_aseg3,
mi_resultado.rut_benef3,
mi_resultado.nombre_benef3,
mi_resultado.segundo_nombre_benef3,
mi_resultado.paterno_benef3,
mi_resultado.materno_benef3,
mi_resultado.porcentaje_benef3,
mi_resultado.telefono_benef3,
'' as cel_benef3,
mi_resultado.mail_benef3,
mi_resultado.direccion_benef3,
mi_resultado.comuna_benef3,
mi_resultado.ciudad_benef3,
'' as cod_benef4,
'' as cod_aseg4,
mi_resultado.rut_benef4,
mi_resultado.nombre_benef4,
mi_resultado.segundo_nombre_benef4,
mi_resultado.paterno_benef4,
mi_resultado.materno_benef4,
mi_resultado.porcentaje_benef4,
mi_resultado.telefono_benef4,
'' as cel_benef4,
mi_resultado.mail_benef4,
mi_resultado.direccion_benef4,
mi_resultado.comuna_benef4,
mi_resultado.ciudad_benef4,
'' as cod_benef5,
'' as cod_aseg5,
mi_resultado.rut_benef5,
mi_resultado.nombre_benef5,
mi_resultado.segundo_nombre_benef5,
mi_resultado.paterno_benef5,
mi_resultado.materno_benef5,
mi_resultado.porcentaje_benef5,
mi_resultado.telefono_benef5,
'' as cel_benef5,
mi_resultado.mail_benef5,
mi_resultado.direccion_benef5,
mi_resultado.comuna_benef5,
mi_resultado.ciudad_benef5,
'' as cod_benef6,
'' as cod_aseg6,
mi_resultado.rut_benef6,
mi_resultado.nombre_benef6,
mi_resultado.segundo_nombre_benef6,
mi_resultado.paterno_benef6,
mi_resultado.materno_benef6,
mi_resultado.porcentaje_benef6,
mi_resultado.telefono_benef6,
'' as cel_benef6,
mi_resultado.mail_benef6,
mi_resultado.direccion_benef6,
mi_resultado.comuna_benef6,
mi_resultado.ciudad_benef6,
'' as cod_benef7,
'' as cod_aseg7,
mi_resultado.rut_benef7,
mi_resultado.nombre_benef7,
mi_resultado.segundo_nombre_benef7,
mi_resultado.paterno_benef7,
mi_resultado.materno_benef7,
mi_resultado.porcentaje_benef7,
mi_resultado.telefono_benef7,
'' as cel_benef7,
mi_resultado.mail_benef7,
mi_resultado.direccion_benef7,
mi_resultado.comuna_benef7,
mi_resultado.ciudad_benef7
from crosstab('
SELECT hbh.ben_his_con_id::int, ''1'' as categoria,case
when hbh.ben_his_metadata::json->>''Rut'' is null then '' ''
	 else hbh.ben_his_metadata::json->>''Rut''
end
  FROM "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int, ''2'' as categoria,case
when hbh.ben_his_metadata::json->>''Nombre'' is null then '' ''
	 else hbh.ben_his_metadata::json->>''Nombre''
end
  FROM "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int, ''3'' as categoria,case
when hbh.ben_his_metadata::json->>''SegundoNombre'' is null then '' ''
	 else hbh.ben_his_metadata::json->>''SegundoNombre''
end
  FROM "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,''4'' as categoria,case
when hbh.ben_his_metadata::json->>''ApPaterno'' is null then '' ''
	 else hbh.ben_his_metadata::json->>''ApPaterno''
end
  FROM "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,''5'' as categoria,case
when hbh.ben_his_metadata::json->>''ApMaterno'' is null then '' ''
	 else hbh.ben_his_metadata::json->>''ApMaterno''
end
  FROM "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int, ''6'' as categoria,case
when hbh.ben_his_metadata::json->>''Porcentaje'' is null then '' ''
	 else hbh.ben_his_metadata::json->>''Porcentaje''
end
  FROM "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,''7'' as categoria,case
when hbh.ben_his_metadata::json->>''Telefono'' is null then '' ''
	 else hbh.ben_his_metadata::json->>''Telefono''
end
  FROM "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int, ''8'' as categoria,case
when hbh.ben_his_metadata::json->>''Mail'' is null then '' ''
	 else hbh.ben_his_metadata::json->>''Mail''
end
  FROM "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int, ''9'' as categoria,case
when hbh.ben_his_metadata::json->>''Direccion'' is null then '' ''
	 else hbh.ben_his_metadata::json->>''Direccion''
end
  FROM "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,''10'' as categoria,case
when hbh.ben_his_metadata::json->>''Comuna'' is null then '' ''
	 else hbh.ben_his_metadata::json->>''Comuna''
end
  FROM "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,''11'' as C,case
when hbh.ben_his_metadata::json->>''Ciudad'' is null then '' ''
	 else hbh.ben_his_metadata::json->>''Ciudad''
end
  FROM "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
order by ben_his_con_id,categoria'::text) mi_resultado(ben_his_con_id integer,
rut_benef1 TEXT,
nombre_benef1 TEXT,
segundo_nombre_benef1 TEXT,
paterno_benef1 TEXT,
materno_benef1 TEXT,
porcentaje_benef1 TEXT,
telefono_benef1 TEXT,
mail_benef1 TEXT,
direccion_benef1 TEXT,
comuna_benef1 TEXT,
ciudad_benef1 TEXT,
rut_benef2 TEXT,
nombre_benef2 TEXT,
segundo_nombre_benef2 TEXT,
paterno_benef2 TEXT,
materno_benef2 TEXT,
porcentaje_benef2 TEXT,
telefono_benef2 TEXT,
mail_benef2 TEXT,
direccion_benef2 TEXT,
comuna_benef2 TEXT,
ciudad_benef2 TEXT,
rut_benef3 TEXT,
nombre_benef3 TEXT,
segundo_nombre_benef3 TEXT,
paterno_benef3 TEXT,
materno_benef3 TEXT,
porcentaje_benef3 TEXT,
telefono_benef3 TEXT,
mail_benef3 TEXT,
direccion_benef3 TEXT,
comuna_benef3 TEXT,
ciudad_benef3 TEXT,
rut_benef4 TEXT,
nombre_benef4 TEXT,
segundo_nombre_benef4 TEXT,
paterno_benef4 TEXT,
materno_benef4 TEXT,
porcentaje_benef4 TEXT,
telefono_benef4 TEXT,
mail_benef4 TEXT,
direccion_benef4 TEXT,
comuna_benef4 TEXT,
ciudad_benef4 TEXT,
rut_benef5 TEXT,
nombre_benef5 TEXT,
segundo_nombre_benef5 TEXT,
paterno_benef5 TEXT,
materno_benef5 TEXT,
porcentaje_benef5 TEXT,
telefono_benef5 TEXT,
mail_benef5 TEXT,
direccion_benef5 TEXT,
comuna_benef5 TEXT,
ciudad_benef5 TEXT,
rut_benef6 TEXT,
nombre_benef6 TEXT,
segundo_nombre_benef6 TEXT,
paterno_benef6 TEXT,
materno_benef6 TEXT,
porcentaje_benef6 TEXT,
telefono_benef6 TEXT,
mail_benef6 TEXT,
direccion_benef6 TEXT,
comuna_benef6 TEXT,
ciudad_benef6 TEXT,
rut_benef7 TEXT,
nombre_benef7 TEXT,
segundo_nombre_benef7 TEXT,
paterno_benef7 TEXT,
materno_benef7 TEXT,
porcentaje_benef7 TEXT,
telefono_benef7 TEXT,
mail_benef7 TEXT,
direccion_benef7 TEXT,
comuna_benef7 TEXT,
ciudad_benef7 TEXT))hbh on hbh.ben_his_con_id = hfh.for_his_con_id::numeric
--left join "Genesys".his_beneficiary_history hbh on hbh.ben_his_con_id = hfh.for_his_con_id
left join chubb.log_altas_car_cla_hsp lacch on lacch.con_id = hfh.for_his_metadata::json->>'con_id'
where
hgh.ges_his_tipificacion_4 in ('ARGUMENTADO SI')
and length(for_his_genesys_id) > 30
and cc.con_genesys_campaing_id is not null
and ce.cal_eval_state is NULL
and lacch.con_id is null 
--and ce2.est_descripcion in ('OK','RECUPERADA')
and ce.cal_eval_state is null
and for_his_metadata::json->>'id_campana' in ('506d64a7-9e0f-4d01-bff0-eb3505d67275')
