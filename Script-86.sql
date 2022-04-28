CREATE TABLE "Genesys".uf_list (
	id_campana varchar NOT NULL,
	desc_campana varchar NOT NULL,
	fecha varchar NOT NULL,
	valor_ud varchar NOT NULL
);

ALTER TABLE bci_full.deducible
ADD COLUMN value_deducible varchar NULL;


select distinct cc.con_genesys_campaing_id campana,
    ---------------------------------------------------------------------------------------    
    ce2.est_descripcion as estado_venta,
    ---------------------------------------------------------------------------------------
    (split_part(hfh.for_his_metadata::json->>'Rut','-',1)||'8149') as folio,
    ---------------------------------------------------------------------------------------
    hfh.for_his_metadata::json->>'Rut' as rut,
    ---------------------------------------------------------------------------------------
    to_char(hfh.for_his_date_form,'yyyymmdd') as fecha,
    ---------------------------------------------------------------------------------------
    0 as duracion,
    ---------------------------------------------------------------------------------------
    ('cardif_hospitalario_familiar_'||replace(ce2.est_descripcion,' ','-')||'_'||(split_part(hfh.for_his_metadata::json->>'Rut','-',1)||'8149')||'_'||(hfh.for_his_metadata->>'Rut')::text||'_'||to_char(hfh.for_his_date_form,'yyyymmdd')||'_Dura_ '||'_'||hgh.ges_his_genesys_id||'.MP3') as audio,
    ---------------------------------------------------------------------------------------
    SUBSTRING (lr.log_rec_location,47,10000) ruta_s3
    ---------------------------------------------------------------------------------------
    from "Genesys".cam_contact cc
    join "Genesys".his_form_history hfh on cc.con_id::text = hfh.for_his_con_id::text
    left join "Genesys".his_gestion_history hgh on  hgh.ges_his_con_id = hfh.for_his_con_id
    left join calidad_app.cal_assignments ca on ca.cal_assig_interaction = hfh.for_his_genesys_id and hfh.for_his_con_id::varchar = ca.cal_assig_contact
    left join calidad_app.cal_evaluations ce on ce.cal_eval_interaction = hfh.for_his_genesys_id and ce.cal_eval_state is null
    left join calidad_app.cal_estado ce2 on ce2.est_id::varchar = ce.cal_eval_typing
    --join "Genesys".log_recording lr on lr.log_rec_conversation_id like '%'||(hfh.for_his_metadata->>'id_gestion')||'%'
    join "Genesys".log_recording lr on lr.log_rec_conversation_id = hgh.ges_his_genesys_id
    ---------------------------------------------------------------------------------------
    where cc.con_genesys_campaing_id in ('506d64a7-9e0f-4d01-bff0-eb3505d67275', 'cc4fc4a7-60a6-4860-a6bf-cc4baef8f056', '5d48a42e-58d9-4e1b-b889-0d9b20972bea' , '81244458-cf57-4d49-8f6f-e08bf354d97d')
            and cc.con_genesys_campaing_id is not null and ce.cal_eval_state is NULL    
        ---------------------------------------------------------------------------------------
            --and to_char(hfh.for_his_date_form, 'yyyymm')::int = 202108
            and to_char(hfh.for_his_date_form, 'yyyymm') = '202111'
            --and to_char(hfh.for_his_date_form, 'yyyymm') between '202110' and '202111'
            --and to_char(hfh.for_his_date_form, 'yyyymm')::int = to_char('now'::timestamp - '1 month'::interval, 'yyyymm')::int
        ---------------------------------------------------------------------------------------
            and length(for_his_genesys_id) > 30                            
            and ce2.est_id not in (2,8,12,13,5)
            --and ce2.est_id in (1,4,9,10,11,14,15)
    order by fecha desc;