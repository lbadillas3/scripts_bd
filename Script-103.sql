(select distinct on (genesys_id) 
 *
from
(select  jso_cdr_genesys_id as genesys_id,
		concat(cc.con_metadata->>'rut'::text,'-' , cc.con_metadata->>'dv')  as "RUT",
	    cc.con_metadata->>'rut'  as "RUT_CUERPO",
	    cc.con_metadata->>'nombre_bdd' as "ID_CAMPANA",
	    cc.con_metadata->>'nombre_bdd' as "N_CAMPANA",
	    '0' as "OPERID",
	    case when to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss') is NULL then to_char(jso_cdr_date , 'yyyy-mm-dd hh24:mi:ss')
		else to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss')
		end as "GES_FECHA",
	    case when g.ges_his_id IS NULL then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'NO ANSWER' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'FAILED' then 'No Contesta'
 		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'BUSY' then 'No Contesta'
		ELSE tch.typ_nivel_3 --nivel 3
		END as "RESULT",
	    case when tch.typ_peso IS NULL then '38'
		when tch.typ_nivel_2 = 'FAILED' then '38'
		when tch.typ_nivel_2 = 'NO ANSWER' then '38'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then '38'
		WHEN tch.typ_nivel_2 = 'BUSY' then '38'
        else tch.typ_peso 
		end as "PESO",
	    case when g.ges_his_id is null then 'INUBICABLE'
		ELSE tch.typ_nivel_1
		END as "GRP_PRY", --nivel 1
	    case when g.ges_his_tipification_2 is null then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'FAILED' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'NO ANSWER' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then 'NO CONTESTA'
        when tch.typ_nivel_2 = 'BUSY' then 'NO CONTESTA'
		else tch.typ_nivel_2
		end as "RESP_CUBO", --nivel 2
	    case when g.ges_his_id is null then 'NO CONTACTADO'  
		ELSE tch.typ_contacto 
		END as "GRP_CONTACTO", --contacto
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "TRADUCCION", --traduccion
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO' 
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "DESCRIPCION", --traduccion
	    (case when uu.use_rut is null then '0'
        when uu.use_rut = '-' then '0'
 		else uu.use_rut
 		end) as "AGE_RUT",
        (case when (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)  is null then 'USUARIO VIRTUAL'
        else (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)
        end) as "AGE_PRIMER_NOMBRE",
	    (case when (to_char(g.ges_his_date_form , 'hh24:mm:ss') <= '15:00:00') then 'AM' else 'PM' end) as "SUPERVISOR",
	    'S3' as "TLMK",
	    'Marisol Becerra' as "JEFE_UNIDAD",
	    hfh.for_his_genesys_id,
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1' ,1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',1,2)::text END) as "FON_AREA",
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',2,10)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',3,10)::text END) as "FON_DATO",
	    '' as "EMAIL",
	    case when hfh.for_his_genesys_id <> '' then '1' else '0' end as "Q_POLIZAS",
	    case when hfh.for_his_metadata->>'pro_valu_plan' is null then '0' else hfh.for_his_metadata->>'pro_valu_plan' end as "UF_POLIZAS",
	    (case when g.ges_his_id is null then 'M'
		else 'H'
		end )as "TIPO_GESTION"
