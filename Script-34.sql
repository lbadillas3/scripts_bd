select jso_ges_metadata :: json ->>('nivel3'), *
  from "Genesys".res_json_gestion rjg
  left join "Genesys".cam_contact cc on cc.con_id::text = rjg.jso_ges_metadata :: json ->>('id_contacto')
 where jso_ges_date::date >= '2021-10-01'::date
and  jso_ges_metadata :: json ->>('id_campana') in ( '8b05c6a5-26ab-49e4-ab30-38723f779338')
--and jso_ges_id ='113935'