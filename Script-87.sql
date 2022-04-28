select
a.idunico as "con_id",
to_char(fecha::date, 'YYYY/MM/DD'),
cod_venta as "id_interaccion",
'2' as "CALL ORIGNE",
'07' as "CANAL VENTA PROPUESTA",
'Hospitali' as "CAMPAÑA TMK",
folio as "INDICE TMK",
'8149' as "CODIGO PRODUCTO",
'219081340' as "POLIZA",
to_char(now(),'DD/MM/YYYY') as "FECHA SOLICITUD",
(case 
 when replace(a.plan,'A','')='31' then '03'
 when replace(a.plan,'A','')='32' then '03'
 when replace(a.plan,'A','')='41' then '04'
 when replace(a.plan,'A','')='42' then '04'
 else '0'||replace(a.plan,'A','') end) as "PLAN TIT"
,nombre_asegurado  as "NOMBRES"
,paterno_asegurado  as "APELLIDO PATERNO TIT"
,replace(materno_asegurado, '.', '')  as "APELLIDO MATERNO TIT"
,substring(rut_aseg,1,position('-' in rut_aseg)-1) as "RUT TIT"
,substring(rut_aseg,position('-' in rut_aseg)+1,1) as "DIGITO VERIFICADOR TIT"
,fono_venta as  "TELEFONO PARTICULAR TIT"
,fono_venta as "MOVIL PARTICULAR TIT"
,isnull(case when mail_venta = 'NO@NO' then ''
 when mail_venta  = 'NAN@NAN' then ''
else mail_venta end,'') as "CORREO TIT"
,genero_cli  as "GENERO TIT"
,fec_nac_aseg  as "FECHA DE NACIMIENTO TIT"
,direccion_venta as "DIRECCION PARTICULAR TIT"
,r.comuna_ccla  as "COMUNA PARTICULAR TIT"
,r.ciudad_ccla  as "CIUDAD PARTICULAR TIT"
,isnull(pais_cli,'152') as "PAIS RESIDENCIA"
,isnull(nacionalidad_cli, '152')  as "NACIONALIDAD TIT"
,(case
when replace(a.plan,'A','')='31' then '0.3493'
when replace(a.plan,'A','')='32' then '0.3493'
when replace(a.plan,'A','')='41' then '0.4034'
when replace(a.plan,'A','')='42' then '0.4034'
when replace(a.plan,'A','')='1' then '0.2593'
when replace(a.plan,'A','')='2' then '0.3133'
else '' end
 )as "PRIMA TIT"
,isnull(ocupacion_cli, '00000')  as "PROFESION TIT"
,(case 
 when replace(a.plan,'A','')='31' then '03'
 when replace(a.plan,'A','')='32' then '03'
 when replace(a.plan,'A','')='41' then '04'
 when replace(a.plan,'A','')='42' then '04'
 else '0'||replace(a.plan,'A','') end) as "PLAN CONT"
,nombre_asegurado  as "NOMBRES CONT"
,paterno_asegurado  as "APELLIDO PATERNO CONT"
,replace(materno_asegurado, '.', '')   as "APELLIDO MATERNO CONT"
,substring(rut_aseg,1,position('-' in rut_aseg)-1) as "RUT CONT"
,substring(rut_aseg,position('-' in rut_aseg)+1,1) as "DIGITO VERIFICADOR CONT"
,fono_venta as  "TELEFONO PARTICULAR CONT"
,fono_venta as "MOVIL PARTICULAR CONT"
,isnull(case when mail_venta = 'NO@NO' then ''
 when mail_venta  = 'NAN@NAN' then ''
else mail_venta end,'')  as "CORREO CONT"
,genero_cli  as "GENERO CONT"
,fec_nac_aseg  as "FECHA DE NACIMIENTO CONT"
,direccion_venta as "DIRECCION PARTICULAR CONT"
,r.comuna_ccla  as "COMUNA PARTICULAR CONT"
,r.ciudad_ccla  as "CIUDAD PARTICULAR CONT"
,isnull(pais_cli, '152')  as "PAIS RESIDENCIA CONT"
,isnull(nacionalidad_cli, '152')  as "NACIONALIDAD CONT"
,(case
when replace(a.plan,'A','')='31' then '0.3493'
when replace(a.plan,'A','')='32' then '0.3493'
when replace(a.plan,'A','')='41' then '0.4034'
when replace(a.plan,'A','')='42' then '0.4034'
when replace(a.plan,'A','')='1' then '0.2593'
when replace(a.plan,'A','')='2' then '0.3133'
else '' end
) as "PRIMA CONT"
,isnull(ocupacion_cli, '00000')  as "PROFESION CONT"
,(case 
 when replace(a.plan,'A','')='31' then '03'
 when replace(a.plan,'A','')='32' then '03'
 when replace(a.plan,'A','')='41' then '04'
 when replace(a.plan,'A','')='42' then '04'
 else '0'||replace(a.plan,'A','') end) as "PLAN PAG"
