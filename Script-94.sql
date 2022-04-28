select for_his_id, for_his_metadata, for_his_date_form
from "Genesys".his_form_history hfh
where for_his_genesys_id = '2' 
order by for_his_date_form desc
limit 1