from "Genesys".res_json_genesys_cdr cdr
left join "Genesys".his_gestion_history g on cdr.jso_cdr_genesys_id = g.ges_his_genesys_id AND g.ges_his_tipificacion_4 <> '' 
--and to_char(g.ges_his_date_form, 'yyyymmdd')::integer = to_char(now() ,'yyyymm11')::integer
JOIN  "Genesys".cam_contact cc on left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'dnis')::text,6),-1) = cc.con_metadata->>'telefono1'::text 
and cc.con_genesys_campaing_id in ( '86451d3c-a27e-400b-88fc-6438948b3279') 
--left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'callbackNumbers'->0)::text,5),-1) = cc.con_metadata->>'telefono1'::text 
left join "Genesys".use_user uu on use_genesys_id::text = g.ges_his_use_id::text
left join  "Genesys".typ_con_hom tch on tch.typ_nivel_3 = g.ges_his_tipificacion_4 and tch.typ_id_campana = '86451d3c-a27e-400b-88fc-6438948b3279'
left join "Genesys".his_form_history hfh on hfh.for_his_genesys_id::varchar = g.ges_his_genesys_id::varchar
--join credito_consumo.credito_consumo cc2 on cc.row_id= cc2.row_id
where to_char(jso_cdr_date,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer
and (cdr.jso_cdr_results ::json ->>'outboundCampaignId' in ( '86451d3c-a27e-400b-88fc-6438948b3279'))
and g.ges_his_tipificacion_4 is null
and jso_cdr_genesys_id not in (select ges_his_genesys_id from "Genesys".his_gestion_history G
							   where G.ges_his_metadata->>'id_campana' in ('86451d3c-a27e-400b-88fc-6438948b3279')  
							   and to_char(g.ges_his_Date_form,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer) 

union all

select  jso_cdr_genesys_id as genesys_id,
		concat(cc.con_metadata->>'rut'::text,'-' , cc.con_metadata->>'dv')  as "RUT",
	    cc.con_metadata->>'rut'  as "RUT_CUERPO",
	    cc.con_metadata->>'nombre_bdd' as "ID_CAMPANA",
	    cc.con_metadata->>'nombre_bdd' as "N_CAMPANA",
	    '0' as "OPERID",
	    case when to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss') is NULL then to_char(jso_cdr_date , 'yyyy-mm-dd hh24:mi:ss')
		else to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss')
		end as "GES_FECHA",
	    case when g.ges_his_id IS NULL then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'NO ANSWER' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'FAILED' then 'No Contesta'
 		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'BUSY' then 'No Contesta'
		ELSE tch.typ_nivel_3 --nivel 3
		END as "RESULT",
	    case when tch.typ_peso IS NULL then '38'
		when tch.typ_nivel_2 = 'FAILED' then '38'
		when tch.typ_nivel_2 = 'NO ANSWER' then '38'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then '38'
		WHEN tch.typ_nivel_2 = 'BUSY' then '38'
        else tch.typ_peso 
		end as "PESO",
	    case when g.ges_his_id is null then 'INUBICABLE'
		ELSE tch.typ_nivel_1
		END as "GRP_PRY", --nivel 1
		case when g.ges_his_tipification_2 is null then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'FAILED' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'NO ANSWER' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then 'NO CONTESTA'
        when tch.typ_nivel_2 = 'BUSY' then 'NO CONTESTA'
		else tch.typ_nivel_2
		end as "RESP_CUBO", --nivel 2
	    case when g.ges_his_id is null then 'NO CONTACTADO'  
		ELSE tch.typ_contacto 
		END as "GRP_CONTACTO", --contacto
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "TRADUCCION", --traduccion
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO' 
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "DESCRIPCION", --traduccion
	    (case when uu.use_rut is null then '0'
        when uu.use_rut = '-' then '0'
 		else uu.use_rut
 		end) as "AGE_RUT",
        (case when (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)  is null then 'USUARIO VIRTUAL'
        else (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)
        end) as "AGE_PRIMER_NOMBRE",
	    (case when (to_char(g.ges_his_date_form , 'hh24:mm:ss') <= '15:00:00') then 'AM' else 'PM' end) as "SUPERVISOR",
	    'S3' as "TLMK",
	    'Marisol Becerra' as "JEFE_UNIDAD",
	    hfh.for_his_genesys_id,
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1' ,1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',1,2)::text END) as "FON_AREA",
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',2,10)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',3,10)::text END) as "FON_DATO",
	    '' as "EMAIL",
	    case when hfh.for_his_genesys_id <> '' then '1' else '0' end as "Q_POLIZAS",
	    case when hfh.for_his_metadata->>'pro_valu_plan' is null then '0' else hfh.for_his_metadata->>'pro_valu_plan' end as "UF_POLIZAS",
	    (case when g.ges_his_id is null then 'M'
		else 'H'
		end )as "TIPO_GESTION"
