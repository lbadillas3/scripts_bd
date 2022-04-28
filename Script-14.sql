SELECT *
FROM "Genesys".his_gestion_history
where ges_his_metadata::json->>'cola' is not null

and ges_his_con_id <> '2'

select * from "Genesys".his_form_history
where for_his_metadata::json->>'cola' is not null
and for_his_con_id <> '2'

select * from "Genesys".his_beneficiary_history
where ben_his_metadata::json->>'cola' is not null
and ben_his_con_id <> '2'

select * from "Genesys".his_aditional_history
where adi_his_metadata::json->>'cola' is not null
and adi_his_con_id <> '2'