,nombre_asegurado  as "NOMBRES PAG"
,paterno_asegurado  as "APELLIDO PATERNO PAG"
,replace(materno_asegurado, '.', '')  as "APELLIDO MATERNO PAG"
,substring(rut_aseg,1,position('-' in rut_aseg)-1) as "RUT PAG"
,substring(rut_aseg,position('-' in rut_aseg)+1,1) as "DIGITO VERIFICADOR PAG"
,fono_venta as  "TELEFONO PARTICULAR PAG"
,fono_venta as "MOVIL PARTICULAR PAG"
,isnull(case when mail_venta = 'NO@NO' then ''
 when mail_venta  = 'NAN@NAN' then ''
else mail_venta end,'')  as "CORREO PAG"
,genero_cli  as "GENERO PAG"
,fec_nac_aseg  as "FECHA DE NACIMIENTO PAG"
,direccion_venta as "DIRECCION PARTICULAR PAG"
,r.comuna_ccla  as "COMUNA PARTICULAR PAG"
,r.ciudad_ccla  as "CIUDAD PARTICULAR PAG"
,isnull(pais_cli,'152')  as "PAIS RESIDENCIA PAG"
,isnull(nacionalidad_cli, '152') as "NACIONALIDAD PAG"
,(case
when replace(a.plan,'A','')='31' then '0.3493'
when replace(a.plan,'A','')='32' then '0.3493'
when replace(a.plan,'A','')='41' then '0.4034'
when replace(a.plan,'A','')='42' then '0.4034'
when replace(a.plan,'A','')='1' then '0.2593'
when replace(a.plan,'A','')='2' then '0.3133'
else '' end
) as "PRIMA PAG"
,isnull(ocupacion_cli, '00000') as "PROFESION PAG",
-----Adicionales
(case when (trim(hah.nombre_adi1) <> '' or hah.nombre_adi1 is not null)
then (
case
 when replace(a.plan,'A','')='31' then '03'
 when replace(a.plan,'A','')='32' then '03'
 when replace(a.plan,'A','')='41' then '04'
 when replace(a.plan,'A','')='42' then '04'
 else '0'||replace(a.plan,'A','') end) else '' end)
 as "PLAN AD1",
isnull(hah.nombre_adi1 ,'') as "NOMBRES AD1",
isnull(hah.paterno_adi1,'') as "APELLIDO PATERNO AD1",
isnull(hah.materno_adi1,'') as "APELLIDO MATERNO AD1",
isnull(split_part(hah.rut_adi1, '-', 1) ,'') as "RUT AD1",
isnull(split_part(hah.rut_adi1, '-', 2) ,'') as "DIGITO VERIFICADOR AD1",
'' as "TELEFONO PARTICULAR AD1",
'' as "MOVIL PARTICULAR AD1",
'' as "Mail AD1",
isnull(hah.fecha_nacimiento_adi1 ,'') as "FEC_NACIMIENTO AD1",
'' as "DIRECCION PARTICULAR AD1",
'' as "COMUNA PARTICULAR AD1",
'' as "CIUDAD PARTICULAR AD1",
isnull(hah.parentesco_adi1, '') as "PARENTESCO AD1",
(case when (trim(hah.nombre_adi1) <> '' or hah.nombre_adi1 is not null)
then '0'
else '' end) as "PRIMA AD1",
(case when (trim(hah.nombre_adi2) <> '' or hah.nombre_adi2 is not null)
then (
case
 when replace(a.plan,'A','')='31' then '03'
 when replace(a.plan,'A','')='32' then '03'
 when replace(a.plan,'A','')='41' then '04'
 when replace(a.plan,'A','')='42' then '04'
 else '0'||replace(a.plan,'A','') end) else '' end) as "PLAN AD2",
isnull(hah.nombre_adi2 ,'') as "NOMBRES AD2",
isnull(hah.paterno_adi2,'') as "APELLIDO PATERNO AD2",
isnull(hah.materno_adi2,'') as "APELLIDO MATERNO AD2",
isnull(split_part(hah.rut_adi2, '-', 1) ,'') as "RUT AD2",
isnull(split_part(hah.rut_adi2, '-', 2) ,'') as "DIGITO VERIFICADOR AD2",
'' as "TELEFONO PARTICULAR AD2",
'' as "MOVIL PARTICULAR AD2",
'' as "Mail AD2",
isnull(hah.fecha_nacimiento_adi2 ,'') as "FEC_NACIMIENTO AD2",
'' as "DIRECCION PARTICULAR AD2",
'' as "COMUNA PARTICULAR AD2",
'' as "CIUDAD PARTICULAR AD2",
isnull(hah.parentesco_adi2, '') as "PARENTESCO AD2",
(case when (trim(hah.nombre_adi2) <> '' or hah.nombre_adi2 is not null)
then '0'
else '' end) as "PRIMA AD2",
(case when (trim(hah.nombre_adi3) <> '' or hah.nombre_adi3 is not null)
then (
case
 when replace(a.plan,'A','')='31' then '03'
 when replace(a.plan,'A','')='32' then '03'
 when replace(a.plan,'A','')='41' then '04'
 when replace(a.plan,'A','')='42' then '04'
 else '0'||replace(a.plan,'A','') end) else '' end) as "PLAN AD3",