from "Genesys".res_json_genesys_cdr cdr
left join "Genesys".his_gestion_history g on cdr.jso_cdr_genesys_id = g.ges_his_genesys_id AND g.ges_his_tipificacion_4 <> '' 
--and to_char(g.ges_his_date_form, 'yyyymmdd')::integer = to_char(now() ,'yyyymm11')::integer
JOIN  "Genesys".cam_contact cc on left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'dnis')::text,6),-1) = cc.con_metadata->>'telefono2'::text 
and cc.con_genesys_campaing_id in ( '86451d3c-a27e-400b-88fc-6438948b3279') 
--left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'callbackNumbers'->0)::text,5),-1) = cc.con_metadata->>'telefono1'::text 
left join "Genesys".use_user uu on use_genesys_id::text = g.ges_his_use_id::text
left join  "Genesys".typ_con_hom tch on tch.typ_nivel_3 = g.ges_his_tipificacion_4 and tch.typ_id_campana = '86451d3c-a27e-400b-88fc-6438948b3279'
left join "Genesys".his_form_history hfh on hfh.for_his_genesys_id::varchar = g.ges_his_genesys_id::varchar
--join credito_consumo.credito_consumo cc2 on cc.row_id= cc2.row_id
where to_char(jso_cdr_date,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer
and (cdr.jso_cdr_results ::json ->>'outboundCampaignId' in ( '86451d3c-a27e-400b-88fc-6438948b3279'))

and g.ges_his_tipificacion_4 is null

and jso_cdr_genesys_id not in (select ges_his_genesys_id from "Genesys".his_gestion_history G
							   where G.ges_his_metadata->>'id_campana' in ('86451d3c-a27e-400b-88fc-6438948b3279')  
							   and to_char(g.ges_his_Date_form,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer) 

union all

select  jso_cdr_genesys_id as genesys_id,
		concat(cc.con_metadata->>'rut'::text,'-' , cc.con_metadata->>'dv')  as "RUT",
	    cc.con_metadata->>'rut'  as "RUT_CUERPO",
	    cc.con_metadata->>'nombre_bdd' as "ID_CAMPANA",
	    cc.con_metadata->>'nombre_bdd' as "N_CAMPANA",
	    '0' as "OPERID",
	    case when to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss') is NULL then to_char(jso_cdr_date , 'yyyy-mm-dd hh24:mi:ss')
		else to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss')
		end as "GES_FECHA",
	    case when g.ges_his_id IS NULL then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'NO ANSWER' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'FAILED' then 'No Contesta'
 		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'BUSY' then 'No Contesta'
		ELSE tch.typ_nivel_3 --nivel 3
		END as "RESULT",
	    case when tch.typ_peso IS NULL then '38'
		when tch.typ_nivel_2 = 'FAILED' then '38'
		when tch.typ_nivel_2 = 'NO ANSWER' then '38'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then '38'
		WHEN tch.typ_nivel_2 = 'BUSY' then '38'
        else tch.typ_peso 
		end as "PESO",
	    case when g.ges_his_id is null then 'INUBICABLE'
		ELSE tch.typ_nivel_1
		END as "GRP_PRY", --nivel 1
	    case when g.ges_his_tipification_2 is null then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'FAILED' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'NO ANSWER' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then 'NO CONTESTA'
        when tch.typ_nivel_2 = 'BUSY' then 'NO CONTESTA'
		else tch.typ_nivel_2
		end as "RESP_CUBO", --nivel 2
	    case when g.ges_his_id is null then 'NO CONTACTADO'  
		ELSE tch.typ_contacto 
		END as "GRP_CONTACTO", --contacto
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "TRADUCCION", --traduccion
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO' 
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "DESCRIPCION", --traduccion
	    (case when uu.use_rut is null then '0'
        when uu.use_rut = '-' then '0'
 		else uu.use_rut
 		end) as "AGE_RUT",
        (case when (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)  is null then 'USUARIO VIRTUAL'
        else (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)
        end) as "AGE_PRIMER_NOMBRE",
	    (case when (to_char(g.ges_his_date_form , 'hh24:mm:ss') <= '15:00:00') then 'AM' else 'PM' end) as "SUPERVISOR",
	    'S3' as "TLMK",
	    'Marisol Becerra' as "JEFE_UNIDAD",
	    hfh.for_his_genesys_id,
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1' ,1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',1,2)::text END) as "FON_AREA",
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',2,10)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',3,10)::text END) as "FON_DATO",
	    '' as "EMAIL",
	    case when hfh.for_his_genesys_id <> '' then '1' else '0' end as "Q_POLIZAS",
	    case when hfh.for_his_metadata->>'pro_valu_plan' is null then '0' else hfh.for_his_metadata->>'pro_valu_plan' end as "UF_POLIZAS",
	    (case when g.ges_his_id is null then 'M'
		else 'H'
		end )as "TIPO_GESTION"
