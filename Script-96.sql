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
    ('bci_auto_full_'||replace(ce2.est_descripcion,' ','-')||'_'||(split_part(hfh.for_his_metadata::json->>'Rut','-',1)||'8149')||'_'||(hfh.for_his_metadata->>'Rut')::text||'_'||to_char(hfh.for_his_date_form,'yyyymmdd')||'_Dura_ '||'_'||hgh.ges_his_genesys_id||'.MP3') as audio,
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
    where cc.con_genesys_campaing_id in ('5de86b43-06e7-4c1f-95b8-fae3de5df41a')
            and cc.con_genesys_campaing_id is not null and ce.cal_eval_state is NULL    
        ---------------------------------------------------------------------------------------
            --and to_char(hfh.for_his_date_form, 'yyyymm')::int = 202108
            and to_char(hfh.for_his_date_form, 'yyyymm')::int = to_char('now'::timestamp - '1 month'::interval, 'yyyymm')::int
        ---------------------------------------------------------------------------------------
            and length(for_his_genesys_id) > 30                            
            and ce2.est_id not in (2,8,12,13,5)
            --and ce2.est_id in (1,4,9,10,11,14,15)
    order by fecha desc;