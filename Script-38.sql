SELECT pro_typ_id, pro_typ_name, pro_typ_user, type_campana, desc_campana
FROM almamedis.cam_product_type
where id_campana = 'almamedis'
and type_campana = 'CALLBACK'
and type_agent in ('2','')
--or type_agent =''