from "Genesys".res_json_genesys_cdr cdr
left join "Genesys".his_gestion_history g on cdr.jso_cdr_genesys_id = g.ges_his_genesys_id AND g.ges_his_tipificacion_4 <> '' 
--and to_char(g.ges_his_date_form, 'yyyymmdd')::integer = to_char(now() ,'yyyymm11')::integer
JOIN "Genesys".cam_contact cc on left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'dnis')::text,6),-1) = cc.con_metadata->>'telefono3'::text 
and cc.con_genesys_campaing_id in ( '86451d3c-a27e-400b-88fc-6438948b3279') 
--left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'callbackNumbers'->0)::text,5),-1) = cc.con_metadata->>'telefono1'::text 
left join "Genesys".use_user uu on use_genesys_id::text = g.ges_his_use_id::text
left join  "Genesys".typ_con_hom tch on tch.typ_nivel_3 = g.ges_his_tipificacion_4 and tch.typ_id_campana = '86451d3c-a27e-400b-88fc-6438948b3279'
left join "Genesys".his_form_history hfh on hfh.for_his_genesys_id::varchar = g.ges_his_genesys_id::varchar
--join credito_consumo.credito_consumo cc2 on cc.row_id= cc2.row_id
where to_char(jso_cdr_date,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer
and (cdr.jso_cdr_results ::json ->>'outboundCampaignId' in ( '86451d3c-a27e-400b-88fc-6438948b3279'))

and g.ges_his_tipificacion_4 is null

and jso_cdr_genesys_id not in (select ges_his_genesys_id from "Genesys".his_gestion_history G
							   where G.ges_his_metadata->>'id_campana' in ('86451d3c-a27e-400b-88fc-6438948b3279')  
							   and to_char(g.ges_his_Date_form,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer) 
 
union all

select  jso_cdr_genesys_id as genesys_id,
		concat(cc.con_metadata->>'rut'::text,'-' , cc.con_metadata->>'dv')  as "RUT",
	    cc.con_metadata->>'rut'  as "RUT_CUERPO",
	    cc.con_metadata->>'nombre_bdd' as "ID_CAMPANA",
	    cc.con_metadata->>'nombre_bdd' as "N_CAMPANA",
	    '0' as "OPERID",
	    case when to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss') is NULL then to_char(jso_cdr_date , 'yyyy-mm-dd hh24:mi:ss')
		else to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss')
		end as "GES_FECHA",
	    case when g.ges_his_id IS NULL then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'NO ANSWER' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'FAILED' then 'No Contesta'
 		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'BUSY' then 'No Contesta'
		ELSE tch.typ_nivel_3 --nivel 3
		END as "RESULT",
	    case when tch.typ_peso IS NULL then '38'
		when tch.typ_nivel_2 = 'FAILED' then '38'
		when tch.typ_nivel_2 = 'NO ANSWER' then '38'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then '38'
		WHEN tch.typ_nivel_2 = 'BUSY' then '38'
        else tch.typ_peso 
		end as "PESO",
	    case when g.ges_his_id is null then 'INUBICABLE'
		ELSE tch.typ_nivel_1
		END as "GRP_PRY", --nivel 1
	    case when g.ges_his_tipification_2 is null then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'FAILED' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'NO ANSWER' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then 'NO CONTESTA'
        when tch.typ_nivel_2 = 'BUSY' then 'NO CONTESTA'
		else tch.typ_nivel_2
		end as "RESP_CUBO", --nivel 2
	    case when g.ges_his_id is null then 'NO CONTACTADO'  
		ELSE tch.typ_contacto 
		END as "GRP_CONTACTO", --contacto
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "TRADUCCION", --traduccion
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO' 
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "DESCRIPCION", --traduccion
	    (case when uu.use_rut is null then '0'
        when uu.use_rut = '-' then '0'
 		else uu.use_rut
 		end) as "AGE_RUT",
        (case when (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)  is null then 'USUARIO VIRTUAL'
        else (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)
        end) as "AGE_PRIMER_NOMBRE",
	    (case when (to_char(g.ges_his_date_form , 'hh24:mm:ss') <= '15:00:00') then 'AM' else 'PM' end) as "SUPERVISOR",
	    'S3' as "TLMK",
	    'Marisol Becerra' as "JEFE_UNIDAD",
	    hfh.for_his_genesys_id,
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1' ,1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',1,2)::text END) as "FON_AREA",
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',2,10)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',3,10)::text END) as "FON_DATO",
	    '' as "EMAIL",
	    case when hfh.for_his_genesys_id <> '' then '1' else '0' end as "Q_POLIZAS",
	    case when hfh.for_his_metadata->>'pro_valu_plan' is null then '0' else hfh.for_his_metadata->>'pro_valu_plan' end as "UF_POLIZAS",
	    (case when g.ges_his_id is null then 'M'
		else 'H'
		end )as "TIPO_GESTION"
