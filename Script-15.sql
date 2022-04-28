select
to_date(dv.mdata::json->>'fecha','YYYYMMDD') as fecha,
da.rut as rut,
c."name" as "producto",
count(da.rut) as avance,
'' as Filtro1,
'' as Filtro2,
'' as Filtro3
FROM dw_nuevo.dw_ventas dv 
left join dw_nuevo.campanas c ON c.id = dv.campana_id
left join dw_nuevo.dw_agentes da on da.mdata->>'idusuario'::varchar = dv.mdata::json->>'ws_id_usuario'
where c.id in ('57','85','116','126','117')
and dv.mdata::json->>'fecha' > '20210801'
and dv.mdata::json->>'estado_venta' in ('OK','RECUPERADO')
and da.mdata::json->>'nacionalidad' not in ('2')
group by (dv.mdata::json->>'fecha',da.rut,c."name")