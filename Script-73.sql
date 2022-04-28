select hora, fecha_venta, uniqueid as idcall, fecha_nom, idcampana, rut,  rutnombre, codpro , 
 fechacarpeta , fecha, socio , concat(uniqueid,'.mp3') as grabacion, estado_venta  ,call, callnombre , poliza, 
nomprod, replace(concat(nombre_casi_final , duration,'_',uniqueid,'.mp3'),'|','') as nombre_final,
replace(concat(ruta_casi_final ,duration,'_',uniqueid,'.mp3'),'|','')  as ruta_final
from (
select estado_venta ,folio,fono, qv.idunico, hora,
(fecha || ' '|| hora)::timestamp as fecha_venta,
concat(to_char(fecha::date, 'DDMMYYYY'),replace(hora,':','')) as fecha_nom,
rut_cliente as rutnombre,
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
CONCAT('scotia_vida_now_',folio,'_',concat(rut,'-',UPPER(dv)),'_',to_char(fecha::DATE, 'YYYYMMDD'),'_Dura_') as nombre_casi_final,
concat(to_char(fecha::date,'YYYY_MM'),'/SCO/VIDA_NOW/scotia_vida_now_',folio,'_',concat(rut,'-',UPPER(dv)),'_',to_char(fecha::DATE, 'YYYYMMDD'),'_Dura_') as ruta_casi_final,
uniqueid, duration
from 
	(select rank() over (partition by idunico order by fecha,hora,ramo desc) as rango_ventas,idunico as idunico2 ,* 
	from scotia_vida_now.ventas v, scotia_vida_now.clientes c 
	where fecha like '202201%%' 
	and estado_venta in ('OK','RECUPERADO')
	and v.idunico = c.ws_idunico ) qv
left join (
	select idunico as idunico_cdr, uniqueid , duration, rango_cdr from 
	(select rank() over (partition by idunico order by billsec desc ) as rango_cdr, * 
	from public.cdr_camaleon cct 
	where fecha like concat('%%%012022','-%%:%%:%%') and idaplicacion = 2461 and disposition = 'ANSWERED')q2	 
) qcdr
on (qv.idunico::text = qcdr.idunico_cdr)
where qv.rango_ventas = 1 and qcdr.rango_cdr = 1) as queryfinal order by fecha_venta asc