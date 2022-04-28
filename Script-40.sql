---------------reporte 1
SELECT for_his_metadata::json->>'Rut' as "rut_cliente",
hih.inv_his_metadata::json->>'Folio' as "folio",
to_char(hih.inv_his_date_form,'DD/MM/YYYY')  as "fecha",
hih.inv_his_metadata::json->>'Opcion' as "opcion",
hih.inv_his_metadata::json->>'Ramo' as "ramo",
hih.inv_his_metadata::json->>'MotivoEliminacion' as "motivo de elimanacion"
FROM "Genesys".his_form_history hfh
left join "Genesys".his_invoice_history hih ON hfh.for_his_genesys_id = hih.inv_his_genesys_id 
where for_his_metadata::json->>'id_campana' = 'd42b70f8-88b5-4bf4-aa37-7203a5c3d919'
and to_char(hih.inv_his_date_form,'DD/MM/YYYY') is not null;


---------------reporte 2
SELECT to_char(hih.inv_his_date_form,'DD/MM/YYYY')  as "fecha",
to_char(hih.inv_his_date_form,'HH24:MI')  as "hora",
hgh.ges_his_tipificacion_4 as "gestion", 
concat(for_his_metadata::json->>'PrimerNombre',' ',for_his_metadata::json->>'SegundoNombre') as "nombre_cliente",
concat(for_his_metadata::json->>'ApPaterno',' ',for_his_metadata::json->>'ApMaterno')  as "apellido_cliente",
for_his_metadata::json->>'Rut' as "rut_cliente",
hih.inv_his_metadata::json->>'Folio' as "folio",
hih.inv_his_metadata::json->>'Ramo' as "ramo",
hih.inv_his_metadata::json->>'MotivoEliminacion' as "motivo de elimanacion",
hih.inv_his_metadata::json->>'Opcion' as "opcion",
uu.use_name as "ejecutivo"
FROM "Genesys".his_form_history hfh
left join "Genesys".his_invoice_history hih ON hfh.for_his_genesys_id = hih.inv_his_genesys_id
left join "Genesys".his_gestion_history hgh ON hfh.for_his_genesys_id = hgh.ges_his_genesys_id 
left join "Genesys".use_user uu ON hfh.for_his_use_id = uu.use_genesys_id 
where for_his_metadata::json->>'id_campana' = 'd42b70f8-88b5-4bf4-aa37-7203a5c3d919'
and to_char(hih.inv_his_date_form,'DD/MM/YYYY') is not null;


