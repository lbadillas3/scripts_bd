select distinct hfh.for_his_genesys_id,
cc.con_id,
hfh.for_his_genesys_id,
'2' as "CALL ORIGNE",
'07' as "CANAL VENTA PROPUESTA",
'Hospitali' as "CAMPAÑA TMK",
concat('cardif_hospitalario_familiar_','000_',split_part(hfh.for_his_metadata::json->>'Rut', '-',  1),'8149_',
hfh.for_his_metadata::json->>'Rut','_',to_char(hfh.for_his_date_form::date,'YYYYMMDD'),'_',hfh.for_his_genesys_id,'.mp3') as "INDICE TMK",
'8149' as "CODIGO PRODUCTO",
'220031390' as "POLIZA",
to_char(hfh.for_his_date_form::date,'DD/MM/YYYY') as "FECHA SOLICITUD",
(case 
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='31' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='32' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='41' then '04'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='42' then '04'
 else '0'||replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','') end) as "PLAN TIT",
concat(UPPER(hfh.for_his_metadata::json->>'Nombre'),' ',UPPER(hfh.for_his_metadata::json->>'SegundoNombre'))  as "NOMBRES",
UPPER(hfh.for_his_metadata::json->>'ApPaterno') as "APELLIDO PATERNO TIT",
UPPER(hfh.for_his_metadata::json->>'ApMaterno') as "APELLIDO MATERNO TIT",
split_part(hfh.for_his_metadata::json->>'Rut', '-',  1) as "RUT TIT",
split_part(hfh.for_his_metadata::json->>'Rut', '-',  2) as "DIGITO VERIFICADOR TIT",
'' as "TELEFONO PARTICULAR TIT",
hfh.for_his_metadata::json->>'Telefono' as "MOVIL PARTICULAR TIT",
hfh.for_his_metadata::json->>'Mail' as "CORREO TIT",
(case 
when (upper(cc.con_metadata::json->>'sexo') = 'MASCULINO') then '1'
when (upper(cc.con_metadata::json->>'sexo') = 'FEMENINO') then '2'
else ''
end) as "GENERO TIT",
to_char((hfh.for_his_metadata::json->>'Fechanacimiento')::date,'DD/MM/YYYY') as "FECHA DE NACIMIENTO TIT",
hfh.for_his_metadata::json->>'Direccion' as "DIRECCION PARTICULAR TIT",
hfh.for_his_metadata::json->>'ComunaId' as "COMUNA PARTICULAR TIT",
hfh.for_his_metadata::json->>'CiudadId' as "CIUDAD PARTICULAR TIT",
hfh.for_his_metadata::json->>'cod_nacionalidad_campana' as "PAIS RESIDENCIA",
hfh.for_his_metadata::json->>'cod_nacionalidad_campana' as "NACIONALIDAD",
hfh.for_his_metadata::json->>'pro_valu_plan' as "PRIMA TIT",
hfh.for_his_metadata::json->>'Profesion' as "PROFESION TIT",
(case 
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='31' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='32' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='41' then '04'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='42' then '04'
 else '0'||replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','') end) as "PLAN CONT",
 concat(UPPER(hfh.for_his_metadata::json->>'Nombre'),' ',UPPER(hfh.for_his_metadata::json->>'SegundoNombre'))  as "NOMBRES CONT",
UPPER(hfh.for_his_metadata::json->>'ApPaterno') as "APELLIDO PATERNO CONT",
UPPER(hfh.for_his_metadata::json->>'ApMaterno') as "APELLIDO MATERNO CONT",
split_part(hfh.for_his_metadata::json->>'Rut', '-',  1) as "RUT CONT",
split_part(hfh.for_his_metadata::json->>'Rut', '-',  2) as "DIGITO VERIFICADOR CONT",
'' as "TELEFONO PARTICULAR CONT",
hfh.for_his_metadata::json->>'Telefono' as "MOVIL PARTICULAR CONT",
hfh.for_his_metadata::json->>'Mail' as "CORREO CONT",
(case 
when (upper(cc.con_metadata::json->>'sexo') = 'MASCULINO') then '1'
when (upper(cc.con_metadata::json->>'sexo') = 'FEMENINO') then '2'
else ''
end) as "GENERO CONT",
to_char((hfh.for_his_metadata::json->>'Fechanacimiento')::date,'DD/MM/YYYY') as "FECHA DE NACIMIENTO CONT",
hfh.for_his_metadata::json->>'Direccion' as "DIRECCION PARTICULAR CONT",
hfh.for_his_metadata::json->>'ComunaId' as "COMUNA PARTICULAR CONT",
hfh.for_his_metadata::json->>'CiudadId' as "CIUDAD PARTICULAR CONT",
hfh.for_his_metadata::json->>'cod_nacionalidad_campana' as "PAIS RESIDENCIA CONT",
hfh.for_his_metadata::json->>'cod_nacionalidad_campana' as "NACIONALIDAD CONT",
hfh.for_his_metadata::json->>'pro_valu_plan' as "PRIMA CONT",
'' as "PROFESION CONT",
(case 
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='31' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='32' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='41' then '04'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='42' then '04'
 else '0'||replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','') end) as "PLAN PAG",
 concat(UPPER(hfh.for_his_metadata::json->>'Nombre'),' ',UPPER(hfh.for_his_metadata::json->>'SegundoNombre'))  as "NOMBRES PAG",
UPPER(hfh.for_his_metadata::json->>'ApPaterno') as "APELLIDO PATERNO PAG",
UPPER(hfh.for_his_metadata::json->>'ApMaterno') as "APELLIDO MATERNO PAG",
split_part(hfh.for_his_metadata::json->>'Rut', '-',  1) as "RUT PAG",
split_part(hfh.for_his_metadata::json->>'Rut', '-',  2) as "DIGITO VERIFICADOR PAG",
'' as "TELEFONO PARTICULAR PAG",
hfh.for_his_metadata::json->>'Telefono' as "MOVIL PARTICULAR PAG",
hfh.for_his_metadata::json->>'Mail' as "CORREO PAG",
(case 
when (upper(cc.con_metadata::json->>'sexo') = 'MASCULINO') then '1'
when (upper(cc.con_metadata::json->>'sexo') = 'FEMENINO') then '2'
else ''
end) as "GENERO PAG",
to_char((hfh.for_his_metadata::json->>'Fechanacimiento')::date,'DD/MM/YYYY') as "FECHA DE NACIMIENTO PAG",
hfh.for_his_metadata::json->>'Direccion' as "DIRECCION PARTICULAR PAG",
hfh.for_his_metadata::json->>'ComunaId' as "COMUNA PARTICULAR PAG",
hfh.for_his_metadata::json->>'CiudadId' as "CIUDAD PARTICULAR PAG",
hfh.for_his_metadata::json->>'cod_nacionalidad_campana' as "PAIS RESIDENCIA PAG",
hfh.for_his_metadata::json->>'cod_nacionalidad_campana' as "NACIONALIDAD PAG",
hfh.for_his_metadata::json->>'pro_valu_plan' as "PRIMA PAG",
'' as "PROFESION PAG",
------Adicional
(case when (trim(hah.nombre_adi1) <> '' or hah.nombre_adi1 is not null) 
then (case 
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='31' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='32' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='41' then '04'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='42' then '04'
 else '0'||replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','') end)
else '' end) as "PLAN AD1",
concat(hah.nombre_adi1,' ',segundo_nombre_adi1) as "NOMBRES AD1",
hah.paterno_adi1  as "APELLIDO PATERNO AD1",
hah.materno_adi1  as "APELLIDO MATERNO AD1",
split_part(hah.rut_adi1, '-',  1) as "RUT AD1",
split_part(hah.rut_adi1, '-',  2) as "DIGITO VERIFICADOR AD1",
(case when (trim(hah.nombre_adi1) <> '' or not null)
then (case when (trim(hah.telefono_adi1 ) <> '' or not null) then hah.telefono_adi1 else hfh.for_his_metadata::json->>'Telefono' 
end)
else ''
end) as "TELEFONO PARTICULAR AD1",
'' as "MOVIL PARTICULAR AD1",
(case when (trim(hah.nombre_adi1) <> '' or not null)
then (case when (trim(hah.mail_adi1 ) <> '' or not null) then hah.mail_adi1 else hfh.for_his_metadata::json->>'Mail'
end)
else ''
end) as "Mail AD1",
hah.fecha_nacimiento_adi1 as "FEC_NACIMIENTO AD1",
hah.direccion_adi1  as "DIRECCION PARTICULAR AD1",
hah.comuna_adi1  as "COMUNA PARTICULAR AD1",
hah.ciudad_adi1  as "CIUDAD PARTICULAR AD1",
ltrim(hah.cod_adi1,'0')  as "PARENTESCO AD1",
(case when (trim(hah.nombre_adi1) <> '' or hah.nombre_adi1 is not null) then '0'
else '' end) as "PRIMA AD1",
-------------------
(case when (trim(hah.nombre_adi2) <> '' or hah.nombre_adi2 is not null) 
then (case 
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='31' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='32' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='41' then '04'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='42' then '04'
 else '0'||replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','') end)
else '' end) as "PLAN AD2",
concat(hah.nombre_adi2,' ',segundo_nombre_adi2) as "NOMBRES AD2",
hah.paterno_adi2  as "APELLIDO PATERNO AD2",
hah.materno_adi2  as "APELLIDO MATERNO AD2",
split_part(hah.rut_adi2, '-',  1) as "RUT AD2",
split_part(hah.rut_adi2, '-',  2) as "DIGITO VERIFICADOR AD2",
(case when (trim(hah.nombre_adi2) <> '' or not null)
then (case when (trim(hah.telefono_adi2 ) <> '' or not null) then hah.telefono_adi2 else hfh.for_his_metadata::json->>'Telefono' 
end)
else ''
end) as "TELEFONO PARTICULAR AD2",
'' as "MOVIL PARTICULAR AD2",
(case when (trim(hah.nombre_adi2) <> '' or not null)
then (case when (trim(hah.mail_adi2 ) <> '' or not null) then hah.mail_adi2 else hfh.for_his_metadata::json->>'Mail'
end)
else ''
end) as "Mail AD2",
hah.fecha_nacimiento_adi2 as "FEC_NACIMIENTO AD2",
hah.direccion_adi2  as "DIRECCION PARTICULAR AD2",
hah.comuna_adi2  as "COMUNA PARTICULAR AD2",
hah.ciudad_adi2  as "CIUDAD PARTICULAR AD2",
ltrim(hah.cod_adi2,'0')  as "PARENTESCO AD2",
(case when (trim(hah.nombre_adi2) <> '' or hah.nombre_adi2 is not null) then '0'
else '' end) as "PRIMA AD2",
------------------
(case when (trim(hah.nombre_adi3) <> '' or hah.nombre_adi3 is not null) 
then (case 
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='31' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='32' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='41' then '04'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='42' then '04'
 else '0'||replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','') end)
else '' end) as "PLAN AD3",
concat(hah.nombre_adi3,' ',segundo_nombre_adi3) as "NOMBRES AD3",
hah.paterno_adi3  as "APELLIDO PATERNO AD3",
hah.materno_adi3  as "APELLIDO MATERNO AD3",
split_part(hah.rut_adi3, '-',  1) as "RUT AD3",
split_part(hah.rut_adi3, '-',  2) as "DIGITO VERIFICADOR AD3",
(case when (trim(hah.nombre_adi3) <> '' or not null)
then (case when (trim(hah.telefono_adi3 ) <> '' or not null) then hah.telefono_adi3 else hfh.for_his_metadata::json->>'Telefono' 
end)
else ''
end) as "TELEFONO PARTICULAR AD3",
'' as "MOVIL PARTICULAR AD3",
(case when (trim(hah.nombre_adi3) <> '' or not null)
then (case when (trim(hah.mail_adi3 ) <> '' or not null) then hah.mail_adi3 else hfh.for_his_metadata::json->>'Mail'
end)
else ''
end) as "Mail AD3",
hah.fecha_nacimiento_adi3 as "FEC_NACIMIENTO AD3",
hah.direccion_adi3  as "DIRECCION PARTICULAR AD3",
hah.comuna_adi3  as "COMUNA PARTICULAR AD3",
hah.ciudad_adi3  as "CIUDAD PARTICULAR AD3",
ltrim(hah.cod_adi3,'0') as "PARENTESCO AD3",
(case when (trim(hah.nombre_adi3) <> '' or hah.nombre_adi3 is not null) then '0'
else '' end) as "PRIMA AD3",
-------------------
(case when (trim(hah.nombre_adi4) <> '' or hah.nombre_adi4 is not null) 
then (case 
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='31' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='32' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='41' then '04'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='42' then '04'
 else '0'||replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','') end)
else '' end) as "PLAN AD4",
concat(hah.nombre_adi4,' ',segundo_nombre_adi4) as "NOMBRES AD4",
hah.paterno_adi4  as "APELLIDO PATERNO AD4",
hah.materno_adi4  as "APELLIDO MATERNO AD4",
split_part(hah.rut_adi4, '-',  1) as "RUT AD4",
split_part(hah.rut_adi4, '-',  2) as "DIGITO VERIFICADOR AD4",
(case when (trim(hah.nombre_adi4) <> '' or not null)
then (case when (trim(hah.telefono_adi4 ) <> '' or not null) then hah.telefono_adi4 else hfh.for_his_metadata::json->>'Telefono' 
end)
else ''
end) as "TELEFONO PARTICULAR AD4",
'' as "MOVIL PARTICULAR AD4",
(case when (trim(hah.nombre_adi4) <> '' or not null)
then (case when (trim(hah.mail_adi4 ) <> '' or not null) then hah.mail_adi4 else hfh.for_his_metadata::json->>'Mail'
end)
else ''
end) as "Mail AD4",
hah.fecha_nacimiento_adi4 as "FEC_NACIMIENTO AD4",
hah.direccion_adi4  as "DIRECCION PARTICULAR AD4",
hah.comuna_adi4  as "COMUNA PARTICULAR AD4",
hah.ciudad_adi4  as "CIUDAD PARTICULAR AD4",
ltrim(hah.cod_adi4,'0')  as "PARENTESCO AD4",
(case when (trim(hah.nombre_adi4) <> '' or hah.nombre_adi4 is not null) then '0'
else '' end) as "PRIMA AD4",
-------------------
(case when (trim(hah.nombre_adi5) <> '' or hah.nombre_adi5 is not null) 
then (case 
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='31' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='32' then '03'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='41' then '04'
 when replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','')='42' then '04'
 else '0'||replace(hfh.for_his_metadata::json->>'pro_cod_plan_sponsor','0','') end)
else '' end) as "PLAN AD5",
 concat(hah.nombre_adi5,' ',segundo_nombre_adi5) as "NOMBRES AD5",
hah.paterno_adi5  as "APELLIDO PATERNO AD5",
hah.materno_adi5  as "APELLIDO MATERNO AD5",
split_part(hah.rut_adi5, '-',  1) as "RUT AD5",
split_part(hah.rut_adi5, '-',  2) as "DIGITO VERIFICADOR AD5",
(case when (trim(hah.nombre_adi5) <> '' or not null)
then (case when (trim(hah.telefono_adi5 ) <> '' or not null) then hah.telefono_adi5 else hfh.for_his_metadata::json->>'Telefono' 
end)
else ''
end) as "TELEFONO PARTICULAR AD5",
'' as "MOVIL PARTICULAR AD5",
(case when (trim(hah.nombre_adi5) <> '' or not null)
then (case when (trim(hah.mail_adi5 ) <> '' or not null) then hah.mail_adi5 else hfh.for_his_metadata::json->>'Mail'
end)
else ''
end) as "Mail AD5",
hah.fecha_nacimiento_adi5 as "FEC_NACIMIENTO AD5",
hah.direccion_adi5  as "DIRECCION PARTICULAR AD5",
hah.comuna_adi5  as "COMUNA PARTICULAR AD5",
hah.ciudad_adi5  as "CIUDAD PARTICULAR AD5",
ltrim(hah.cod_adi5,'0')   as "PARENTESCO AD5",
(case when (trim(hah.nombre_adi5) <> '' or hah.nombre_adi5 is not null) then '0'
else '' end) as "PRIMA AD5",
------beneficiario
concat(hbh.nombre_benef1,' ',segundo_nombre_benef1)as "NOMBRES B1",
hbh.paterno_benef1 as "APELLIDO PATERNO B1",
hbh.materno_benef1 as "APELLIDO MATERNO B1",
split_part(hbh.rut_benef1, '-',  1) as "RUT B1",
split_part(hbh.rut_benef1, '-',  2) as "DIGITO VERIFICADOR B1",
'' as "FEC_NACIMIENTO B1",
ltrim(hbh.cod_benef1,'0') as "PARENTESCO B1",
hbh.direccion_benef1 as "DIRECCION PARTICULAR B1",
hbh.comuna_benef1 as "COMUNA PARTICULAR B1",
hbh.ciudad_benef1 as "CIUDAD PARTICULAR B1",
hbh.pais_benef1 as "PAIS RESIDENCIA B1",
hbh.nacionalidad_benef1 as "NACIONALIDAD B1",
hbh.porcentaje_benef1 as "PORCENTAJE B1",
(case when (trim(hbh.nombre_benef1) <> '' or not null) then(case when (trim(hbh.telefono_benef1) <> '' or not null and hbh.nombre_benef1 <> '')
then hbh.telefono_benef1
else hfh.for_his_metadata::json->>'Telefono' end) else '' end) as "TELEFONO PARTICULAR B1",
'' as "MOVIL PARTICULAR B1",
(case when (trim(hbh.nombre_benef1) <> '' or not null) then(case when (trim(hbh.mail_benef1) <> '' or not null and hbh.nombre_benef1 <> '')
then hbh.mail_benef1 else hfh.for_his_metadata::json->>'Mail' end)
else '' end)as "CORREO PARTICULAR B1",
-------------------
concat(hbh.nombre_benef2,' ',segundo_nombre_benef2)as "NOMBRES B2",
hbh.paterno_benef2 as "APELLIDO PATERNO B2",
hbh.materno_benef2 as "APELLIDO MATERNO B2",
split_part(hbh.rut_benef2, '-',  1) as "RUT B2",
split_part(hbh.rut_benef2, '-',  2) as "DIGITO VERIFICADOR B2",
'' as "FEC_NACIMIENTO B2",
ltrim(hbh.cod_benef2,'0') as "PARENTESCO B2",
hbh.direccion_benef2 as "DIRECCION PARTICULAR B2",
hbh.comuna_benef2 as "COMUNA PARTICULAR B2",
hbh.ciudad_benef2 as "CIUDAD PARTICULAR B2",
hbh.pais_benef2 as "PAIS RESIDENCIA B2",
hbh.nacionalidad_benef2 as "NACIONALIDAD B2",
hbh.porcentaje_benef2 as "PORCENTAJE B2",
(case when (trim(hbh.nombre_benef2) <> '' or not null) then(case when (trim(hbh.telefono_benef2) <> '' or not null and hbh.nombre_benef2 <> '')
then hbh.telefono_benef2
else hfh.for_his_metadata::json->>'Telefono' end) else '' end) as "TELEFONO PARTICULAR B2",
'' as "MOVIL PARTICULAR B2",
(case when (trim(hbh.nombre_benef2) <> '' or not null) then(case when (trim(hbh.mail_benef2) <> '' or not null and hbh.nombre_benef2 <> '')
then hbh.mail_benef2 else hfh.for_his_metadata::json->>'Mail' end)
else '' end)as "CORREO PARTICULAR B2",
------------------ 
concat(hbh.nombre_benef3,' ',segundo_nombre_benef3)as "NOMBRES B3",
hbh.paterno_benef3 as "APELLIDO PATERNO B3",
hbh.materno_benef3 as "APELLIDO MATERNO B3",
split_part(hbh.rut_benef3, '-',  1) as "RUT B3",
split_part(hbh.rut_benef3, '-',  2) as "DIGITO VERIFICADOR B3",
'' as "FEC_NACIMIENTO B3",
ltrim(hbh.cod_benef3,'0') as "PARENTESCO B3",
hbh.direccion_benef3 as "DIRECCION PARTICULAR B3",
hbh.comuna_benef3 as "COMUNA PARTICULAR B3",
hbh.ciudad_benef3 as "CIUDAD PARTICULAR B3",
hbh.pais_benef3 as "PAIS RESIDENCIA B3",
hbh.nacionalidad_benef3 as "NACIONALIDAD B3",
hbh.porcentaje_benef3 as "PORCENTAJE B3",
(case when (trim(hbh.nombre_benef3) <> '' or not null) then(case when (trim(hbh.telefono_benef3) <> '' or not null and hbh.nombre_benef3 <> '')
then hbh.telefono_benef3
else hfh.for_his_metadata::json->>'Telefono' end) else '' end) as "TELEFONO PARTICULAR B3",
'' as "MOVIL PARTICULAR B3",
(case when (trim(hbh.nombre_benef3) <> '' or not null) then(case when (trim(hbh.mail_benef3) <> '' or not null and hbh.nombre_benef3 <> '')
then hbh.mail_benef3 else hfh.for_his_metadata::json->>'Mail' end)
else '' end)as "CORREO PARTICULAR B3",
-------------------
concat(hbh.nombre_benef4,' ',segundo_nombre_benef4)as "NOMBRES B4",
hbh.paterno_benef4 as "APELLIDO PATERNO B4",
hbh.materno_benef4 as "APELLIDO MATERNO B4",
split_part(hbh.rut_benef4, '-',  1) as "RUT B4",
split_part(hbh.rut_benef4, '-',  2) as "DIGITO VERIFICADOR B4",
'' as "FEC_NACIMIENTO B4",
ltrim(hbh.cod_benef4,'0') as "PARENTESCO B4",
hbh.direccion_benef4 as "DIRECCION PARTICULAR B4",
hbh.comuna_benef4 as "COMUNA PARTICULAR B4",
hbh.ciudad_benef4 as "CIUDAD PARTICULAR B4",
hbh.pais_benef4 as "PAIS RESIDENCIA B4",
hbh.nacionalidad_benef4 as "NACIONALIDAD B4",
hbh.porcentaje_benef4 as "PORCENTAJE B4",
(case when (trim(hbh.nombre_benef4) <> '' or not null) then(case when (trim(hbh.telefono_benef4) <> '' or not null and hbh.nombre_benef4 <> '')
then hbh.telefono_benef4
else hfh.for_his_metadata::json->>'Telefono' end) else '' end) as "TELEFONO PARTICULAR B4",
'' as "MOVIL PARTICULAR B4",
(case when (trim(hbh.nombre_benef4) <> '' or not null) then(case when (trim(hbh.mail_benef4) <> '' or not null and hbh.nombre_benef4 <> '')
then hbh.mail_benef4 else hfh.for_his_metadata::json->>'Mail' end)
else '' end)as "CORREO PARTICULAR B4",
-------------------
concat(hbh.nombre_benef5,' ',segundo_nombre_benef5)as "NOMBRES B5",
hbh.paterno_benef5 as "APELLIDO PATERNO B5",
hbh.materno_benef5 as "APELLIDO MATERNO B5",
split_part(hbh.rut_benef5, '-',  1) as "RUT B5",
split_part(hbh.rut_benef5, '-',  2) as "DIGITO VERIFICADOR B5",
'' as "FEC_NACIMIENTO B5",
ltrim(hbh.cod_benef5,'0') as "PARENTESCO B5",
hbh.direccion_benef5 as "DIRECCION PARTICULAR B5",
hbh.comuna_benef5 as "COMUNA PARTICULAR B5",
hbh.ciudad_benef5 as "CIUDAD PARTICULAR B5",
hbh.pais_benef5 as "PAIS RESIDENCIA B5",
hbh.nacionalidad_benef5 as "NACIONALIDAD B5",
hbh.porcentaje_benef5 as "PORCENTAJE B5",
(case when (trim(hbh.nombre_benef5) <> '' or not null) then(case when (trim(hbh.telefono_benef5) <> '' or not null and hbh.nombre_benef5 <> '')
then hbh.telefono_benef5
else hfh.for_his_metadata::json->>'Telefono' end) else '' end) as "TELEFONO PARTICULAR B5",
'' as "MOVIL PARTICULAR B5",
(case when (trim(hbh.nombre_benef5) <> '' or not null) then(case when (trim(hbh.mail_benef5) <> '' or not null and hbh.nombre_benef5 <> '')
then hbh.mail_benef5 else hfh.for_his_metadata::json->>'Mail' end)
else '' end)as "CORREO PARTICULAR B5",
-------------------
concat(hbh.nombre_benef6,' ',segundo_nombre_benef6)as "NOMBRES B6",
hbh.paterno_benef6 as "APELLIDO PATERNO B6",
hbh.materno_benef6 as "APELLIDO MATERNO B6",
split_part(hbh.rut_benef6, '-',  1) as "RUT B6",
split_part(hbh.rut_benef6, '-',  2) as "DIGITO VERIFICADOR B6",
'' as "FEC_NACIMIENTO B6",
ltrim(hbh.cod_benef6,'0') as "PARENTESCO B6",
hbh.direccion_benef6 as "DIRECCION PARTICULAR B6",
hbh.comuna_benef6 as "COMUNA PARTICULAR B6",
hbh.ciudad_benef6 as "CIUDAD PARTICULAR B6",
hbh.pais_benef6 as "PAIS RESIDENCIA B6",
hbh.nacionalidad_benef6 as "NACIONALIDAD B6",
hbh.porcentaje_benef6 as "PORCENTAJE B6",
(case when (trim(hbh.nombre_benef6) <> '' or not null) then(case when (trim(hbh.telefono_benef6) <> '' or not null and hbh.nombre_benef6 <> '')
then hbh.telefono_benef6
else hfh.for_his_metadata::json->>'Telefono' end) else '' end) as "TELEFONO PARTICULAR B6",
'' as "MOVIL PARTICULAR B6",
(case when (trim(hbh.nombre_benef6) <> '' or not null) then(case when (trim(hbh.mail_benef6) <> '' or not null and hbh.nombre_benef6 <> '')
then hbh.mail_benef6 else hfh.for_his_metadata::json->>'Mail' end)
else '' end)as "CORREO PARTICULAR B6",
-------------------
concat(hbh.nombre_benef7,' ',segundo_nombre_benef7)as "NOMBRES B7",
hbh.paterno_benef7 as "APELLIDO PATERNO B7",
hbh.materno_benef7 as "APELLIDO MATERNO B7",
split_part(hbh.rut_benef7, '-',  1) as "RUT B7",
split_part(hbh.rut_benef7, '-',  2) as "DIGITO VERIFICADOR B7",
'' as "FEC_NACIMIENTO B7",
ltrim(hbh.cod_benef7,'0') as "PARENTESCO B7",
hbh.direccion_benef7 as "DIRECCION PARTICULAR B7",
hbh.comuna_benef7 as "COMUNA PARTICULAR B7",
hbh.ciudad_benef7 as "CIUDAD PARTICULAR B7",
hbh.pais_benef7 as "PAIS RESIDENCIA B7",
hbh.nacionalidad_benef7 as "NACIONALIDAD B7",
hbh.porcentaje_benef7 as "PORCENTAJE B7",
(case when (trim(hbh.nombre_benef7) <> '' or not null) then(case when (trim(hbh.telefono_benef7) <> '' or not null and hbh.nombre_benef7 <> '')
then hbh.telefono_benef7
else hfh.for_his_metadata::json->>'Telefono' end) else '' end) as "TELEFONO PARTICULAR B7",
'' as "MOVIL PARTICULAR B7",
(case when (trim(hbh.nombre_benef7) <> '' or not null) then(case when (trim(hbh.mail_benef7) <> '' or not null and hbh.nombre_benef7 <> '')
then hbh.mail_benef7 else hfh.for_his_metadata::json->>'Mail' end)
else '' end)as "CORREO PARTICULAR B7",
'000' as "ESTADO PROPUESTA"
-------
FROM "Genesys".his_form_history hfh
left join "Genesys".cam_contact cc on cc.con_id::varchar = for_his_con_id
left join "Genesys".his_gestion_history hgh on	hgh.ges_his_genesys_id = hfh.for_his_genesys_id
left join calidad_app.cal_assignments ca on	ca.cal_assig_interaction = hfh.for_his_genesys_id and hfh.for_his_con_id::varchar = ca.cal_assig_contact
left join calidad_app.cal_evaluations ce on ce.cal_eval_interaction = hfh.for_his_genesys_id
left join calidad_app.cal_estado ce2 on ce2.est_id::varchar = ce.cal_eval_typing
left join "Genesys".pro_desc_cam pdc on pdc.pro_cod_plan = hfh.for_his_metadata::json->>'pro_cod_plan_sponsor'
left join chubb.log_altas_car_cla_hsp lacch on lacch.con_id = hfh.for_his_con_id
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
mi_resultado.fecha_nacimiento_benef1,
mi_resultado.pais_benef1,
mi_resultado.nacionalidad_benef1,
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
mi_resultado.fecha_nacimiento_benef2,
mi_resultado.pais_benef2,
mi_resultado.nacionalidad_benef2,
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
mi_resultado.fecha_nacimiento_benef3,
mi_resultado.pais_benef3,
mi_resultado.nacionalidad_benef3,
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
mi_resultado.fecha_nacimiento_benef4,
mi_resultado.pais_benef4,
mi_resultado.nacionalidad_benef4,
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
mi_resultado.fecha_nacimiento_benef5,
mi_resultado.pais_benef5,
mi_resultado.nacionalidad_benef5,
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
mi_resultado.fecha_nacimiento_benef6,
mi_resultado.pais_benef6,
mi_resultado.nacionalidad_benef6,
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
mi_resultado.ciudad_benef7,
mi_resultado.fecha_nacimiento_benef7,
mi_resultado.pais_benef7,
mi_resultado.nacionalidad_benef7
from crosstab('
SELECT hbh.ben_his_con_id::int, (ben_his_id-subquery.ben_his_con_id::int)||''101'' as categoria,case
when hbh.ben_his_metadata::json->>''cod_parentesco_campana'' is null then '' ''
	else SPLIT_PART(hbh.ben_his_metadata::json->>''cod_parentesco_campana'', ''-'', 2)
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
when hbh.ben_his_metadata::json->>''ComunaId'' is null then '' ''
   else hbh.ben_his_metadata::json->>''ComunaId''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''112'' as categoria,case
when hbh.ben_his_metadata::json->>''CiudadId'' is null then '' ''
   else hbh.ben_his_metadata::json->>''CiudadId''
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''113'' as categoria,case
when hbh.ben_his_metadata::json->>''Fechanacimiento'' is null then '' ''
   else to_char((hbh.ben_his_metadata::json->>''Fechanacimiento'')::date,''DD/MM/YYYY'')
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''113'' as categoria,case
when hbh.ben_his_metadata::json->>''PaisId'' is null then '' ''
   else (hbh.ben_his_metadata::json->>''PaisId'')
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''113'' as categoria,case
when hbh.ben_his_metadata::json->>''NacionalidadId'' is null then '' ''
   else (hbh.ben_his_metadata::json->>''NacionalidadId'')
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
fecha_nacimiento_benef1 text,
pais_benef1 text,
nacionalidad_benef1 text,
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
fecha_nacimiento_benef2 text,
pais_benef2 text,
nacionalidad_benef2 text,
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
fecha_nacimiento_benef3 text,
pais_benef3 text,
nacionalidad_benef3 text,
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
fecha_nacimiento_benef4 text,
pais_benef4 text,
nacionalidad_benef4 text,
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
fecha_nacimiento_benef5 text,
pais_benef5 text,
nacionalidad_benef5 text,
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
fecha_nacimiento_benef6 text,
pais_benef6 text,
nacionalidad_benef6 text,
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
ciudad_benef7 text,
fecha_nacimiento_benef7 text,
pais_benef7 text,
nacionalidad_benef7 text)) hbh on hbh.ben_his_con_id = hfh.for_his_con_id::numeric
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
mi_resultado.fecha_nacimiento_adi1,
mi_resultado.pais_adi1,
mi_resultado.nacionalidad_adi1,
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
mi_resultado.fecha_nacimiento_adi2,
mi_resultado.pais_adi2,
mi_resultado.nacionalidad_adi2,
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
mi_resultado.fecha_nacimiento_adi3,
mi_resultado.pais_adi3,
mi_resultado.nacionalidad_adi3,
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
mi_resultado.fecha_nacimiento_adi4,
mi_resultado.pais_adi4,
mi_resultado.nacionalidad_adi4,
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
mi_resultado.fecha_nacimiento_adi5,
mi_resultado.pais_adi5,
mi_resultado.nacionalidad_adi5,
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
mi_resultado.fecha_nacimiento_adi6,
mi_resultado.pais_adi6,
mi_resultado.nacionalidad_adi6,
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
mi_resultado.ciudad_adi7,
mi_resultado.fecha_nacimiento_adi7,
mi_resultado.pais_adi7,
mi_resultado.nacionalidad_adi7
from crosstab('
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''101'' as categoria,case
when hah.adi_his_metadata::json->>''cod_parentesco_campana'' is null then '' ''
	 else hah.adi_his_metadata::json->>''cod_parentesco_campana''
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
when hah.adi_his_metadata::json->>''ComunaId'' is null then ''''
	 else hah.adi_his_metadata::json->>''ComunaId''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''112'' as categoria,case
when hah.adi_his_metadata::json->>''CiudadId'' is null then ''''
	 else hah.adi_his_metadata::json->>''CiudadId''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''113'' as categoria,case
when hah.adi_his_metadata::json->>''Fechanacimiento'' is null then ''''
	 else hah.adi_his_metadata::json->>''Fechanacimiento''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''114'' as categoria,case
when hah.adi_his_metadata::json->>''NacionalidadId'' is null then ''''
	 else hah.adi_his_metadata::json->>''NacionalidadId''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''115'' as categoria,case
when hah.adi_his_metadata::json->>''PaisId'' is null then ''''
	 else hah.adi_his_metadata::json->>''PaisId''
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
fecha_nacimiento_adi1 text,
pais_adi1 text,
nacionalidad_adi1 text,
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
fecha_nacimiento_adi2 text,
pais_adi2 text,
nacionalidad_adi2 text,
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
fecha_nacimiento_adi3 text,
pais_adi3 text,
nacionalidad_adi3 text,
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
fecha_nacimiento_adi4 text,
pais_adi4 text,
nacionalidad_adi4 text,
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
fecha_nacimiento_adi5 text,
pais_adi5 text,
nacionalidad_adi5 text,
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
fecha_nacimiento_adi6 text,
pais_adi6 text,
nacionalidad_adi6 text,
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
ciudad_adi7 text,
fecha_nacimiento_adi7 text,
pais_adi7 text,
nacionalidad_adi7 text)) hah on hah.adi_his_con_id = hfh.for_his_con_id::numeric
--left join "Genesys".his_beneficiary_history hbh on  hbh.ben_his_id = hfh.for_his_id 
where
hgh.ges_his_tipificacion_4 in ('ARGUMENTADO SI','VENTA RECUPERADA')
and length(for_his_genesys_id) > 30
and cc.con_genesys_campaing_id is not null
--and lacch.con_id is null 
--and ce2.est_id in (9,10,15,11)
and ce2.est_id in (1,4,14)
and ce.cal_eval_state is null
--and hfh.for_his_date_form between '20211201' and '20211231'
--and hfh.for_his_date_form between to_char(now (),'YYYY-MM-01')::date and to_char(now () - INTERVAL '1 DAY','YYYY-MM-DD')::date
and for_his_metadata::json->>'id_campana' in ('506d64a7-9e0f-4d01-bff0-eb3505d67275','cc4fc4a7-60a6-4860-a6bf-cc4baef8f056','81244458-cf57-4d49-8f6f-e08bf354d97d','5d48a42e-58d9-4e1b-b889-0d9b20972bea')
limit 2