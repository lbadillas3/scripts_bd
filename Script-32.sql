select for_his_metadata::jsonb - 'id_campana' || ('{"id_campana":"' || '8b05c6a5-26ab-49e4-ab30-38723f779338' || '"}')::jsonb
from "Genesys".his_form_history  
where for_his_date_form::date >= '2021-10-01'::date
and  for_his_metadata :: json ->>('id_campana') in ( 'd84e262b-90df-43b0-8fa0-6781879a8070')



update "Genesys".his_gestion_history 
set	ges_his_metadata = ges_his_metadata::jsonb - 'id_campana' || ('{"id_campana":"' || '8b05c6a5-26ab-49e4-ab30-38723f779338' || '"}')::jsonb
where ges_his_date_form::date >= '2021-10-01'::date
and  ges_his_metadata :: json ->>('id_campana') in ( '1b6d39e4-50af-43be-bde9-b85b437e3139')
--and  jso_ges_id ='113935'
