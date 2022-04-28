select cc.con_id,
hfh.for_his_genesys_id,
--lacch.con_id,
 hfh.for_his_metadata::json->>'pro_cod_plan_sponsor' as cod_plan,
'05' as "CANAL",
'HGFS3' "CAMPAÑA",
hfh.for_his_metadata::json->>'CodigoOperacion' as "INDICE",
'' as "SUC_SUCREC",
'' as "SEG_FOLIO",
'' as "DV_FOLIO",
to_char(hfh.for_his_date_form::date,'YYYYMMDD') as "FECHA SOLICITUD",
'' as "CLASIFICACION EMPRESA",
split_part(hfh.for_his_metadata::json->>'Rut', '-',  1) as "RUT",
split_part(hfh.for_his_metadata::json->>'Rut', '-',  2) as "DIGITO VERIFICADOR",
UPPER(hfh.for_his_metadata::json->>'ApPaterno') as "APE_PAT",
UPPER(hfh.for_his_metadata::json->>'ApMaterno') as "APE_MAT",
UPPER(hfh.for_his_metadata::json->>'Nombre') as "NOMBRE",
to_char((hfh.for_his_metadata::json->>'Fechanacimiento')::date,'YYYYMMDD') as "FECHA DE NACIMIENTO",
'44'  as "TIPO DE SEGURO",
'hospitalizacion grupo familiar' as "DESCRIPCION SEGURO",
(case 
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','A','')='31' then 'A3'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','A','')='32' then 'A3'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','A','')='41' then 'A4'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','A','')='42' then 'A4'
 else 'A'||replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','A','') end) as "TIPO DE PLAN",
 hfh.for_his_metadata::json->>'pro_desc_plan' as "DESCRIPCION DE PLAN",
 hfh.for_his_metadata::json->>'pro_valu_plan' as "MONTO PRIMA",