isnull(hah.nombre_adi3 ,'') as "NOMBRES AD3",
isnull(hah.paterno_adi3,'') as "APELLIDO PATERNO AD3",
isnull(hah.materno_adi3,'') as "APELLIDO MATERNO AD3",
isnull(split_part(hah.rut_adi3, '-', 1) ,'') as "RUT AD3",
isnull(split_part(hah.rut_adi3, '-', 2) ,'') as "DIGITO VERIFICADOR AD3",
'' as "TELEFONO PARTICULAR AD3",
'' as "MOVIL PARTICULAR AD3",
'' as "Mail AD3",
isnull(hah.fecha_nacimiento_adi3 ,'') as "FEC_NACIMIENTO AD3",
'' as "DIRECCION PARTICULAR AD3",
'' as "COMUNA PARTICULAR AD3",
'' as "CIUDAD PARTICULAR AD3",
isnull(hah.parentesco_adi3, '') as "PARENTESCO AD3",
(case when (trim(hah.nombre_adi3) <> '' or hah.nombre_adi3 is not null)
then '0'
else '' end) as "PRIMA AD3",
(case when (trim(hah.nombre_adi4) <> '' or hah.nombre_adi4 is not null)
then (
case
 when replace(a.plan,'A','')='31' then '03'
 when replace(a.plan,'A','')='32' then '03'
 when replace(a.plan,'A','')='41' then '04'
 when replace(a.plan,'A','')='42' then '04'
 else '0'||replace(a.plan,'A','') end) else '' end) as "PLAN AD4",
isnull(hah.nombre_adi4 ,'') as "NOMBRES AD4",
isnull(hah.paterno_adi4,'') as "APELLIDO PATERNO AD4",
isnull(hah.materno_adi4,'') as "APELLIDO MATERNO AD4",
isnull(split_part(hah.rut_adi4, '-', 1) ,'') as "RUT AD4",
isnull(split_part(hah.rut_adi4, '-', 2) ,'') as "DIGITO VERIFICADOR AD4",
'' as "TELEFONO PARTICULAR AD4",
'' as "MOVIL PARTICULAR AD4",
'' as "Mail AD4",
isnull(hah.fecha_nacimiento_adi4 ,'') as "FEC_NACIMIENTO AD4",
'' as "DIRECCION PARTICULAR AD4",
'' as "COMUNA PARTICULAR AD4",
'' as "CIUDAD PARTICULAR AD4",
isnull(hah.parentesco_adi4, '') as "PARENTESCO AD4",
(case when (trim(hah.nombre_adi4) <> '' or hah.nombre_adi4 is not null)
then '0'
else '' end) as "PRIMA AD4",
(case when (trim(hah.nombre_adi5) <> '' or hah.nombre_adi5 is not null)
then (
case
 when replace(a.plan,'A','')='31' then '03'
 when replace(a.plan,'A','')='32' then '03'
 when replace(a.plan,'A','')='41' then '04'
 when replace(a.plan,'A','')='42' then '04'
 else '0'||replace(a.plan,'A','') end) else '' end) as "PLAN AD5",