from "Genesys".res_json_genesys_cdr cdr
left join "Genesys".his_gestion_history g on cdr.jso_cdr_genesys_id = g.ges_his_genesys_id AND g.ges_his_tipificacion_4 <> '' 
--and to_char(g.ges_his_date_form, 'yyyymmdd')::integer = to_char(now() ,'yyyymm11')::integer
JOIN "Genesys".cam_contact cc on left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'dnis')::text,6),-1) = cc.con_metadata->>'telefono4'::text 
and cc.con_genesys_campaing_id in ( '86451d3c-a27e-400b-88fc-6438948b3279') 
--left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'callbackNumbers'->0)::text,5),-1) = cc.con_metadata->>'telefono1'::text 
left join "Genesys".use_user uu on use_genesys_id::text = g.ges_his_use_id::text
left join  "Genesys".typ_con_hom tch on tch.typ_nivel_3 = g.ges_his_tipificacion_4 and tch.typ_id_campana = '86451d3c-a27e-400b-88fc-6438948b3279'
left join "Genesys".his_form_history hfh on hfh.for_his_genesys_id::varchar = g.ges_his_genesys_id::varchar
--join credito_consumo.credito_consumo cc2 on cc.row_id= cc2.row_id
where to_char(jso_cdr_date,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer
and (cdr.jso_cdr_results ::json ->>'outboundCampaignId' in ( '86451d3c-a27e-400b-88fc-6438948b3279'))

and g.ges_his_tipificacion_4 is null

and jso_cdr_genesys_id not in (select ges_his_genesys_id from "Genesys".his_gestion_history G
							   where G.ges_his_metadata->>'id_campana' in ('86451d3c-a27e-400b-88fc-6438948b3279')  
							   and to_char(g.ges_his_Date_form,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer) 

union all

select  jso_cdr_genesys_id as genesys_id,
		concat(cc.con_metadata->>'rut'::text,'-' , cc.con_metadata->>'dv')  as "RUT",
	    cc.con_metadata->>'rut'  as "RUT_CUERPO",
	    cc.con_metadata->>'nombre_bdd' as "ID_CAMPANA",
	    cc.con_metadata->>'nombre_bdd' as "N_CAMPANA",
	    '0' as "OPERID",
	    case when to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss') is NULL then to_char(jso_cdr_date , 'yyyy-mm-dd hh24:mi:ss')
		else to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss')
		end as "GES_FECHA",
	    case when g.ges_his_id IS NULL then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'NO ANSWER' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'FAILED' then 'No Contesta'
 		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'BUSY' then 'No Contesta'
		ELSE tch.typ_nivel_3 --nivel 3
		END as "RESULT",
	    case when tch.typ_peso IS NULL then '38'
		when tch.typ_nivel_2 = 'FAILED' then '38'
		when tch.typ_nivel_2 = 'NO ANSWER' then '38'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then '38'
		WHEN tch.typ_nivel_2 = 'BUSY' then '38'
        else tch.typ_peso 
		end as "PESO",
	    case when g.ges_his_id is null then 'INUBICABLE'
		ELSE tch.typ_nivel_1
		END as "GRP_PRY", --nivel 1
	    case when g.ges_his_tipification_2 is null then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'FAILED' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'NO ANSWER' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then 'NO CONTESTA'
        when tch.typ_nivel_2 = 'BUSY' then 'NO CONTESTA'
		else tch.typ_nivel_2
		end as "RESP_CUBO", --nivel 2
	    case when g.ges_his_id is null then 'NO CONTACTADO'  
		ELSE tch.typ_contacto 
		END as "GRP_CONTACTO", --contacto
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "TRADUCCION", --traduccion
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO' 
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "DESCRIPCION", --traduccion
	    (case when uu.use_rut is null then '0'
        when uu.use_rut = '-' then '0'
 		else uu.use_rut
 		end) as "AGE_RUT",
        (case when (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)  is null then 'USUARIO VIRTUAL'
        else (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)
        end) as "AGE_PRIMER_NOMBRE",
	    (case when (to_char(g.ges_his_date_form , 'hh24:mm:ss') <= '15:00:00') then 'AM' else 'PM' end) as "SUPERVISOR",
	    'S3' as "TLMK",
	    'Marisol Becerra' as "JEFE_UNIDAD",
	    hfh.for_his_genesys_id,
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1' ,1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',1,2)::text END) as "FON_AREA",
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',2,10)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',3,10)::text END) as "FON_DATO",
	    '' as "EMAIL",
	    case when hfh.for_his_genesys_id <> '' then '1' else '0' end as "Q_POLIZAS",
	    case when hfh.for_his_metadata->>'pro_valu_plan' is null then '0' else hfh.for_his_metadata->>'pro_valu_plan' end as "UF_POLIZAS",
	    (case when g.ges_his_id is null then 'M'
		else 'H'
		end )as "TIPO_GESTION"
