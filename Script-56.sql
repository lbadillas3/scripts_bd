SELECT rut,count(rut) 
FROM cardif_hospitalario.cardif_hospitalario_comparativa
group by rut
having count(rut) > 17

concat('0',' ',) 
