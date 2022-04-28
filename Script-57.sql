SELECT pro_typ_id, pro_typ_name, pro_typ_user, type_campana, desc_campana, desc_type_campana
FROM almamedis.cam_product_type
where id_campana = 'almamedis'
and  type_campana = 'AMBOS'
and type_agent in ('1','')




ALTER TABLE almamedis.cam_product_type 
ADD COLUMN desc_type_campana varchar(20);