from "Genesys".res_json_genesys_cdr cdr
left join "Genesys".his_gestion_history g on cdr.jso_cdr_genesys_id = g.ges_his_genesys_id AND g.ges_his_tipificacion_4 <> '' 
--and to_char(g.ges_his_date_form, 'yyyymmdd')::integer = to_char(now() ,'yyyymm11')::integer
JOIN "Genesys".cam_contact cc on left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'dnis')::text,6),-1) = cc.con_metadata->>'telefono5'::text 
and cc.con_genesys_campaing_id in ( '86451d3c-a27e-400b-88fc-6438948b3279') 
--left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'callbackNumbers'->0)::text,5),-1) = cc.con_metadata->>'telefono1'::text 
left join "Genesys".use_user uu on use_genesys_id::text = g.ges_his_use_id::text
left join  "Genesys".typ_con_hom tch on tch.typ_nivel_3 = g.ges_his_tipificacion_4 and tch.typ_id_campana = '86451d3c-a27e-400b-88fc-6438948b3279'
left join "Genesys".his_form_history hfh on hfh.for_his_genesys_id::varchar = g.ges_his_genesys_id::varchar
--join credito_consumo.credito_consumo cc2 on cc.row_id= cc2.row_id
where to_char(jso_cdr_date,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer
and (cdr.jso_cdr_results ::json ->>'outboundCampaignId' in ( '86451d3c-a27e-400b-88fc-6438948b3279'))

and g.ges_his_tipificacion_4 is null

and jso_cdr_genesys_id not in ((select ges_his_genesys_id from "Genesys".his_gestion_history G
							   where G.ges_his_metadata->>'id_campana' in ('86451d3c-a27e-400b-88fc-6438948b3279')  
							   and to_char(g.ges_his_Date_form,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer) )

union all

select  jso_cdr_genesys_id as genesys_id,
		concat(cc.con_metadata->>'rut'::text,'-' , cc.con_metadata->>'dv')  as "RUT",
	    cc.con_metadata->>'rut'  as "RUT_CUERPO",
	    cc.con_metadata->>'nombre_bdd' as "ID_CAMPANA",
	    cc.con_metadata->>'nombre_bdd' as "N_CAMPANA",
	    '0' as "OPERID",
	    case when to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss') is NULL then to_char(jso_cdr_date , 'yyyy-mm-dd hh24:mi:ss')
		else to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss')
		end as "GES_FECHA",
	    case when g.ges_his_id IS NULL then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'NO ANSWER' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'FAILED' then 'No Contesta'
 		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'BUSY' then 'No Contesta'
		ELSE tch.typ_nivel_3 --nivel 3
		END as "RESULT",
	    case when tch.typ_peso IS NULL then '38'
		when tch.typ_nivel_2 = 'FAILED' then '38'
		when tch.typ_nivel_2 = 'NO ANSWER' then '38'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then '38'
		WHEN tch.typ_nivel_2 = 'BUSY' then '38'
        else tch.typ_peso 
		end as "PESO",
	    case when g.ges_his_id is null then 'INUBICABLE'
		ELSE tch.typ_nivel_1
		END as "GRP_PRY", --nivel 1
	    case when g.ges_his_tipification_2 is null then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'FAILED' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'NO ANSWER' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then 'NO CONTESTA'
        when tch.typ_nivel_2 = 'BUSY' then 'NO CONTESTA'
		else tch.typ_nivel_2
		end as "RESP_CUBO", --nivel 2
	    case when g.ges_his_id is null then 'NO CONTACTADO'  
		ELSE tch.typ_contacto 
		END as "GRP_CONTACTO", --contacto
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "TRADUCCION", --traduccion
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO' 
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "DESCRIPCION", --traduccion
	    (case when uu.use_rut is null then '0'
        when uu.use_rut = '-' then '0'
 		else uu.use_rut
 		end) as "AGE_RUT",
        (case when (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)  is null then 'USUARIO VIRTUAL'
        else (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)
        end) as "AGE_PRIMER_NOMBRE",
	    (case when (to_char(g.ges_his_date_form , 'hh24:mm:ss') <= '15:00:00') then 'AM' else 'PM' end) as "SUPERVISOR",
	    'S3' as "TLMK",
	    'Marisol Becerra' as "JEFE_UNIDAD",
	    hfh.for_his_genesys_id,
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1' ,1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',1,2)::text END) as "FON_AREA",
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',2,10)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',3,10)::text END) as "FON_DATO",
	    '' as "EMAIL",
	    case when hfh.for_his_genesys_id <> '' then '1' else '0' end as "Q_POLIZAS",
	    case when hfh.for_his_metadata->>'pro_valu_plan' is null then '0' else hfh.for_his_metadata->>'pro_valu_plan' end as "UF_POLIZAS",
	    (case when g.ges_his_id is null then 'M'
		else 'H'
		end )as "TIPO_GESTION"
