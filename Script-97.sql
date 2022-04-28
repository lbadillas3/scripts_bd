select 
for_his_con_id,for_his_genesys_id,
to_char(for_his_date_form, 'DD-MM-YYYY') as fecha,
for_his_metadata::json->>'Rut' as rut,
for_his_metadata::json->>'Poliza' as poliza,
for_his_metadata::json->>'Observacion' as observacion,
for_his_metadata::json->>'TipoProducto' as tipoproducto,
for_his_metadata::json->>'TipoRequerimiento' as tiporequerimeinto
from "Genesys".his_form_history hfh
where for_his_metadata::json->>'id_campana' like '56c4b7fc-2925-4c4e-8203-1ab2489d215d'
and to_char(for_his_date_form, 'DD-MM-YYYY') between to_char(now(), 'DD-MM-YYYY') and to_char((current_date-interval '4 days'), 'dd-mm-yyyy')