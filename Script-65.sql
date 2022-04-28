select replace(folio,'|',''),hora,nombrearchivo , fecha_venta, uniqueid as idcall, fecha_nom, idcampana, rut,  rutnombre, codpro , 
 fechacarpeta , fecha, socio , concat(uniqueid,'.wav') as grabacion, estado_venta  ,call, callnombre , poliza, 
nomprod, replace(concat(nombre_casi_final ,uniqueid,'.wav'),'|','') as nombre_final,
replace(concat(ruta_casi_final ,'/',uniqueid,'.wav'),'|','')  as ruta_final
from (
select estado_venta ,folio,fono_1, qv.idunico, hora,
concat('cardif_automotriz_',qv.estado_venta,'_',qv.folio,'_',qv.rut_aseg,'_',qv.fecha,'_Dura_',qcdr.duration,'_',qcdr.uniqueid,'.mp3' ) as nombrearchivo,
(fecha || ' '|| hora)::timestamp as fecha_venta,
concat(to_char(fecha::date, 'DDMMYYYY'),replace(hora,':','')) as fecha_nom,
rut as rutnombre,
concat(rut,'-',dv)  as rut,
'6666' as codpro,
concat(to_char(fecha::DATE, 'DD-MM-YYYY'),' ',hora) as fecha,
ws_origen as idcampana, 
'CARDIF' as socio,
'831920001' as poliza,
'S3' as call,
'00S3' as callnombre,
'CAJA LOS ANDES' as nomprod,
to_char(fecha::date, 'YYYY_MM') as fechacarpeta,
CONCAT('') as nombre_casi_final,
concat('/CARDIF/',to_char(fecha::date,'YYYY_MM'),'/CLA/AUTO_LIGHT') as ruta_casi_final,
uniqueid, duration
from 
	(select rank() over (partition by idunico order by fecha,hora,ramo desc) as rango_ventas,idunico as idunico2,* 
	from cardif_automotriz.ventas v, cardif_automotriz.clientes c 
	where fecha like '202111%%' and estado_venta in ('OK','RECUPERADO') and v.idunico = c.ws_idunico) qv
left join (
	select idunico as idunico_cdr, uniqueid , duration, rango_cdr from 
	(select rank() over (partition by idunico order by billsec desc ) as rango_cdr, * 
	from public.cdr_camaleon cct 
	where fecha like concat('%%%112021','-%%:%%:%%') and idaplicacion = 2152 and disposition = 'ANSWERED')q2	 
) qcdr
on (qv.idunico::text = qcdr.idunico_cdr)
where qv.rango_ventas = 1 and qcdr.rango_cdr = 1) as queryfinal order by fecha_venta asc