from "Genesys".res_json_genesys_cdr cdr
left join "Genesys".his_gestion_history g on cdr.jso_cdr_genesys_id = g.ges_his_genesys_id AND g.ges_his_tipificacion_4 <> '' 
--and to_char(g.ges_his_date_form, 'yyyymmdd')::integer = to_char(now() ,'yyyymm11')::integer
JOIN "Genesys".cam_contact cc on left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'dnis')::text,6),-1) = cc.con_metadata->>'telefono6'::text 
and cc.con_genesys_campaing_id in ( '86451d3c-a27e-400b-88fc-6438948b3279') 
--left(substr((jso_cdr_metadata->'participants'->0->'sessions'->0->'callbackNumbers'->0)::text,5),-1) = cc.con_metadata->>'telefono1'::text 
left join "Genesys".use_user uu on use_genesys_id::text = g.ges_his_use_id::text
left join  "Genesys".typ_con_hom tch on tch.typ_nivel_3 = g.ges_his_tipificacion_4 and tch.typ_id_campana = '86451d3c-a27e-400b-88fc-6438948b3279'
left join "Genesys".his_form_history hfh on hfh.for_his_genesys_id::varchar = g.ges_his_genesys_id::varchar
--join credito_consumo.credito_consumo cc2 on cc.row_id= cc2.row_id
where to_char(jso_cdr_date,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer
and (cdr.jso_cdr_results ::json ->>'outboundCampaignId' in ( '86451d3c-a27e-400b-88fc-6438948b3279'))
and g.ges_his_tipificacion_4 is null
and jso_cdr_genesys_id not in (select ges_his_genesys_id from "Genesys".his_gestion_history G
							   where G.ges_his_metadata->>'id_campana' in ('86451d3c-a27e-400b-88fc-6438948b3279')  
							   and to_char(g.ges_his_Date_form,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::integer) 
union all
select  g.ges_his_genesys_id as genesys_id,
		concat(cc.con_metadata->>'rut'::text,'-' , cc.con_metadata->>'dv')  as "RUT",
	    cc.con_metadata->>'rut'  as "RUT_CUERPO",
	    cc.con_metadata->>'nombre_bdd' as "ID_CAMPANA",
	    cc.con_metadata->>'nombre_bdd' as "N_CAMPANA",
	    '0' as "OPERID",
	    to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss') as "GES_FECHA",
	    case when g.ges_his_id IS NULL then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'NO ANSWER' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'FAILED' then 'No Contesta'
 		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'BUSY' then 'No Contesta'
		ELSE tch.typ_nivel_3 --nivel 3
		END as "RESULT",
	    case when tch.typ_peso IS NULL then '38'
		when tch.typ_nivel_2 = 'FAILED' then '38'
		when tch.typ_nivel_2 = 'NO ANSWER' then '38'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then '38'
		WHEN tch.typ_nivel_2 = 'BUSY' then '38'
        else tch.typ_peso 
		end as "PESO",
	    case when g.ges_his_id is null then 'INUBICABLE'
		ELSE tch.typ_nivel_1
		END as "GRP_PRY", --nivel 1
	    case when g.ges_his_tipification_2 is null then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'FAILED' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'NO ANSWER' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then 'NO CONTESTA'
        when tch.typ_nivel_2 = 'BUSY' then 'NO CONTESTA'
		else tch.typ_nivel_2
		end as "RESP_CUBO", --nivel 2
	    case when g.ges_his_id is null then 'NO CONTACTADO'  
		ELSE tch.typ_contacto 
		END as "GRP_CONTACTO", --contacto
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "TRADUCCION", --traduccion
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO' 
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "DESCRIPCION", --traduccion
	    (case when uu.use_rut is null then '0'
        when uu.use_rut = '-' then '0'
 		else uu.use_rut
 		end) as "AGE_RUT",
        (case when (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)  is null then 'USUARIO VIRTUAL'
        else (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)
        end) as "AGE_PRIMER_NOMBRE",
	    (case when (to_char(g.ges_his_date_form , 'hh24:mm:ss') <= '15:00:00') then 'AM' else 'PM' end) as "SUPERVISOR",
	    'S3' as "TLMK",
	    'Marisol Becerra' as "JEFE_UNIDAD",
	    hfh.for_his_genesys_id,
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1' ,1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',1,2)::text END) as "FON_AREA",
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',2,10)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',3,10)::text END) as "FON_DATO",
	    '' as "EMAIL",
	    '0' as "Q_POLIZAS",
	    '0' as "UF_POLIZAS",
	    (case when g.ges_his_id is null then 'M'
		else 'H'
		end )as "TIPO_GESTION"
