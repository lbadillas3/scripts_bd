select hgh.for_his_genesys_id ,count(hgh.for_his_genesys_id)
from "Genesys".his_form_history hgh  
--left join "Genesys".res_json_callback rjc on rjc.jso_cb_genesys_id = hgh.ges_his_genesys_id 
--where rjc.jso_cb_genesys_id is null
--where hgh.for_his_genesys_id not in ('3','1','8','12','10','23','13')
group by hgh.for_his_genesys_id
having count(hgh.for_his_genesys_id)>1;