SELECT pro_typ_id, pro_typ_name, pro_typ_user, type_campana, desc_campana
FROM almamedis.cam_product_type
where id_campana= $1;


SELECT result_typ_name, result_typ_name_product, typ_result, typ_campana, desc_typ_selec
FROM almamedis.cam_result_type
where result_typ_selec = '11'
and id_typ_selec = '7'