from "Genesys".his_gestion_history g 
JOIN "Genesys".cam_contact cc on cc.con_id::text = g.ges_his_con_id::text 
and cc.con_genesys_campaing_id in ( '86451d3c-a27e-400b-88fc-6438948b3279')  
and to_char(cc.con_date_upload,'yyyymmdd')::integer between to_char(now(),'yyyymm01')::integer and to_char(now(),'yyyymmdd')::integer
left join "Genesys".use_user uu on use_genesys_id::text = g.ges_his_use_id::text
left join  "Genesys".typ_con_hom tch on tch.typ_nivel_3 = g.ges_his_tipificacion_4 and tch.typ_id_campana = '86451d3c-a27e-400b-88fc-6438948b3279'
left join "Genesys".his_form_history hfh on hfh.for_his_con_id::varchar = cc.con_id::varchar
where to_char(g.ges_his_date_form,'yyyymmdd')::integer = to_Char(now(),'yyyymmdd')::integer
and g.ges_his_metadata ::json ->>'id_campana' in ( '86451d3c-a27e-400b-88fc-6438948b3279') 
and g.ges_his_tipificacion_4 <> ''
and tch.typ_nivel_3 not in ('Acepta Seguro')
and g.ges_his_genesys_id not in ('b4908b93-1322-4899-993a-d6bb232ce9e7')
union all
select  g.ges_his_genesys_id as genesys_id,
		concat(cc.con_metadata->>'rut'::text,'-' , cc.con_metadata->>'dv')  as "RUT",
	    cc.con_metadata->>'rut'  as "RUT_CUERPO",
	    cc.con_metadata->>'nombre_bdd' as "ID_CAMPANA",
	    cc.con_metadata->>'nombre_bdd' as "N_CAMPANA",
	    '0' as "OPERID",
	    to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mi:ss') as "GES_FECHA",
	    case when g.ges_his_id IS NULL then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'NO ANSWER' then 'No Contesta'
		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'FAILED' then 'No Contesta'
 		when g.ges_his_id IS not null and g.ges_his_tipificacion_4 = 'BUSY' then 'No Contesta'
		ELSE tch.typ_nivel_3 --nivel 3
		END as "RESULT",
	    case when tch.typ_peso IS NULL then '38'
		when tch.typ_nivel_2 = 'FAILED' then '38'
		when tch.typ_nivel_2 = 'NO ANSWER' then '38'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then '38'
		WHEN tch.typ_nivel_2 = 'BUSY' then '38'
        else tch.typ_peso 
		end as "PESO",
	    case when g.ges_his_id is null then 'INUBICABLE'
		ELSE tch.typ_nivel_1
		END as "GRP_PRY", --nivel 1
	    case when g.ges_his_tipification_2 is null then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'FAILED' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'NO ANSWER' then 'NO CONTESTA'
		when tch.typ_nivel_2 = 'ANSWER MACHINNE' then 'NO CONTESTA'
        when tch.typ_nivel_2 = 'BUSY' then 'NO CONTESTA'
		else tch.typ_nivel_2
		end as "RESP_CUBO", --nivel 2
	    case when g.ges_his_id is null then 'NO CONTACTADO'  
		ELSE tch.typ_contacto 
		END as "GRP_CONTACTO", --contacto
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "TRADUCCION", --traduccion
	    case when g.ges_his_tipificacion_4 is null then 'SIN CONTACTO TELEFONICO' 
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'ANSWER MACHINNE' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'NO ANSWER' then 'SIN CONTACTO TELEFONICO'
		when g.ges_his_tipificacion_4 = 'FAILED' then 'SIN CONTACTO TELEFONICO'
 		when g.ges_his_tipificacion_4 = 'BUSY' then 'SIN CONTACTO TELEFONICO'
		ELSE tch.descripcion
		END as "DESCRIPCION", --traduccion
	    (case when uu.use_rut is null then '0'
        when uu.use_rut = '-' then '0'
 		else uu.use_rut
 		end) as "AGE_RUT",
        (case when (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)  is null then 'USUARIO VIRTUAL'
        else (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text)
        end) as "AGE_PRIMER_NOMBRE",
	    (case when (to_char(g.ges_his_date_form , 'hh24:mm:ss') <= '15:00:00') then 'AM' else 'PM' end) as "SUPERVISOR",
	    'S3' as "TLMK",
	    'Marisol Becerra' as "JEFE_UNIDAD",
	    hfh.for_his_genesys_id,
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1' ,1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',1,2)::text END) as "FON_AREA",
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',2,10)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',3,10)::text END) as "FON_DATO",
	    '' as "EMAIL",
	    case when hfh.for_his_genesys_id <> '' then '1' else '0' end as "Q_POLIZAS",
	    case when hfh.for_his_metadata->>'pro_valu_plan' is null then '0' else hfh.for_his_metadata->>'pro_valu_plan' end as "UF_POLIZAS",
	    (case when g.ges_his_id is null then 'M'
		else 'H'
		end )as "TIPO_GESTION"
from "Genesys".his_gestion_history g 
JOIN "Genesys".cam_contact cc on cc.con_id::text = g.ges_his_con_id::text 
and cc.con_genesys_campaing_id in ( '86451d3c-a27e-400b-88fc-6438948b3279')  
and to_char(cc.con_date_upload,'yyyymmdd')::integer between to_char(now(),'yyyymm01')::integer and to_char(now(),'yyyymmdd')::integer
left join "Genesys".use_user uu on use_genesys_id::text = g.ges_his_use_id::text
left join  "Genesys".typ_con_hom tch on tch.typ_nivel_3 = g.ges_his_tipificacion_4 and tch.typ_id_campana = '86451d3c-a27e-400b-88fc-6438948b3279'
left join "Genesys".his_form_history hfh on hfh.for_his_con_id::varchar = cc.con_id::varchar
where to_char(g.ges_his_date_form,'yyyymmdd')::integer = to_Char(now(),'yyyymmdd')::integer
and g.ges_his_metadata ::json ->>'id_campana' in ( '86451d3c-a27e-400b-88fc-6438948b3279') 
and g.ges_his_tipificacion_4 <> ''
and tch.typ_nivel_3 in ('Acepta Seguro')
and hfh.for_his_genesys_id is not null
and g.ges_his_genesys_id not in ('b4908b93-1322-4899-993a-d6bb232ce9e7')
) total 
order by genesys_id, "PESO")
