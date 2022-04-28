select
a.idunico as "con_id",
cod_venta as "id_interaccion",
'2' as "CALL ORIGNE",
'07' as "CANAL VENTA PROPUESTA",
'Hospitali' as "CAMPAÑA TMK",
folio as "INDICE TMK",
'8149' as "CODIGO PRODUCTO",
'220031390' as "POLIZA",
to_char(now(),'DD/MM/YYYY') as "FECHA SOLICITUD",
(case 
 when replace(a.plan,'A','')='31' then '03'
 when replace(a.plan,'A','')='32' then '03'
 when replace(a.plan,'A','')='41' then '04'
 when replace(a.plan,'A','')='42' then '04'
 else '0'||replace(a.plan,'A','') end) as "PLAN TIT"
,nombre_asegurado  as "NOMBRES"
,paterno_asegurado  as "APELLIDO PATERNO TIT"
,materno_asegurado  as "APELLIDO MATERNO TIT"
,substring(rut_aseg,1,position('-' in rut_aseg)-1) as "RUT TIT"
,substring(rut_aseg,position('-' in rut_aseg)+1,1) as "DIGITO VERIFICADOR TIT"
,fono_venta as  "TELEFONO PARTICULAR TIT"
,fono_venta as "MOVIL PARTICULAR TIT"
,isnull(mail_venta,'') as "CORREO TIT"
,'' as "GENERO TIT"
,fec_nac_aseg  as "FECHA DE NACIMIENTO TIT"
,direccion_venta as "DIRECCION PARTICULAR TIT"
,comuna_venta as "COMUNA PARTICULAR TIT"
,ciudad_venta as "CIUDAD PARTICULAR TIT"
,'' as "PAIS RESIDENCIA"
,'' as "NACIONALIDAD"
,'' as "PRIMA TIT"
,'' as "PROFESION TIT"
,(case 
 when replace(a.plan,'A','')='31' then '03'
 when replace(a.plan,'A','')='32' then '03'
 when replace(a.plan,'A','')='41' then '04'
 when replace(a.plan,'A','')='42' then '04'
 else '0'||replace(a.plan,'A','') end) as "PLAN CONT"
,nombre_asegurado  as "NOMBRES CONT"
,paterno_asegurado  as "APELLIDO PATERNO CONT"
,materno_asegurado  as "APELLIDO MATERNO CONT"
,substring(rut_aseg,1,position('-' in rut_aseg)-1) as "RUT CONT"
,substring(rut_aseg,position('-' in rut_aseg)+1,1) as "DIGITO VERIFICADOR CONT"
,fono_venta as  "TELEFONO PARTICULAR CONT"
,fono_venta as "MOVIL PARTICULAR CONT"
,isnull(mail_venta,'') as "CORREO CONT"
,'' as "GENERO CONT"
,fec_nac_aseg  as "FECHA DE NACIMIENTO CONT"
,direccion_venta as "DIRECCION PARTICULAR CONT"
,comuna_venta as "COMUNA PARTICULAR CONT"
,ciudad_venta as "CIUDAD PARTICULAR CONT"
,'' as "PAIS RESIDENCIA CONT"
,'' as "NACIONALIDAD CONT"
,'' as "PRIMA CONT"
,'' as "PROFESION CONT"
,(case 
 when replace(a.plan,'A','')='31' then '03'
 when replace(a.plan,'A','')='32' then '03'
 when replace(a.plan,'A','')='41' then '04'
 when replace(a.plan,'A','')='42' then '04'
 else '0'||replace(a.plan,'A','') end) as "PLAN PAG"
