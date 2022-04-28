SELECT update_date, esquema, name_table, mdata
FROM dw_nuevo.genesys_esquemas
where mdata::json->>'cal_eval_campaign' = '506d64a7-9e0f-4d01-bff0-eb3505d67275'
