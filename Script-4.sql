SELECT for_his_id, for_his_con_id, for_his_metadata, for_his_genesys_id, for_his_date_form, for_his_use_id, for_his_lis_id,
for_his_metadata::json->>'Fechanacimiento' as "FECHA NACIMIENTO"
FROM "Genesys".his_form_history
where for_his_metadata::json->>'pro_sponsor' = 'Saesa'


SELECT for_his_id, for_his_con_id, for_his_metadata, for_his_genesys_id, for_his_date_form, for_his_use_id, for_his_lis_id,
for_his_metadata::json->>'Fechanacimiento' as "FECHA NACIMIENTO"
FROM "Genesys".his_form_history
where to_char((hfh.for_his_metadata::json->>'Fechanacimiento')::date,'DDMMYYYY')


SELECT for_his_id, for_his_con_id, for_his_metadata, for_his_genesys_id, for_his_date_form, for_his_use_id, for_his_lis_id
FROM "Genesys".his_form_history 
where --for_his_metadata::json->>'Rut' = '7630866-7'
for_his_metadata::json->>'Mail' = 'miriamupv@gmail.com'


SELECT for_his_id, for_his_con_id, for_his_metadata, for_his_genesys_id, for_his_date_form, for_his_use_id, for_his_lis_id
FROM "Genesys".his_form_history 
where for_his_metadata::json->>'id_gestion' in ('185226f4-2f54-40ac-97a3-1f8df96dd7e8',
'b1cd7c9d-2d2b-43e5-ba19-1dc95c9e4148',
'4cb6abdf-9065-47c0-84e6-db3eb602a28e',
'9b838739-a5e1-4c10-86eb-d00ff2e79573',
'c5df9cf4-a8ed-4dfd-b214-133777a307fb')
