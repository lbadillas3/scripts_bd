SELECT com_numero_comuna, com_descripcion
                  FROM "Genesys".com_comuna_hom
                  where com_id_campana = 'vivir-mas' 
                  and com_ciu_numero_ciudad = '1'
                  and com_descripcion not in ('SIN INFORMACION')
                  order by com_descripcion desc;
                  
                 
                 
SELECT reg_numero_region, reg_descripcion
    FROM "Genesys".com_region_hom
    where reg_id_campana = 'vivir-mas'
    order by reg_descripcion asc;
    
  select count(*) from G 