isnull(hah.nombre_adi5 ,'') as "NOMBRES AD5",
isnull(hah.paterno_adi5,'') as "APELLIDO PATERNO AD5",
isnull(hah.materno_adi5,'') as "APELLIDO MATERNO AD5",
isnull(split_part(hah.rut_adi5, '-', 1) ,'') as "RUT AD5",
isnull(split_part(hah.rut_adi5, '-', 2) ,'') as "DIGITO VERIFICADOR AD5",
'' as "TELEFONO PARTICULAR AD5",
'' as "MOVIL PARTICULAR AD5",
'' as "Mail AD5",
isnull(hah.fecha_nacimiento_adi5 ,'') as "FEC_NACIMIENTO AD5",
'' as "DIRECCION PARTICULAR AD5",
'' as "COMUNA PARTICULAR AD5",
'' as "CIUDAD PARTICULAR AD5",
isnull(hah.parentesco_adi5, '') as "PARENTESCO AD5",
(case when (trim(hah.nombre_adi5) <> '' or hah.nombre_adi5 is not null)
then '0'
else '' end) as "PRIMA AD5",
----benef
isnull(ben.nombre_benef1,'') as  "NOMBRES B1",
isnull(ben.paterno_benef1,'') as  "APELLIDO PATERNO B1",
isnull(ben.materno_benef1,'') as "APELLIDO MATERNO B1",
isnull(split_part(ben.rut_benef1, '-', 1),'') as  "RUT B1",
isnull(split_part(ben.rut_benef1, '-', 2),'') as  "DIGITO VERIFICADOR B1",
'' as "FEC_NACIMIENTO B1",
isnull(replace(ben.cod_benef1, '0', ''),'') as "PARENTESCO B1",
isnull(ben.direccion_benef1,'') as "DIRECCION PARTICULAR B1",
isnull(ben.comuna_benef1,'') as "COMUNA PARTICULAR B1",
isnull(ben.ciudad_benef1,'') as "CIUDAD PARTICULAR B1",
isnull(ben.pais_benef1,'') as "PAIS RESIDENCIA B1",
isnull(ben.nacionalidad_benef1 ,'') as "NACIONALIDAD B1",
isnull(ben.porc_benef1,'') as "PORCENTAJE B1",
isnull(ben.fono_benef1,'') as "TELEFONO PARTICULAR B1",
isnull(ben.cel_benef1,'') as "MOVIL PARTICULAR B1",
isnull(ben.mail_benef1,'') as "CORREO PARTICULAR B1",
-----
isnull(ben.nombre_benef2,'') as  "NOMBRES B2",
isnull(ben.paterno_benef2,'') as  "APELLIDO PATERNO B2",
isnull(ben.materno_benef2,'') as "APELLIDO MATERNO B2",
isnull(split_part(ben.rut_benef2, '-', 1),'') as  "RUT B2",
isnull(split_part(ben.rut_benef2, '-', 2),'') as  "DIGITO VERIFICADOR B2",
'' as "FEC_NACIMIENTO B2",
isnull(replace(ben.cod_benef2, '0', ''),'') as "PARENTESCO B2",
isnull(ben.direccion_benef2,'') as "DIRECCION PARTICULAR B2",
isnull(ben.comuna_benef2,'') as "COMUNA PARTICULAR B2",
isnull(ben.ciudad_benef2,'') as "CIUDAD PARTICULAR B2",
isnull(ben.pais_benef2,'') as "PAIS RESIDENCIA B2",
isnull(ben.nacionalidad_benef2 ,'') as "NACIONALIDAD B2",
isnull(ben.porc_benef2,'') as "PORCENTAJE B2",
isnull(ben.fono_benef2,'') as "TELEFONO PARTICULAR B2",
isnull(ben.cel_benef2,'') as "MOVIL PARTICULAR B2",
isnull(ben.mail_benef2,'') as "CORREO PARTICULAR B2",
isnull(ben.nombre_benef3,'') as  "NOMBRES B3",
isnull(ben.paterno_benef3,'') as  "APELLIDO PATERNO B3",
isnull(ben.materno_benef3,'') as "APELLIDO MATERNO B3",
isnull(split_part(ben.rut_benef3, '-', 1),'') as  "RUT B3",
isnull(split_part(ben.rut_benef3, '-', 2),'') as  "DIGITO VERIFICADOR B3",
'' as "FEC_NACIMIENTO B3",
isnull(replace(ben.cod_benef3, '0', ''),'') as "PARENTESCO B3",
isnull(ben.direccion_benef3,'') as "DIRECCION PARTICULAR B3",
isnull(ben.comuna_benef3,'') as "COMUNA PARTICULAR B3",
isnull(ben.ciudad_benef3,'') as "CIUDAD PARTICULAR B3",
isnull(ben.pais_benef3,'') as "PAIS RESIDENCIA B3",
isnull(ben.nacionalidad_benef3 ,'') as "NACIONALIDAD B3",
isnull(ben.porc_benef3,'') as "PORCENTAJE B3",
isnull(ben.fono_benef3,'') as "TELEFONO PARTICULAR B3",
isnull(ben.cel_benef3,'') as "MOVIL PARTICULAR B3",
isnull(ben.mail_benef3,'') as "CORREO PARTICULAR B3",
isnull(ben.nombre_benef4,'') as  "NOMBRES B4",
isnull(ben.paterno_benef4,'') as  "APELLIDO PATERNO B4",
isnull(ben.materno_benef4,'') as "APELLIDO MATERNO B4",
isnull(split_part(ben.rut_benef4, '-', 1),'') as  "RUT B4",
isnull(split_part(ben.rut_benef4, '-', 2),'') as  "DIGITO VERIFICADOR B4",
'' as "FEC_NACIMIENTO B4",
isnull(replace(ben.cod_benef4, '0', ''),'') as "PARENTESCO B4",
isnull(ben.direccion_benef4,'') as "DIRECCION PARTICULAR B4",
isnull(ben.comuna_benef4,'') as "COMUNA PARTICULAR B4",
isnull(ben.ciudad_benef4,'') as "CIUDAD PARTICULAR B4",
isnull(ben.pais_benef4,'') as "PAIS RESIDENCIA B4",
isnull(ben.nacionalidad_benef4 ,'') as "NACIONALIDAD B4",
isnull(ben.porc_benef4,'') as "PORCENTAJE B4",
isnull(ben.fono_benef4,'') as "TELEFONO PARTICULAR B4",
isnull(ben.cel_benef4,'') as "MOVIL PARTICULAR B4",
isnull(ben.mail_benef4,'') as "CORREO PARTICULAR B4",
isnull(ben.nombre_benef5,'') as  "NOMBRES B5",
isnull(ben.paterno_benef5,'') as  "APELLIDO PATERNO B5",
isnull(ben.materno_benef5,'') as "APELLIDO MATERNO B5",
isnull(split_part(ben.rut_benef5, '-', 1),'') as  "RUT B5",
isnull(split_part(ben.rut_benef5, '-', 2),'') as  "DIGITO VERIFICADOR B5",
'' as "FEC_NACIMIENTO B5",
isnull(replace(ben.cod_benef5, '0', ''),'') as "PARENTESCO B5",
isnull(ben.direccion_benef5,'') as "DIRECCION PARTICULAR B5",
isnull(ben.comuna_benef5,'') as "COMUNA PARTICULAR B5",
isnull(ben.ciudad_benef5,'') as "CIUDAD PARTICULAR B5",
isnull(ben.pais_benef5,'') as "PAIS RESIDENCIA B5",
isnull(ben.nacionalidad_benef5 ,'') as "NACIONALIDAD B5",
isnull(ben.porc_benef5,'') as "PORCENTAJE B5",
isnull(ben.fono_benef5,'') as "TELEFONO PARTICULAR B5",
isnull(ben.cel_benef5,'') as "MOVIL PARTICULAR B5",
isnull(ben.mail_benef5,'') as "CORREO PARTICULAR B5",
isnull(ben.nombre_benef6,'') as  "NOMBRES B6",
isnull(ben.paterno_benef6,'') as  "APELLIDO PATERNO B6",
isnull(ben.materno_benef6,'') as "APELLIDO MATERNO B6",
isnull(split_part(ben.rut_benef6, '-', 1),'') as  "RUT B6",
isnull(split_part(ben.rut_benef6, '-', 2),'') as  "DIGITO VERIFICADOR B6",
'' as "FEC_NACIMIENTO B6",
isnull(replace(ben.cod_benef6, '0', ''),'') as "PARENTESCO B6",
isnull(ben.direccion_benef6,'') as "DIRECCION PARTICULAR B6",
isnull(ben.comuna_benef6,'') as "COMUNA PARTICULAR B6",
isnull(ben.ciudad_benef6,'') as "CIUDAD PARTICULAR B6",
isnull(ben.pais_benef6,'') as "PAIS RESIDENCIA B6",
isnull(ben.nacionalidad_benef6 ,'') as "NACIONALIDAD B6",
isnull(ben.porc_benef6,'') as "PORCENTAJE B6",
isnull(ben.fono_benef6,'') as "TELEFONO PARTICULAR B6",
isnull(ben.cel_benef6,'') as "MOVIL PARTICULAR B6",
isnull(ben.mail_benef6,'') as "CORREO PARTICULAR B6",
isnull(ben.nombre_benef7,'') as  "NOMBRES B7",
isnull(ben.paterno_benef7,'') as  "APELLIDO PATERNO B7",
isnull(ben.materno_benef7,'') as "APELLIDO MATERNO B7",
isnull(split_part(ben.rut_benef7, '-', 1),'') as  "RUT B7",
isnull(split_part(ben.rut_benef7, '-', 2),'') as  "DIGITO VERIFICADOR B7",
'' as "FEC_NACIMIENTO B7",
isnull(replace(ben.cod_benef7, '0', ''),'') as "PARENTESCO B7",
isnull(ben.direccion_benef7,'') as "DIRECCION PARTICULAR B7",
isnull(ben.comuna_benef7,'') as "COMUNA PARTICULAR B7",
isnull(ben.ciudad_benef7,'') as "CIUDAD PARTICULAR B7",
isnull(ben.pais_benef7,'') as "PAIS RESIDENCIA B7",
isnull(ben.nacionalidad_benef7 ,'') as "NACIONALIDAD B7",
isnull(ben.porc_benef7,'') as "PORCENTAJE B7",
isnull(ben.fono_benef7,'') as "TELEFONO PARTICULAR B7",
isnull(ben.cel_benef7,'') as "MOVIL PARTICULAR B7",
isnull(ben.mail_benef7,'') as "CORREO PARTICULAR B7",
'000' as "ESTADO PROPUESTA"
--into cardif_hospitalario_familiar.result
 from cardif_hospitalario_familiar.ventas a
 left join cardif_hospitalario_familiar.regcomciu r on r.ncomuna = a.comuna_venta 
 left join cardif_hospitalario_familiar.log_altas_car_cla_hsp lacch on lacch.con_id::numeric = a.idunico::numeric
