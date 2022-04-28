select replace(folio,'|',''),hora, fecha_venta, uniqueid as idcall, fecha_nom, idcampana, rut,  rutnombre, codpro , 
 fechacarpeta , fecha, socio , concat(uniqueid,'.wav') as grabacion, estado_venta  ,call, callnombre , poliza, 
nomprod, replace(concat(nombre_casi_final ,uniqueid,'.wav'),'|','') as nombre_final,
replace(concat(ruta_casi_final ,'/',uniqueid,'.wav'),'|','')  as ruta_final,
"nombre ejecutivo",
"nombre auditor"
from (
select estado_venta ,folio,fono_1, qv.idunico, hora,
(fecha || ' '|| hora)::timestamp as fecha_venta,
concat(to_char(fecha::date, 'DDMMYYYY'),replace(hora,':','')) as fecha_nom,
rut as rutnombre,
concat(rut,'-',dv)  as rut,
'8319' as codpro,
concat(to_char(fecha::DATE, 'DD-MM-YYYY'),' ',hora) as fecha,
ws_origen as idcampana,
'SCOTIABANK' as socio,
'220061415' as poliza,
'S3' as call,
'00S3' as callnombre,
'VIDA NOW' as nomprod,
to_char(fecha::date, 'YYYY_MM') as fechacarpeta, 
CONCAT('') as nombre_casi_final,
concat('/VIDA/',to_char(fecha::date,'YYYYMMDD')) as ruta_casi_final,
uniqueid, duration, upper(u2.nombre_fantasia) as "nombre ejecutivo" ,upper(u.nombre_fantasia) as "nombre auditor"
from 
	(select rank() over (partition by idunico order by fecha,hora,ramo desc) as rango_ventas,v.ws_id_usuario as id_usuario,idunico as idunico2 ,* 
	from scotia_vida_now.ventas v, scotia_vida_now.clientes c
	--left join public.usuarios u on u.idusuario = v.ws_idusuario_calidad
	where fecha between '20211016' and '20211031'
	and estado_venta in ('OK','RECUPERADO')
	and v.idunico = c.ws_idunico ) qv
left join public.usuarios u on u.idusuario = qv.ws_idusuario_calidad
left join public.usuarios u2 on u2.idusuario = qv.id_usuario 
left join (
	select idunico as idunico_cdr, uniqueid , duration, rango_cdr from 
	(select rank() over (partition by idunico order by billsec desc ) as rango_cdr, * 
	from public.cdr_camaleon cct 
	where fecha like concat('%%%102021','-%%:%%:%%') and idaplicacion = 2461 and disposition = 'ANSWERED')q2	 
) qcdr
on (qv.idunico::text = qcdr.idunico_cdr) 
where qv.rango_ventas = 1 and qcdr.rango_cdr = 1) as queryfinal
order by fecha_venta asc