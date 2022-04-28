SELECT for_his_id, for_his_con_id, for_his_metadata, for_his_genesys_id, for_his_date_form, for_his_use_id, for_his_lis_id
FROM "Genesys".his_form_history
where for_his_metadata::json->>'id_campana' = '9777d366-83b0-448d-a378-065620d6fb08'
--and for_his_metadata::varchar like '%sin ramo%'
and to_char(for_his_date_form, 'YYYYMMDD') between '20220401' and '20220408'  