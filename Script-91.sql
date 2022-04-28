SELECT
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
when hbh.ben_his_metadata::json->>''Parentesco'' is null then '' ''
	else concat(''0'',tp.codigo)
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
left join cardif_hospitalario.tabla_parentesco tp on tp.descripcion = SPLIT_PART(hbh.ben_his_metadata::json->>''Parentesco'', ''-'', 3)
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int, (ben_his_id-subquery.ben_his_con_id::int)||''102'' as categoria,case
when length(hbh.ben_his_metadata::json->>''Rut'') > 12 then replace(hbh.ben_his_metadata::json->>''Rut'',''0'','''')
when hbh.ben_his_metadata::json->>''Rut'' = ''11111111-1'' then '' ''
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
   else replace(hbh.ben_his_metadata::json->>''SegundoNombre'',''.'','''')
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
   else replace(hbh.ben_his_metadata::json->>''ApMaterno'',''.'','''')
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
when r.comuna_ccla  is null then '' ''
   else r.comuna_ccla 
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
left join cardif_hospitalario.regcomciu r on r.ncomuna = hbh.ben_his_metadata::json->>''ComunaId''
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''112'' as categoria,case
when ciu.ciudad_ccla is null then '' ''
   else ciu.ciudad_ccla
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
left join cardif_hospitalario.regcomciu ciu on ciu.nciudad = hbh.ben_his_metadata::json->>''CiudadId''
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
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''114'' as categoria,case
when hbh.ben_his_metadata::json->>''PaisId'' is null then '' ''
   else (hbh.ben_his_metadata::json->>''PaisId'')
end
  FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''115'' as categoria,case
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
nacionalidad_benef7 text)