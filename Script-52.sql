SELECT  
        distinct on (tch.typ_peso,g.ges_his_genesys_id)
        --------------------------------------------------------------------------------------
        concat(cc.con_metadata->>'rut'::text,'-' , cc.con_metadata->>'dv')  as "RUT",
	    cc.con_metadata->>'rut'  as "RUT_CUERPO",
	    cc.con_metadata->>'nombre_bdd' as "ID_CAMPANA",
	    cc.con_metadata->>'nombre_bdd' as "N_CAMPANA",
	    '0' as "OPERID",
	    to_char(g.ges_his_date_form , 'yyyy-mm-dd hh24:mm:ss') as "GES_FECHA",
	    g.ges_his_tipificacion_4 as "RESULT",
	    tch.typ_peso as "PESO",
	    g.ges_his_metadata->>'contacto' as "GRP_PRY",
	    g.ges_his_tipification_2 as "RESP_CUBO",
	    g.ges_his_tipification_1 as "GRP_CONTACTO",
	    g.ges_his_tipificacion_4 as "TRADUCCION",
	    g.ges_his_tipificacion_4 as "DESCRIPCION",
	    uu.use_rut as "AGE_RUT",
	    (SELECT (uu.use_name ||' '|| uu.use_appaterno ||' '||uu.use_apmaterno)  FROM "Genesys".use_user uu WHERE uu.use_genesys_id::text = g.ges_his_use_id::text) as "AGE_PRIMER_NOMBRE",
	    (case when (to_char(g.ges_his_date_form , 'hh24:mm:ss') <= '15:00:00') then 'AM' else 'PM' end) as "SUPERVISOR",
	    'S3' as "TLMK",
	    'Marisol Becerra' as "JEFE_UNIDAD",
	    hfh.for_his_genesys_id,
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1' ,1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',1,2)::text END) as "FON_AREA",
	    (CASE WHEN SUBSTRING(cc.con_metadata->>'telefono1',1,1)::text in ('9','2') THEN SUBSTRING(cc.con_metadata->>'telefono1',2,10)::text ELSE SUBSTRING(cc.con_metadata->>'telefono1',3,10)::text END) as "FON_DATO",
	    '' as "EMAIL",
	    case when hfh.for_his_genesys_id <> '' then '1' else '0' end as "Q_POLIZAS",
	    case when hfh.for_his_metadata->>'pro_valu_plan' is null then '0' else hfh.for_his_metadata->>'pro_valu_plan' end as "UF_POLIZAS",
	    'H' as "TIPO_GESTION"
		---------------------------------------------------------------------------------------------------------------
                    FROM (select * from "Genesys".his_gestion_history where ges_his_date_form::date > '2021-11-10'::date
                    and ges_his_metadata->>'id_campana' in (  '9777d366-83b0-448d-a378-065620d6fb08','6f707cfe-cc0c-44db-81a9-f4f5626ff0c6') ) g
					left JOIN  "Genesys".cam_contact cc on con_id::text = g.ges_his_con_id::text
					left join "Genesys".use_user uu on use_genesys_id::text = g.ges_his_use_id::text
					left join  (SELECT * FROM "Genesys".typ_con_hom where typ_id_campana = '9777d366-83b0-448d-a378-065620d6fb08') tch on tch.typ_nivel_3 = g.ges_his_tipificacion_4
					left join "Genesys".his_form_history hfh on hfh.for_his_genesys_id::varchar = g.ges_his_genesys_id::varchar
					--join credito_consumo.credito_consumo cc2 on cc.row_id= cc2.row_id
                    WHERE
					to_char(g.ges_his_date_form,'yyyymmdd')::integer = to_char(now(),'yyyymmdd')::int -1
							AND g.ges_his_tipificacion_4 <> ''
							--and cc.con_genesys_campaing_id in ('9777d366-83b0-448d-a378-065620d6fb08')
							ORDER BY tch.typ_peso,g.ges_his_genesys_id desc;