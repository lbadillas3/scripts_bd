SELECT pro_id_cam, pro_name_cam, pro_cod_plan, pro_valu_plan, pro_cod_plan_sponsor, pro_campana
FROM "Genesys".pro_desc_cam
where pro_id_cam= $1
and pro_sponsor = $2
and pro_desc_plan = $3
order by pro_id_cam, pro_name_cam, pro_cod_plan, pro_valu_plan, pro_cod_plan_sponsor, pro_campana

SELECT pro_desc_plan, pro_sponsor
FROM "Genesys".pro_desc_cam
where pro_id_cam= '13'
group by pro_desc_plan,pro_sponsor
order by pro_sponsor 

--and pro_sponsor = 'IRAM'
--and pro_desc_plan = '18-50'