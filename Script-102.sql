select
"CALLCENTER",
"SOCIO",
"PRODUCTO",
"CAMPANA",
"POLIZA",
'DIARIO' as "FRECUENCIA",
"CODIGO_PRODUCTO",
"RUT_CLIENTE",
"RUT_CLIENTE COMPLETO",
"FECHA",
"FONO",
'' as "RUT_AGENTE",
"NOMBRE_AGENTE",
to_char(now(),'YYYYMMDD') as "FECHA_BASE",
"CONTACTO",
'' as "EFECTIVO",
"STATUS",
"CATEGORIA",
'' as "EMAIL",
'' as "RESPUESTA",
'' as "NUMERO_OPERACIÓN",
plan as "PLAN_TITULAR",
'' as "PLAN_ADICIONAL",
'1' as "CANTIDAD_VENTAS",
valor as "PRIMA_TIT_UF",
'' as "PRIMA_ADIC_UF",
'1' as "CANTIDAD_VENTAS_NETAS",
'' as "IDBASE",
replace(folio,'|',''),hora, fecha_venta, fecha_nom,  rutnombre,
 estado_venta  ,call
 from (
select
'00S3' as "CALLCENTER",
estado_venta ,folio,fono_1, qv.idunico, hora,
(fecha || ' '|| hora)::timestamp as fecha_venta,
concat(to_char(fecha::date, 'DDMMYYYY'),replace(hora,':','')) as fecha_nom,
qv.rut as rutnombre,
qv.idunico as idunicos,
qv.rut as "RUT_CLIENTE",
concat(qv.rut,'-',qv.dv)  as "RUT_CLIENTE COMPLETO",
'8319' as "CODIGO_PRODUCTO",
concat(to_char(fecha::DATE, 'DD-MM-YYYY'),' ',hora) as "FECHA",
ws_origen as  "CAMPANA",
'CAJA LOS ANDES' as "SOCIO",
'220061415' as "POLIZA",
'S3' as call,
'AUTO LIGHT' as "PRODUCTO",
qv.fono_venta as "FONO",
qv.contacto_fono1 as "CONTACTO",
qv.area_venta as "STATUS",
qv.estado_venta as "CATEGORIA",
p.valor as valor,
p.desc_producto as plan,
to_char(fecha::date, 'YYYY_MM') as fechacarpeta,
CONCAT('') as nombre_casi_final,
concat(qv.rut, qv.dv) as "RUT_AGENTE",
--CONCAT('auto_light_',folio,'_',concat(rut,'-',UPPER(dv)),'_',to_char(fecha::DATE, 'YYYYMMDD'),'_Dura_') as nombre_casi_final,
concat('BCI/',to_char(fecha::date,'YYYYMMDD')) as ruta_casi_final,
upper(u2.nombre_fantasia) as "NOMBRE_AGENTE" ,upper(u.nombre_fantasia) as "nombre auditor"
from
	(select rank() over (partition by idunico order by fecha,hora,ramo desc) as rango_ventas,idunico as idunico2,v.ws_id_usuario as id_usuario,
	c.contacto_fono1 as contacto,v.plan as cod_plan,*
	from cardif_automotriz.ventas v, cardif_automotriz.clientes c
	--where fecha like to_char(now(), 'YYYYMMDD')
	where fecha between '20220401' and '20220411'
	and estado_venta in ('OK','RECUPERADO')
	and v.idunico = c.ws_idunico) qv
left join public.usuarios u on u.idusuario = qv.ws_idusuario_calidad
left join public.usuarios u2 on u2.idusuario = qv.id_usuario
left join cardif_automotriz.productos p on p.cod_producto = qv.cod_plan::integer ) as queryfinal order by fecha_venta asc