,nombre_asegurado  as "NOMBRES PAG"
,paterno_asegurado  as "APELLIDO PATERNO PAG"
,materno_asegurado  as "APELLIDO MATERNO PAG"
,substring(rut_aseg,1,position('-' in rut_aseg)-1) as "RUT PAG"
,substring(rut_aseg,position('-' in rut_aseg)+1,1) as "DIGITO VERIFICADOR PAG"
,fono_venta as  "TELEFONO PARTICULAR PAG"
,fono_venta as "MOVIL PARTICULAR PAG"
,isnull(mail_venta,'') as "CORREO PAG"
,'' as "GENERO PAG"
,fec_nac_aseg  as "FECHA DE NACIMIENTO PAG"
,direccion_venta as "DIRECCION PARTICULAR PAG"
,comuna_venta as "COMUNA PARTICULAR PAG"
,ciudad_venta as "CIUDAD PARTICULAR PAG"
,'' as "PAIS RESIDENCIA PAG"
,'' as "NACIONALIDAD PAG"
,'' as "PRIMA PAG"
,'' as "PROFESION PAG",
isnull(ben.nombre_benef1,'') as  "NOMBRES B1",
isnull(ben.paterno_benef1,'') as  "APELLIDO PATERNO B1",
isnull(ben.materno_benef1,'') as "APELLIDO MATERNO B1",
isnull(ben.rut_benef1,'') as  "RUT B1",
'' as "FEC_NACIMIENTO B1",
isnull(ben.cod_benef1,'') as "PARENTESCO B1",
isnull(ben.direccion_benef1,'') as "DIRECCION PARTICULAR B1",
isnull(ben.comuna_benef1,'') as "COMUNA PARTICULAR B1",
isnull(ben.ciudad_benef1,'') as "CIUDAD PARTICULAR B1",
'' as "PAIS RESIDENCIA B1",
'' as "NACIONALIDAD B1",
isnull(ben.porc_benef1,'') as "PORCENTAJE B1",
isnull(ben.fono_benef1,'') as "TELEFONO PARTICULAR B1",
isnull(ben.cel_benef1,'') as "MOVIL PARTICULAR B1",
isnull(ben.mail_benef1,'') as "CORREO PARTICULAR B1",
-----
isnull(ben.nombre_benef2,'') as  "NOMBRES B2",
isnull(ben.paterno_benef2,'') as  "APELLIDO PATERNO B2",
isnull(ben.materno_benef2,'') as "APELLIDO MATERNO B2",
isnull(ben.rut_benef2,'') as  "RUT B2",
'' as "FEC_NACIMIENTO B2",
isnull(ben.cod_benef2,'') as "PARENTESCO B2",
isnull(ben.direccion_benef2,'') as "DIRECCION PARTICULAR B2",
isnull(ben.comuna_benef2,'') as "COMUNA PARTICULAR B2",
isnull(ben.ciudad_benef2,'') as "CIUDAD PARTICULAR B2",
'' as "PAIS RESIDENCIA B2",
'' as "NACIONALIDAD B2",
isnull(ben.porc_benef2,'') as "PORCENTAJE B2",
isnull(ben.fono_benef2,'') as "TELEFONO PARTICULAR B2",
isnull(ben.cel_benef2,'') as "MOVIL PARTICULAR B2",
isnull(ben.mail_benef2,'') as "CORREO PARTICULAR B2",
isnull(ben.nombre_benef3,'') as  "NOMBRES B3",
isnull(ben.paterno_benef3,'') as  "APELLIDO PATERNO B3",
isnull(ben.materno_benef3,'') as "APELLIDO MATERNO B3",
isnull(ben.rut_benef3,'') as  "RUT B3",
'' as "FEC_NACIMIENTO B3",
isnull(ben.cod_benef3,'') as "PARENTESCO B3",
isnull(ben.direccion_benef3,'') as "DIRECCION PARTICULAR B3",
isnull(ben.comuna_benef3,'') as "COMUNA PARTICULAR B3",
isnull(ben.ciudad_benef3,'') as "CIUDAD PARTICULAR B3",
'' as "PAIS RESIDENCIA B3",
'' as "NACIONALIDAD B3",
isnull(ben.porc_benef3,'') as "PORCENTAJE B3",
isnull(ben.fono_benef3,'') as "TELEFONO PARTICULAR B3",
isnull(ben.cel_benef3,'') as "MOVIL PARTICULAR B3",
isnull(ben.mail_benef3,'') as "CORREO PARTICULAR B3",
isnull(ben.nombre_benef4,'') as  "NOMBRES B4",
isnull(ben.paterno_benef4,'') as  "APELLIDO PATERNO B4",
isnull(ben.materno_benef4,'') as "APELLIDO MATERNO B4",
isnull(ben.rut_benef4,'') as  "RUT B4",
'' as "FEC_NACIMIENTO B4",
isnull(ben.cod_benef4,'') as "PARENTESCO B4",
isnull(ben.direccion_benef4,'') as "DIRECCION PARTICULAR B4",
isnull(ben.comuna_benef4,'') as "COMUNA PARTICULAR B4",
isnull(ben.ciudad_benef4,'') as "CIUDAD PARTICULAR B4",
'' as "PAIS RESIDENCIA B4",
'' as "NACIONALIDAD B4",
isnull(ben.porc_benef4,'') as "PORCENTAJE B4",
isnull(ben.fono_benef4,'') as "TELEFONO PARTICULAR B4",
isnull(ben.cel_benef4,'') as "MOVIL PARTICULAR B4",
isnull(ben.mail_benef4,'') as "CORREO PARTICULAR B4",
isnull(ben.nombre_benef5,'') as  "NOMBRES B5",
isnull(ben.paterno_benef5,'') as  "APELLIDO PATERNO B5",
isnull(ben.materno_benef5,'') as "APELLIDO MATERNO B5",
isnull(ben.rut_benef5,'') as  "RUT B5",
'' as "FEC_NACIMIENTO B5",
isnull(ben.cod_benef5,'') as "PARENTESCO B5",
isnull(ben.direccion_benef5,'') as "DIRECCION PARTICULAR B5",
isnull(ben.comuna_benef5,'') as "COMUNA PARTICULAR B5",
isnull(ben.ciudad_benef5,'') as "CIUDAD PARTICULAR B5",
'' as "PAIS RESIDENCIA B5",
'' as "NACIONALIDAD B5",
isnull(ben.porc_benef5,'') as "PORCENTAJE B5",
isnull(ben.fono_benef5,'') as "TELEFONO PARTICULAR B5",
isnull(ben.cel_benef5,'') as "MOVIL PARTICULAR B5",
isnull(ben.mail_benef5,'') as "CORREO PARTICULAR B5",
isnull(ben.nombre_benef6,'') as  "NOMBRES B6",
isnull(ben.paterno_benef6,'') as  "APELLIDO PATERNO B6",
isnull(ben.materno_benef6,'') as "APELLIDO MATERNO B6",
isnull(ben.rut_benef6,'') as  "RUT B6",
'' as "FEC_NACIMIENTO B6",
isnull(ben.cod_benef6,'') as "PARENTESCO B6",
isnull(ben.direccion_benef6,'') as "DIRECCION PARTICULAR B6",
isnull(ben.comuna_benef6,'') as "COMUNA PARTICULAR B6",
isnull(ben.ciudad_benef6,'') as "CIUDAD PARTICULAR B6",
'' as "PAIS RESIDENCIA B6",
'' as "NACIONALIDAD B6",
isnull(ben.porc_benef6,'') as "PORCENTAJE B6",
isnull(ben.fono_benef6,'') as "TELEFONO PARTICULAR B6",
isnull(ben.cel_benef6,'') as "MOVIL PARTICULAR B6",
isnull(ben.mail_benef6,'') as "CORREO PARTICULAR B6",
isnull(ben.nombre_benef7,'') as  "NOMBRES B7",
isnull(ben.paterno_benef7,'') as  "APELLIDO PATERNO B7",
isnull(ben.materno_benef7,'') as "APELLIDO MATERNO B7",
isnull(ben.rut_benef7,'') as  "RUT B7",
'' as "FEC_NACIMIENTO B7",
isnull(ben.cod_benef7,'') as "PARENTESCO B7",
isnull(ben.direccion_benef7,'') as "DIRECCION PARTICULAR B7",
isnull(ben.comuna_benef7,'') as "COMUNA PARTICULAR B7",
isnull(ben.ciudad_benef7,'') as "CIUDAD PARTICULAR B7",
'' as "PAIS RESIDENCIA B7",
'' as "NACIONALIDAD B7",
isnull(ben.porc_benef7,'') as "PORCENTAJE B7",
isnull(ben.fono_benef7,'') as "TELEFONO PARTICULAR B7",
isnull(ben.cel_benef7,'') as "MOVIL PARTICULAR B7",
isnull(ben.mail_benef7,'') as "CORREO PARTICULAR B7",
'000' as "ESTADO PROPUESTA"
into cardif_hospitalario_familiar.result
 from cardif_hospitalario_familiar.ventas a
 left join cardif_hospitalario_familiar.log_altas_car_cla_hsp lacch on lacch.con_id::numeric = a.idunico::numeric