''  as "TIPO CADUCIDAD",
''  as "DESCRIP CADUCIDAD",
''  as "FECHA CADUCIDAD",
'' as "TIPO DE AFILIADO",
'' as "DESCRIPCION DE AFILIADO",
cc.con_metadata::json->>'direccion' as "DIRECCION PARTICULAR",
cc.con_metadata::json->>'comuna' as "COMUNA PARTICULAR",
cc.con_metadata::json->>'ciudad' as "CIUDAD PARTICULAR",
cc.con_metadata::json->>'telefono1' as "TELEFONOS",
cc.con_metadata::json->>'telefono1' as "CELULAR",
cc.con_metadata::json->>'mail' as "EMAIL",
'' as "NO-EMAIL",
'' as "COD_TIPO",
'' as "COD_MARCA",
'' as "COD_MODELO",
'' as "ANO",
'' as "COD TIPO VEH",
'' as "PATENTE",
'' as "MOTOR",
cc.con_metadata::json->>'direccion' as "DIRECCION ASEGURADA",
'' as "COMUNA_ASEGURADA",
'' as "CIUDAD_ASEGURADA",
cc.con_metadata::json->>'ciudad' as "Código Ciudad asegurada",
cc.con_metadata::json->>'comuna' as "Código Comuna asegurada",
concat(cc.con_metadata::json->>'rut','-',cc.con_metadata::json->>'dv') as "RUT_VENDEDOR",
'' as "Nombre Vendedor (no usuario)",
'' as "Genero afiliado",
'' as "Estado civil afiliado",
------beneficiario
hbh.cod_benef1 as "COD.PARENTESCO_1",
hbh.rut_benef1 as "DESC.PARENTESCO_1",
hbh.nombre_benef1 as "RUT_BENEFICIARIO_1",
hbh.segundo_nombre_benef1 as "NOMBRES BENEFICIARIO_1",
hbh.paterno_benef1 as "APELLIDO PATERNO BENEFICIARIO_1",
hbh.materno_benef1 as "APELLIDO MATERNO BENEFICIARIO_1",
hbh.porcentaje_benef1 as "% BENEF_1",
hbh.telefono_benef1 as "Fono Beneficiario _1",
'' as "Celular Beneficiario_1",
hbh.mail_benef1 as "Mail Beneficiario_1",
hbh.direccion_benef1 as "Direccion Beneficiario_1",
hbh.comuna_benef1 as "Comuna Beneficiario_1",
hbh.ciudad_benef1 as "Cuidad Beneficiario_1",
-------------------
hbh.cod_benef2 as "COD.PARENTESCO_2",
hbh.rut_benef2 as "DESC.PARENTESCO_2",
hbh.nombre_benef2 as "RUT_BENEFICIARIO_2",
hbh.segundo_nombre_benef2 as "NOMBRES BENEFICIARIO_2",
hbh.paterno_benef2 as "APELLIDO PATERNO BENEFICIARIO_2",
hbh.materno_benef2 as "APELLIDO MATERNO BENEFICIARIO_2",
hbh.porcentaje_benef2 as "% BENEF_2",
hbh.telefono_benef2 as "Fono Beneficiario _2",
'' as "Celular Beneficiario_2",
hbh.mail_benef2 as "Mail Beneficiario_2",
hbh.direccion_benef2 as "Direccion Beneficiario_2",
hbh.comuna_benef2 as "Comuna Beneficiario_2",
hbh.ciudad_benef2 as "Cuidad Beneficiario_2",
------------------
hbh.cod_benef3 as "COD.PARENTESCO_3",
hbh.rut_benef3 as "DESC.PARENTESCO_3",
hbh.nombre_benef3 as "RUT_BENEFICIARIO_3",
hbh.segundo_nombre_benef3 as "NOMBRES BENEFICIARIO_3",
hbh.paterno_benef3 as "APELLIDO PATERNO BENEFICIARIO_3",
hbh.materno_benef3 as "APELLIDO MATERNO BENEFICIARIO_3",
hbh.porcentaje_benef3 as "% BENEF_3",
hbh.telefono_benef3 as "Fono Beneficiario _3",
'' as "Celular Beneficiario_3",
hbh.mail_benef3 as "Mail Beneficiario_3",
hbh.direccion_benef3 as "Direccion Beneficiario_3",
hbh.comuna_benef3 as "Comuna Beneficiario_3",
hbh.ciudad_benef3 as "Cuidad Beneficiario_3",
-------------------
hbh.cod_benef4 as "COD.PARENTESCO_4",
hbh.rut_benef4 as "DESC.PARENTESCO_4",
hbh.nombre_benef4 as "RUT_BENEFICIARIO_4",
hbh.segundo_nombre_benef4 as "NOMBRES BENEFICIARIO_4",
hbh.paterno_benef4 as "APELLIDO PATERNO BENEFICIARIO_4",
hbh.materno_benef4 as "APELLIDO MATERNO BENEFICIARIO_4",
hbh.porcentaje_benef4 as "% BENEF_4",
hbh.telefono_benef4 as "Fono Beneficiario _4",
'' as "Celular Beneficiario_4",
hbh.mail_benef4 as "Mail Beneficiario_4",
hbh.direccion_benef4 as "Direccion Beneficiario_4",
hbh.comuna_benef4 as "Comuna Beneficiario_4",
hbh.ciudad_benef4 as "Cuidad Beneficiario_4",
-------------------
hbh.cod_benef5 as "COD.PARENTESCO_5",
hbh.rut_benef5 as "DESC.PARENTESCO_5",
hbh.nombre_benef5 as "RUT_BENEFICIARIO_5",
hbh.segundo_nombre_benef5 as "NOMBRES BENEFICIARIO_5",
hbh.paterno_benef5 as "APELLIDO PATERNO BENEFICIARIO_5",
hbh.materno_benef5 as "APELLIDO MATERNO BENEFICIARIO_5",
hbh.porcentaje_benef5 as "% BENEF_5",
hbh.telefono_benef5 as "Fono Beneficiario _5",
'' as "Celular Beneficiario_5",
hbh.mail_benef5 as "Mail Beneficiario_5",
hbh.direccion_benef5 as "Direccion Beneficiario_5",
hbh.comuna_benef5 as "Comuna Beneficiario_5",
hbh.ciudad_benef5 as "Cuidad Beneficiario_5",
-------------------
hbh.cod_benef6 as "COD.PARENTESCO_6",
hbh.rut_benef6 as "DESC.PARENTESCO_6",
hbh.nombre_benef6 as "RUT_BENEFICIARIO_6",
hbh.segundo_nombre_benef6 as "NOMBRES BENEFICIARIO_6",
hbh.paterno_benef6 as "APELLIDO PATERNO BENEFICIARIO_6",
hbh.materno_benef6 as "APELLIDO MATERNO BENEFICIARIO_6",
hbh.porcentaje_benef6 as "% BENEF_6",
hbh.telefono_benef6 as "Fono Beneficiario _6",
'' as "Celular Beneficiario_6",
hbh.mail_benef6 as "Mail Beneficiario_6",
hbh.direccion_benef6 as "Direccion Beneficiario_6",
hbh.comuna_benef6 as "Comuna Beneficiario_6",
hbh.ciudad_benef6 as "Cuidad Beneficiario_6",
-------------------
hbh.cod_benef7 as "COD.PARENTESCO_7",
hbh.rut_benef7 as "DESC.PARENTESCO_7",
hbh.nombre_benef7 as "RUT_BENEFICIARIO_7",
hbh.segundo_nombre_benef7 as "NOMBRES BENEFICIARIO_7",
hbh.paterno_benef7 as "APELLIDO PATERNO BENEFICIARIO_7",
hbh.materno_benef7 as "APELLIDO MATERNO BENEFICIARIO_7",
hbh.porcentaje_benef7 as "% BENEF_7",
hbh.telefono_benef7 as "Fono Beneficiario _7",
'' as "Celular Beneficiario_7",
hbh.mail_benef7 as "Mail Beneficiario_7",
hbh.direccion_benef7 as "Direccion Beneficiario_7",
hbh.comuna_benef7 as "Comuna Beneficiario_7",
hbh.ciudad_benef7 as "Cuidad Beneficiario_7",
------Adicional
hah.cod_adi1  as "COD.PARENTESCO_1",
hah.rut_adi1  as "DESC.PARENTESCO_1",
hah.nombre_adi1  as "RUT_ADICIONAL_1",
hah.segundo_nombre_adi1  as "NOMBRES ADICIONAL_1",
hah.paterno_adi1  as "APELLIDO PATERNO ADICIONAL_1",
hah.materno_adi1  as "APELLIDO MATERNO ADICIONAL_1",
hah.porcentaje_adi1  as "% ADIC_1",
hah.telefono_adi1  as "Fono ADICIONAL_1",
'' as "Celular ADICIONAL_1",
hah.mail_adi1  as "Mail ADICIONAL_1",
hah.direccion_adi1  as "Direccion ADICIONAL_1",
hah.comuna_adi1  as "Comuna ADICIONAL_1",
hah.ciudad_adi1  as "Cuidad ADICIONAL_1",
-------------------
hah.cod_adi2  as "COD.PARENTESCO_2",
hah.rut_adi2  as "DESC.PARENTESCO_2",
hah.nombre_adi2  as "RUT_ADICIONAL_2",
hah.segundo_nombre_adi2  as "NOMBRES ADICIONAL_2",
hah.paterno_adi2  as "APELLIDO PATERNO ADICIONAL_2",
hah.materno_adi2  as "APELLIDO MATERNO ADICIONAL_2",
hah.porcentaje_adi2  as "% ADIC_2",
hah.telefono_adi2  as "Fono ADICIONAL_2",
'' as "Celular ADICIONAL_2",
hah.mail_adi2  as "Mail ADICIONAL_2",
hah.direccion_adi2  as "Direccion ADICIONAL_2",
hah.comuna_adi2  as "Comuna ADICIONAL_2",
hah.ciudad_adi2  as "Cuidad ADICIONAL_2",
------------------
hah.cod_adi3  as "COD.PARENTESCO_3",
hah.rut_adi3  as "DESC.PARENTESCO_3",
hah.nombre_adi3  as "RUT_ADICIONAL_3",
hah.segundo_nombre_adi3  as "NOMBRES ADICIONAL_3",
hah.paterno_adi3  as "APELLIDO PATERNO ADICIONAL_3",
hah.materno_adi3  as "APELLIDO MATERNO ADICIONAL_3",
hah.porcentaje_adi3  as "% ADIC_3",
hah.telefono_adi3  as "Fono ADICIONAL_3",
'' as "Celular ADICIONAL_3",
hah.mail_adi3  as "Mail ADICIONAL_3",
hah.direccion_adi3  as "Direccion ADICIONAL_3",
hah.comuna_adi3  as "Comuna ADICIONAL_3",
hah.ciudad_adi3  as "Cuidad ADICIONAL_3",
-------------------
hah.cod_adi4  as "COD.PARENTESCO_4",
hah.rut_adi4  as "DESC.PARENTESCO_4",
hah.nombre_adi4  as "RUT_ADICIONAL_4",
hah.segundo_nombre_adi4  as "NOMBRES ADICIONAL_4",
hah.paterno_adi4  as "APELLIDO PATERNO ADICIONAL_4",
hah.materno_adi4  as "APELLIDO MATERNO ADICIONAL_4",
hah.porcentaje_adi4  as "% ADIC_4",
hah.telefono_adi4  as "Fono ADICIONAL_4",
'' as "Celular ADICIONAL_4",
hah.mail_adi4  as "Mail ADICIONAL_4",
hah.direccion_adi4  as "Direccion ADICIONAL_4",
hah.comuna_adi4  as "Comuna ADICIONAL_4",
hah.ciudad_adi4  as "Cuidad ADICIONAL_4",
-------------------
hah.cod_adi5  as "COD.PARENTESCO_5",
hah.rut_adi5  as "DESC.PARENTESCO_5",
hah.nombre_adi5  as "RUT_ADICIONAL_5",
hah.segundo_nombre_adi5  as "NOMBRES ADICIONAL_5",
hah.paterno_adi5  as "APELLIDO PATERNO ADICIONAL_5",
hah.materno_adi5  as "APELLIDO MATERNO ADICIONAL_5",
hah.porcentaje_adi5  as "% ADIC_5",
hah.telefono_adi5  as "Fono ADICIONAL_5",
'' as "Celular ADICIONAL_5",
hah.mail_adi5  as "Mail ADICIONAL_5",
hah.direccion_adi5  as "Direccion ADICIONAL_5",
hah.comuna_adi5  as "Comuna ADICIONAL_5",
hah.ciudad_adi5  as "Cuidad ADICIONAL_5",
-------------------
hah.cod_adi6  as "COD.PARENTESCO_6",
hah.rut_adi6  as "DESC.PARENTESCO_6",
hah.nombre_adi6  as "RUT_ADICIONAL_6",
hah.segundo_nombre_adi6  as "NOMBRES ADICIONAL_6",
hah.paterno_adi6  as "APELLIDO PATERNO ADICIONAL_6",
hah.materno_adi6  as "APELLIDO MATERNO ADICIONAL_6",
hah.porcentaje_adi6  as "% ADIC_6",
hah.telefono_adi6  as "Fono ADICIONAL_6",
'' as "Celular ADICIONAL_6",
hah.mail_adi6  as "Mail ADICIONAL_6",
hah.direccion_adi6  as "Direccion ADICIONAL_6",
hah.comuna_adi6  as "Comuna ADICIONAL_6",
hah.ciudad_adi6  as "Cuidad ADICIONAL_6",
-------------------
hah.cod_adi7  as "COD.PARENTESCO_7",
hah.rut_adi7  as "DESC.PARENTESCO_7",
hah.nombre_adi7  as "RUT_ADICIONAL_7",
hah.segundo_nombre_adi7  as "NOMBRES ADICIONAL_7",
hah.paterno_adi7  as "APELLIDO PATERNO ADICIONAL_7",
hah.materno_adi7  as "APELLIDO MATERNO ADICIONAL_7",
hah.porcentaje_adi7  as "% ADIC_7",
hah.telefono_adi7  as "Fono ADICIONAL_7",
'' as "Celular ADICIONAL_7",
hah.mail_adi7  as "Mail ADICIONAL_7",
hah.direccion_adi7  as "Direccion ADICIONAL_7",
hah.comuna_adi7  as "Comuna ADICIONAL_7",
hah.ciudad_adi7  as "Cuidad ADICIONAL_7"
FROM "Genesys".his_form_history hfh
left join "Genesys".cam_contact cc on cc.con_id::varchar = for_his_con_id
left join "Genesys".his_gestion_history hgh on	hgh.ges_his_genesys_id = hfh.for_his_genesys_id
left join calidad_app.cal_assignments ca on	ca.cal_assig_interaction = hfh.for_his_genesys_id and hfh.for_his_con_id::varchar = ca.cal_assig_contact
left join calidad_app.cal_evaluations ce on ce.cal_eval_interaction = hfh.for_his_genesys_id
left join calidad_app.cal_estado ce2 on ce2.est_id::varchar = ce.cal_eval_typing
left join "Genesys".pro_desc_cam pdc on pdc.pro_cod_plan = hfh.for_his_metadata::json->>'pro_cod_plan_sponsor'
left join chubb.log_altas_car_cla_hsp lacch on lacch.con_id = hfh.for_his_metadata::json->>'con_id'
left join (SELECT
mi_resultado.ben_his_con_id,
mi_resultado.cod_benef1 as cod_benef1,
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
---------------------------
mi_resultado.cod_benef2 as cod_benef2,
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
-----------------------
mi_resultado.cod_benef3 as cod_benef3,
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
------------------------
mi_resultado.cod_benef4 as cod_benef4,
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
--------------------------
mi_resultado.cod_benef5 as cod_benef5,
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
-------------------------
mi_resultado.cod_benef6 as cod_benef6,
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
--------------------------
mi_resultado.cod_benef7 as cod_benef7,
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
SELECT hbh.ben_his_con_id::int, (ben_his_id-subquery.ben_his_con_id::int)||''101'' as categoria,case
when hbh.ben_his_metadata::json->>''Parentesco'' is null then '' ''
   else hbh.ben_his_metadata::json->>''Parentesco''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''

union
SELECT hbh.ben_his_con_id::int, (ben_his_id-subquery.ben_his_con_id::int)||''102'' as categoria,case
when hbh.ben_his_metadata::json->>''Rut'' is null then '' ''
   else hbh.ben_his_metadata::json->>''Rut''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''

union
SELECT hbh.ben_his_con_id::int, (ben_his_id-subquery.ben_his_con_id::int)||''103'' as categoria,case
when hbh.ben_his_metadata::json->>''Nombre'' is null then '' ''
   else hbh.ben_his_metadata::json->>''Nombre''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''

union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''104'' as categoria,case
when hbh.ben_his_metadata::json->>''SegundoNombre'' is null then '' ''
   else hbh.ben_his_metadata::json->>''SegundoNombre''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''

union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''105'' as categoria,case
when hbh.ben_his_metadata::json->>''ApPaterno'' is null then '' ''
   else hbh.ben_his_metadata::json->>''ApPaterno''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''

union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''106'' as categoria,case
when hbh.ben_his_metadata::json->>''ApMaterno'' is null then '' ''
   else hbh.ben_his_metadata::json->>''ApMaterno''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''

union
SELECT hbh.ben_his_con_id::int, (ben_his_id-subquery.ben_his_con_id::int)||''107'' as categoria,case
when hbh.ben_his_metadata::json->>''Porcentaje'' is null then '' ''
   else hbh.ben_his_metadata::json->>''Porcentaje''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''

union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''108'' as categoria,case
when hbh.ben_his_metadata::json->>''Telefono'' is null then '' ''
   else hbh.ben_his_metadata::json->>''Telefono''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''

union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''109'' as categoria,case
when hbh.ben_his_metadata::json->>''Mail'' is null then '' ''
   else hbh.ben_his_metadata::json->>''Mail''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''

union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''110'' as categoria,case
when hbh.ben_his_metadata::json->>''Direccion'' is null then '' ''
   else hbh.ben_his_metadata::json->>''Direccion''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''

union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''111'' as categoria,case
when hbh.ben_his_metadata::json->>''Comuna'' is null then '' ''
   else hbh.ben_his_metadata::json->>''Comuna''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''

union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''112'' as categoria,case
when hbh.ben_his_metadata::json->>''Ciudad'' is null then '' ''
   else hbh.ben_his_metadata::json->>''Ciudad''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
order by ben_his_con_id,categoria'::text) mi_resultado(ben_his_con_id integer,
cod_benef1 text,
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
ciudad_benef1 text,
-------------------
cod_benef2 text,
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
------------------
cod_benef3 text,
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
-------------------
cod_benef4 text,
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
-------------------
cod_benef5 text,
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
-------------------
cod_benef6 text,
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
-------------------
cod_benef7 text,
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
ciudad_benef7 TEXT)) hbh on hbh.ben_his_con_id = hfh.for_his_con_id::numeric
left join (SELECT
mi_resultado.adi_his_con_id,
mi_resultado.cod_adi1 as cod_adi1,
'' as cod_aseg1,
mi_resultado.rut_adi1,
mi_resultado.nombre_adi1,
mi_resultado.segundo_nombre_adi1,
mi_resultado.paterno_adi1,
mi_resultado.materno_adi1,
mi_resultado.porcentaje_adi1,
mi_resultado.telefono_adi1,
'' as cel_adi1,
mi_resultado.mail_adi1,
mi_resultado.direccion_adi1,
mi_resultado.comuna_adi1,
mi_resultado.ciudad_adi1,
---------------------------
mi_resultado.cod_adi2 as cod_adi2,
'' as cod_aseg2,
mi_resultado.rut_adi2,
mi_resultado.nombre_adi2,
mi_resultado.segundo_nombre_adi2,
mi_resultado.paterno_adi2,
mi_resultado.materno_adi2,
mi_resultado.porcentaje_adi2,
mi_resultado.telefono_adi2,
'' as cel_adi2,
mi_resultado.mail_adi2,
mi_resultado.direccion_adi2,
mi_resultado.comuna_adi2,
mi_resultado.ciudad_adi2,
-----------------------
mi_resultado.cod_adi3 as cod_adi3,
'' as cod_aseg3,
mi_resultado.rut_adi3,
mi_resultado.nombre_adi3,
mi_resultado.segundo_nombre_adi3,
mi_resultado.paterno_adi3,
mi_resultado.materno_adi3,
mi_resultado.porcentaje_adi3,
mi_resultado.telefono_adi3,
'' as cel_adi3,
mi_resultado.mail_adi3,
mi_resultado.direccion_adi3,
mi_resultado.comuna_adi3,
mi_resultado.ciudad_adi3,
------------------------
mi_resultado.cod_adi4 as cod_adi4,
'' as cod_aseg4,
mi_resultado.rut_adi4,
mi_resultado.nombre_adi4,
mi_resultado.segundo_nombre_adi4,
mi_resultado.paterno_adi4,
mi_resultado.materno_adi4,
mi_resultado.porcentaje_adi4,
mi_resultado.telefono_adi4,
'' as cel_adi4,
mi_resultado.mail_adi4,
mi_resultado.direccion_adi4,
mi_resultado.comuna_adi4,
mi_resultado.ciudad_adi4,
--------------------------
mi_resultado.cod_adi5 as cod_adi5,
'' as cod_aseg5,
mi_resultado.rut_adi5,
mi_resultado.nombre_adi5,
mi_resultado.segundo_nombre_adi5,
mi_resultado.paterno_adi5,
mi_resultado.materno_adi5,
mi_resultado.porcentaje_adi5,
mi_resultado.telefono_adi5,
'' as cel_adi5,
mi_resultado.mail_adi5,
mi_resultado.direccion_adi5,
mi_resultado.comuna_adi5,
mi_resultado.ciudad_adi5,
-------------------------
mi_resultado.cod_adi6 as cod_adi6,
'' as cod_aseg6,
mi_resultado.rut_adi6,
mi_resultado.nombre_adi6,
mi_resultado.segundo_nombre_adi6,
mi_resultado.paterno_adi6,
mi_resultado.materno_adi6,
mi_resultado.porcentaje_adi6,
mi_resultado.telefono_adi6,
'' as cel_adi6,
mi_resultado.mail_adi6,
mi_resultado.direccion_adi6,
mi_resultado.comuna_adi6,
mi_resultado.ciudad_adi6,
--------------------------
mi_resultado.cod_adi7 as cod_adi7,
'' as cod_aseg7,
mi_resultado.rut_adi7,
mi_resultado.nombre_adi7,
mi_resultado.segundo_nombre_adi7,
mi_resultado.paterno_adi7,
mi_resultado.materno_adi7,
mi_resultado.porcentaje_adi7,
mi_resultado.telefono_adi7,
'' as cel_adi7,
mi_resultado.mail_adi7,
mi_resultado.direccion_adi7,
mi_resultado.comuna_adi7,
mi_resultado.ciudad_adi7
from crosstab('
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''101'' as categoria,case
when hah.adi_his_metadata::json->>''Parentesco'' is null then '' ''
	 else hah.adi_his_metadata::json->>''Parentesco''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union 
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''102'' as categoria,case
when hah.adi_his_metadata::json->>''Rut'' is null then '' ''
	 else hah.adi_his_metadata::json->>''Rut''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union 
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''103'' as categoria,case
when hah.adi_his_metadata::json->>''Nombre'' is null then ''''
	 else hah.adi_his_metadata::json->>''Nombre''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''104'' as categoria,case
when hah.adi_his_metadata::json->>''SegundoNombre'' is null then ''''
	 else hah.adi_his_metadata::json->>''SegundoNombre''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''105'' as categoria,case
when hah.adi_his_metadata::json->>''ApPaterno'' is null then ''''
	 else hah.adi_his_metadata::json->>''ApPaterno''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''106'' as categoria,case
when hah.adi_his_metadata::json->>''ApMaterno'' is null then ''''
	 else hah.adi_his_metadata::json->>''ApMaterno''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''107'' as categoria,case
when hah.adi_his_metadata::json->>''Porcentaje'' is null then ''''
	 else hah.adi_his_metadata::json->>''Porcentaje''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''108'' as categoria,case
when hah.adi_his_metadata::json->>''Telefono'' is null then '' ''
	 else hah.adi_his_metadata::json->>''Telefono''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''109'' as categoria,case
when hah.adi_his_metadata::json->>''Mail'' is null then ''''
	 else hah.adi_his_metadata::json->>''Mail''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''110'' as categoria,case
when hah.adi_his_metadata::json->>''Direccion'' is null then ''''
	 else hah.adi_his_metadata::json->>''Direccion''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''111'' as categoria,case
when hah.adi_his_metadata::json->>''Comuna'' is null then ''''
	 else hah.adi_his_metadata::json->>''Comuna''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''112'' as categoria,case
when hah.adi_his_metadata::json->>''Ciudad'' is null then ''''
	 else hah.adi_his_metadata::json->>''Ciudad''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
order by adi_his_con_id,categoria'::text) mi_resultado(adi_his_con_id integer,
cod_adi1 text,
rut_adi1 TEXT,
nombre_adi1 TEXT,
segundo_nombre_adi1 TEXT,
paterno_adi1 TEXT,
materno_adi1 TEXT,
porcentaje_adi1 TEXT,
telefono_adi1 TEXT,
mail_adi1 TEXT,
direccion_adi1 TEXT,
comuna_adi1 TEXT,
ciudad_adi1 text,
-------------------
cod_adi2 text,
rut_adi2 TEXT,
nombre_adi2 TEXT,
segundo_nombre_adi2 TEXT,
paterno_adi2 TEXT,
materno_adi2 TEXT,
porcentaje_adi2 TEXT,
telefono_adi2 TEXT,
mail_adi2 TEXT,
direccion_adi2 TEXT,
comuna_adi2 TEXT,
ciudad_adi2 TEXT,
------------------
cod_adi3 text,
rut_adi3 TEXT,
nombre_adi3 TEXT,
segundo_nombre_adi3 TEXT,
paterno_adi3 TEXT,
materno_adi3 TEXT,
porcentaje_adi3 TEXT,
telefono_adi3 TEXT,
mail_adi3 TEXT,
direccion_adi3 TEXT,
comuna_adi3 TEXT,
ciudad_adi3 TEXT,
-------------------
cod_adi4 text,
rut_adi4 TEXT,
nombre_adi4 TEXT,
segundo_nombre_adi4 TEXT,
paterno_adi4 TEXT,
materno_adi4 TEXT,
porcentaje_adi4 TEXT,
telefono_adi4 TEXT,
mail_adi4 TEXT,
direccion_adi4 TEXT,
comuna_adi4 TEXT,
ciudad_adi4 TEXT,
-------------------
cod_adi5 text,
rut_adi5 TEXT,
nombre_adi5 TEXT,
segundo_nombre_adi5 TEXT,
paterno_adi5 TEXT,
materno_adi5 TEXT,
porcentaje_adi5 TEXT,
telefono_adi5 TEXT,
mail_adi5 TEXT,
direccion_adi5 TEXT,
comuna_adi5 TEXT,
ciudad_adi5 TEXT,
-------------------
cod_adi6 text,
rut_adi6 TEXT,
nombre_adi6 TEXT,
segundo_nombre_adi6 TEXT,
paterno_adi6 TEXT,
materno_adi6 TEXT,
porcentaje_adi6 TEXT,
telefono_adi6 TEXT,
mail_adi6 TEXT,
direccion_adi6 TEXT,
comuna_adi6 TEXT,
ciudad_adi6 TEXT,
-------------------
cod_adi7 text,
rut_adi7 TEXT,
nombre_adi7 TEXT,
segundo_nombre_adi7 TEXT,
paterno_adi7 TEXT,
materno_adi7 TEXT,
porcentaje_adi7 TEXT,
telefono_adi7 TEXT,
mail_adi7 TEXT,
direccion_adi7 TEXT,
comuna_adi7 TEXT,
ciudad_adi7 TEXT)) hah on hah.adi_his_con_id = hfh.for_his_con_id::numeric
--left join "Genesys".his_beneficiary_history hbh on  hbh.ben_his_id = hfh.for_his_id 
where
hgh.ges_his_tipificacion_4 in ('ARGUMENTADO SI')
and length(for_his_genesys_id) > 30
and cc.con_genesys_campaing_id is not null
and ce.cal_eval_state is NULL
and lacch.con_id is null 
and ce2.est_id in (1,4,14)
and ce.cal_eval_state is null
and for_his_metadata::json->>'id_campana' in ('506d64a7-9e0f-4d01-bff0-eb3505d67275')