---------------------------------
left join (select idunico,
mi_resultado.cod_benef1 ,
mi_resultado.rut_benef1 as rut_benef1,
mi_resultado.nombre_benef1 as nombre_benef1,
mi_resultado.paterno_benef1 as paterno_benef1,
mi_resultado.materno_benef1 as materno_benef1,
mi_resultado.porc_benef1 as porc_benef1,
mi_resultado.fono_benef1 as fono_benef1,
mi_resultado.cel_benef1 as cel_benef1,
mi_resultado.mail_benef1 as mail_benef1,
mi_resultado.direccion_benef1 as direccion_benef1,
mi_resultado.pais_benef1 as pais_benef1,
mi_resultado.nacionalidad_benef1 as nacionalidad_benef1,
mi_resultado.comuna_benef1 as comuna_benef1,
mi_resultado.ciudad_benef1 as ciudad_benef1,
mi_resultado.cod_benef2 ,
mi_resultado.cod_aseg2 ,
mi_resultado.rut_benef2 as rut_benef2,
mi_resultado.nombre_benef2 as nombre_benef2,
mi_resultado.paterno_benef2 as paterno_benef2,
mi_resultado.materno_benef2 as materno_benef2,
mi_resultado.porc_benef2 as porc_benef2,
mi_resultado.fono_benef2 as fono_benef2,
mi_resultado.cel_benef2 as cel_benef2,
mi_resultado.mail_benef2 as mail_benef2,
mi_resultado.direccion_benef2 as direccion_benef2,
mi_resultado.comuna_benef2 as comuna_benef2,
mi_resultado.ciudad_benef2 as ciudad_benef2,
mi_resultado.pais_benef2 as pais_benef2,
mi_resultado.nacionalidad_benef2 as nacionalidad_benef2,
mi_resultado.cod_benef3 ,
mi_resultado.cod_aseg3 ,
mi_resultado.rut_benef3 as rut_benef3,
mi_resultado.nombre_benef3 as nombre_benef3,
mi_resultado.paterno_benef3 as paterno_benef3,
mi_resultado.materno_benef3 as materno_benef3,
mi_resultado.porc_benef3 as porc_benef3,
mi_resultado.fono_benef3 as fono_benef3,
mi_resultado.cel_benef3 as cel_benef3,
mi_resultado.mail_benef3 as mail_benef3,
mi_resultado.direccion_benef3 as direccion_benef3,
mi_resultado.comuna_benef3 as comuna_benef3,
mi_resultado.ciudad_benef3 as ciudad_benef3,
mi_resultado.pais_benef3 as pais_benef3,
mi_resultado.nacionalidad_benef3 as nacionalidad_benef3,
mi_resultado.cod_benef4 ,
mi_resultado.cod_aseg4 ,
mi_resultado.rut_benef4 as rut_benef4,
mi_resultado.nombre_benef4 as nombre_benef4,
mi_resultado.paterno_benef4 as paterno_benef4,
mi_resultado.materno_benef4 as materno_benef4,
mi_resultado.porc_benef4 as porc_benef4,
mi_resultado.fono_benef4 as fono_benef4,
mi_resultado.cel_benef4 as cel_benef4,
mi_resultado.mail_benef4 as mail_benef4,
mi_resultado.direccion_benef4 as direccion_benef4,
mi_resultado.comuna_benef4 as comuna_benef4,
mi_resultado.ciudad_benef4 as ciudad_benef4,
mi_resultado.pais_benef4 as pais_benef4,
mi_resultado.nacionalidad_benef4 as nacionalidad_benef4,
mi_resultado.cod_benef5 ,
mi_resultado.cod_aseg5 ,
mi_resultado.rut_benef5 as rut_benef5,
mi_resultado.nombre_benef5 as nombre_benef5,
mi_resultado.paterno_benef5 as paterno_benef5,
mi_resultado.materno_benef5 as materno_benef5,
mi_resultado.porc_benef5 as porc_benef5,
mi_resultado.fono_benef5 as fono_benef5,
mi_resultado.cel_benef5 as cel_benef5,
mi_resultado.mail_benef5 as mail_benef5,
mi_resultado.direccion_benef5 as direccion_benef5,
mi_resultado.comuna_benef5 as comuna_benef5,
mi_resultado.ciudad_benef5 as ciudad_benef5,
mi_resultado.pais_benef5 as pais_benef5,
mi_resultado.nacionalidad_benef5 as nacionalidad_benef5,
mi_resultado.cod_benef6 ,
mi_resultado.cod_aseg6 ,
mi_resultado.rut_benef6 as rut_benef6,
mi_resultado.nombre_benef6 as nombre_benef6,
mi_resultado.paterno_benef6 as paterno_benef6,
mi_resultado.materno_benef6 as materno_benef6,
mi_resultado.porc_benef6 as porc_benef6,
mi_resultado.fono_benef6 as fono_benef6,
mi_resultado.cel_benef6 as cel_benef6,
mi_resultado.mail_benef6 as mail_benef6,
mi_resultado.direccion_benef6 as direccion_benef6,
mi_resultado.comuna_benef6 as comuna_benef6,
mi_resultado.ciudad_benef6 as ciudad_benef6,
mi_resultado.pais_benef6 as pais_benef6,
mi_resultado.nacionalidad_benef6 as nacionalidad_benef6,
mi_resultado.cod_benef7 ,
mi_resultado.cod_aseg7 ,
mi_resultado.rut_benef7 as rut_benef7,
mi_resultado.nombre_benef7 as nombre_benef7,
mi_resultado.paterno_benef7 as paterno_benef7,
mi_resultado.materno_benef7 as materno_benef7,
mi_resultado.porc_benef7 as porc_benef7,
mi_resultado.fono_benef7 as fono_benef7,
mi_resultado.cel_benef7 as cel_benef7,
mi_resultado.mail_benef7 as mail_benef7,
mi_resultado.direccion_benef7 as direccion_benef7,
mi_resultado.comuna_benef7 as comuna_benef7,
mi_resultado.ciudad_benef7 as ciudad_benef7,
mi_resultado.pais_benef7 as pais_benef7,
mi_resultado.nacionalidad_benef7 as nacionalidad_benef7
from crosstab('
select total.idunico, total.categoria, total.salida from(
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''10'' as categoria,case
when b.parentesco_benef::varchar is null then '' ''
else b.parentesco_benef::varchar
end  as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''11'' as categoria, ''''  as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''12'' as categoria,case
when b.rut_benef::varchar is null then '' ''
else b.rut_benef::varchar
end  as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''13'' as categoria,case
when b.nombre_benef is null then '' ''
else b.nombre_benef
end   as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''14'' as categoria,case
when b.paterno_benef is null then '' ''
else b.paterno_benef
end   as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''15'' as categoria,case
when b.materno_benef is null then '' ''
else b.materno_benef
end as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''16'' as categoria,case
when b.participacion_benef::varchar is null then '' ''
else b.participacion_benef::varchar
end as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''17'' as categoria,case
when b.fono_beneficiario is null then '' ''
else b.fono_beneficiario
end  as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''18'' as categoria,'''' as salida
--select cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''18'' as categoria,''xxx'' as celular_benef
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''19'' as categoria,case
when b.mail_beneficiario::varchar is null then '' ''
else b.mail_beneficiario::varchar
end as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''20'' as categoria,case
when  b.direccion_beneficiario::varchar is null then '' ''
else  b.direccion_beneficiario::varchar
end as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''21'' as categoria,case
when  b.comuna_beneficiario::varchar is null then '' ''
else  b.comuna_beneficiario::varchar
end  as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''22'' as categoria,case
when  b.ciudad_beneficiario::varchar is null then '' ''
else  b.ciudad_beneficiario::varchar 
end  as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''23'' as categoria,case
when  b.nacionalidad_benef::varchar is null then ''152''
else  b.nacionalidad_benef::varchar
end  as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''24'' as categoria,case
when b.pais_benef::varchar is null then ''152''
else b.pais_benef::varchar 
end as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
order by idunico,cod_benef,categoria
) total
order by total.idunico,total.cod_benef,total.categoria
')
mi_resultado(idunico integer,
cod_benef1 character varying,
cod_aseg1 character varying,
rut_benef1 character varying,
nombre_benef1 character varying,
paterno_benef1 character varying,
materno_benef1 character varying,
porc_benef1 character varying,
fono_benef1 character varying,
cel_benef1 character varying,
mail_benef1 character varying,
direccion_benef1 character varying,
comuna_benef1 character varying,
ciudad_benef1 character varying,
nacionalidad_benef1 character varying,
pais_benef1 character varying,
cod_benef2 character varying,
cod_aseg2 character varying,
rut_benef2 character varying,
nombre_benef2 character varying,
paterno_benef2 character varying,
materno_benef2 character varying,
porc_benef2 character varying,
fono_benef2 character varying,
cel_benef2 character varying,
mail_benef2 character varying,
direccion_benef2 character varying,
comuna_benef2 character varying,
ciudad_benef2 character varying,
nacionalidad_benef2 character varying,
pais_benef2 character varying,
cod_benef3 character varying,
cod_aseg3 character varying,
rut_benef3 character varying,
nombre_benef3 character varying,
paterno_benef3 character varying,
materno_benef3 character varying,
porc_benef3 character varying,
fono_benef3 character varying,
cel_benef3 character varying,
mail_benef3 character varying,
direccion_benef3 character varying,
comuna_benef3 character varying,
ciudad_benef3 character varying,
nacionalidad_benef3 character varying,
pais_benef3 character varying,
cod_benef4 character varying,
cod_aseg4 character varying,
rut_benef4 character varying,
nombre_benef4 character varying,
paterno_benef4 character varying,
materno_benef4 character varying,
porc_benef4 character varying,
fono_benef4 character varying,
cel_benef4 character varying,
mail_benef4 character varying,
direccion_benef4 character varying,
comuna_benef4 character varying,
ciudad_benef4 character varying,
nacionalidad_benef4 character varying,
pais_benef4 character varying,
cod_benef5 character varying,
cod_aseg5 character varying,
rut_benef5 character varying,
nombre_benef5 character varying,
paterno_benef5 character varying,
materno_benef5 character varying,
porc_benef5 character varying,
fono_benef5 character varying,
cel_benef5 character varying,
mail_benef5 character varying,
direccion_benef5 character varying,
comuna_benef5 character varying,
ciudad_benef5 character varying,
nacionalidad_benef5 character varying,
pais_benef5 character varying,
cod_benef6 character varying,
cod_aseg6 character varying,
rut_benef6 character varying,
nombre_benef6 character varying,
paterno_benef6 character varying,
materno_benef6 character varying,
porc_benef6 character varying,
fono_benef6 character varying,
cel_benef6 character varying,
mail_benef6 character varying,
direccion_benef6 character varying,
comuna_benef6 character varying,
ciudad_benef6 character varying,
nacionalidad_benef6 character varying,
pais_benef6 character varying,
cod_benef7 character varying,
cod_aseg7 character varying,
rut_benef7 character varying,
nombre_benef7 character varying,
paterno_benef7 character varying,
materno_benef7 character varying,
porc_benef7 character varying,
fono_benef7 character varying,
cel_benef7 character varying,
mail_benef7 character varying,
direccion_benef7 character varying,
comuna_benef7 character varying,
ciudad_benef7 character varying,
nacionalidad_benef7 character varying,
pais_benef7 character varying
))ben on ben.idunico = a.idunico
left join (SELECT
mi_resultado.idunico,
mi_resultado.rut_adi1,
mi_resultado.nombre_adi1,
mi_resultado.paterno_adi1,
mi_resultado.materno_adi1,
mi_resultado.direccion_adi1,
mi_resultado.fecha_nacimiento_adi1,
mi_resultado.nacionalidad_adi1,
mi_resultado.parentesco_adi1,
mi_resultado.rut_adi2,
mi_resultado.nombre_adi2,
mi_resultado.paterno_adi2,
mi_resultado.materno_adi2,
mi_resultado.direccion_adi2,
mi_resultado.fecha_nacimiento_adi2,
mi_resultado.nacionalidad_adi2,
mi_resultado.parentesco_adi2,
mi_resultado.rut_adi3,
mi_resultado.nombre_adi3,
mi_resultado.paterno_adi3,
mi_resultado.materno_adi3,
mi_resultado.direccion_adi3,
mi_resultado.fecha_nacimiento_adi3,
mi_resultado.nacionalidad_adi3,
mi_resultado.parentesco_adi3,
mi_resultado.rut_adi4,
mi_resultado.nombre_adi4,
mi_resultado.paterno_adi4,
mi_resultado.materno_adi4,
mi_resultado.direccion_adi4,
mi_resultado.fecha_nacimiento_adi4,
mi_resultado.nacionalidad_adi4,
mi_resultado.parentesco_adi4,
mi_resultado.rut_adi5,
mi_resultado.nombre_adi5,
mi_resultado.paterno_adi5,
mi_resultado.materno_adi5,
mi_resultado.direccion_adi5,
mi_resultado.fecha_nacimiento_adi5,
mi_resultado.nacionalidad_adi5,
mi_resultado.parentesco_adi5
from crosstab('select a.idunico::int,(cod_aseg-subquery.idunico::int)||''101'' as categoria,case
when a.rut_cliente is null then '' ''
else a.rut_cliente
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> ''dialer.idunico''
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> ''dialer.idunico''
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||''102'' as categoria,case
when a.nombre_asegurado is null then '' ''
else a.nombre_asegurado 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> ''dialer.idunico''
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> ''dialer.idunico''
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||''103'' as categoria,case
when a.paterno_asegurado is null then '' ''
else a.paterno_asegurado 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> ''dialer.idunico''
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> ''dialer.idunico''
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||''104'' as categoria,case
when a.materno_asegurado is null then '' ''
else a.materno_asegurado 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> ''dialer.idunico''
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> ''dialer.idunico''
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||''105'' as categoria,case
when a.residencia is null then '' ''
else a.residencia 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> ''dialer.idunico''
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> ''dialer.idunico''
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||''106'' as categoria,case
when a.fecha_nacimiento is null then '' ''
else a.fecha_nacimiento 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> ''dialer.idunico''
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> ''dialer.idunico''
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||''107'' as categoria,case
when a.nacionalidad is null then '' ''
else a.nacionalidad 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> ''dialer.idunico''
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> ''dialer.idunico''
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||''108'' as categoria,case
when a.parentesco = ''ESPOSA'' then ''7''
when a.parentesco = ''ESPOSO'' then ''7''
when a.parentesco = ''3'' then ''3''
when a.parentesco = ''7'' then ''7''
when tp.codigo  is null then '' ''
else tp.codigo  
end
from cardif_hospitalario_familiar.asegurados a 
inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a
where a.idunico <> ''dialer.idunico''
group by a.idunico) as subquery on a.idunico = subquery.idunico
left join cardif_hospitalario_familiar.tabla_parentesco tp  on tp.descripcion = a.parentesco 
where a.idunico <> ''dialer.idunico''
order by idunico,categoria'::text) mi_resultado(idunico integer,
rut_adi1 character varying,
nombre_adi1 character varying,
paterno_adi1 character varying,
materno_adi1 character varying,
direccion_adi1 character varying,
fecha_nacimiento_adi1 character varying,
nacionalidad_adi1 character varying,
parentesco_adi1 character varying,
rut_adi2 character varying,
nombre_adi2 character varying,
paterno_adi2 character varying,
materno_adi2 character varying,
direccion_adi2 character varying,
fecha_nacimiento_adi2 character varying,
nacionalidad_adi2 character varying,
parentesco_adi2 character varying,
rut_adi3 character varying,
nombre_adi3 character varying,
paterno_adi3 character varying,
materno_adi3 character varying,
direccion_adi3 character varying,
fecha_nacimiento_adi3 character varying,
nacionalidad_adi3 character varying,
parentesco_adi3 character varying,
rut_adi4 character varying,
nombre_adi4 character varying,
paterno_adi4 character varying,
materno_adi4 character varying,
direccion_adi4 character varying,
fecha_nacimiento_adi4 character varying,
nacionalidad_adi4 character varying,
parentesco_adi4 character varying,
rut_adi5 character varying,
nombre_adi5 character varying,
paterno_adi5 character varying,
materno_adi5 character varying,
direccion_adi5 character varying,
fecha_nacimiento_adi5 character varying,
nacionalidad_adi5 character varying,
parentesco_adi5 character varying
-------------------
)) hah on hah.idunico = a.idunico::numeric
where estado_venta in ('OK','RECUPERADO')
and to_date(fecha, 'YYYYMMDD') between '20211201' and '20220131'
--and substring(rut_aseg,1,position('-' in rut_aseg)-1) in ('23856140','16764520')
--and to_date(fecha, 'YYYYMMDD') between to_char(now (),'YYYYMM01')::date and to_char(now () - INTERVAL '1 DAY','YYYYMMDD')::date
and lacch.con_id is null