---------------------------------
left join (select idunico,
mi_resultado.cod_benef1 as cod_benef1,
mi_resultado.cod_aseg1 as cod_aseg1,
mi_resultado.rut_benef1 as rut_benef1,
mi_resultado.nombre_benef1 as nombre_benef1,
mi_resultado.paterno_benef1 as paterno_benef1,
mi_resultado.materno_benef1 as materno_benef1,
mi_resultado.porc_benef1 as porc_benef1,
mi_resultado.fono_benef1 as fono_benef1,
mi_resultado.cel_benef1 as cel_benef1,
mi_resultado.mail_benef1 as mail_benef1,
mi_resultado.direccion_benef1 as direccion_benef1,
mi_resultado.comuna_benef1 as comuna_benef1,
mi_resultado.ciudad_benef1 as ciudad_benef1,
mi_resultado.cod_benef2 as cod_benef2,
mi_resultado.cod_aseg2 as cod_aseg2,
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
mi_resultado.cod_benef3 as cod_benef3,
mi_resultado.cod_aseg3 as cod_aseg3,
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
mi_resultado.cod_benef4 as cod_benef4,
mi_resultado.cod_aseg4 as cod_aseg4,
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
mi_resultado.cod_benef5 as cod_benef5,
mi_resultado.cod_aseg5 as cod_aseg5,
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
mi_resultado.cod_benef6 as cod_benef6,
mi_resultado.cod_aseg6 as cod_aseg6,
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
mi_resultado.cod_benef7 as cod_benef7,
mi_resultado.cod_aseg7 as cod_aseg7,
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
mi_resultado.ciudad_benef7 as ciudad_benef7
from crosstab('
select total.idunico, total.categoria, total.salida from(
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''10'' as categoria,parentesco_benef::varchar as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''11'' as categoria, ''''  as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''12'' as categoria,'' '' as salida
--select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''12'' as categoria,b.rut_benef::varchar as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''13'' as categoria,b.nombre_benef as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''14'' as categoria,b.paterno_benef as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''15'' as categoria,b.materno_benef as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''16'' as categoria,b.participacion_benef::varchar as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''17'' as categoria,b.fono_beneficiario as salida
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
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''19'' as categoria,b.mail_beneficiario::varchar as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''20'' as categoria,b.direccion_beneficiario::varchar as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''21'' as categoria,b.comuna_beneficiario::varchar as salida
  from cardif_hospitalario_familiar.beneficiarios as b inner join (select min(b.cod_benef) as mini,b.idunico
  from cardif_hospitalario_familiar.beneficiarios as b
group by b.idunico order by b.idunico, mini) as subquery on b.idunico = subquery.idunico
union
select b.cod_benef, b.idunico,(cod_benef-subquery.mini+1)||''22'' as categoria,b.ciudad_beneficiario::varchar as salida
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
ciudad_benef7 character varying
))ben on ben.idunico = a.idunico
where estado_venta in ('OK','RECUPERADO','')
and to_date(fecha, 'YYYYMMDD') between to_char(now (),'YYYYMM01')::date and to_char(now () - INTERVAL '1 DAY','YYYYMMDD')::date
and lacch.con_id is null 
--and rut_aseg in ('11506083-k','26570019-5','17960924-k','15740278-1','10571158-1','18649949-2','9240476-5','18036007-7','13125081-9','10061209-7','9072397-9','9508286-6','10177238-1','17856737-3','13706777-3','17765005-6')
--and ws_fecha_calidad::int = ".$fecha_ayer. "

--drop table if exists cardif_hospitalario_familiar.result;