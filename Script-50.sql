--reporte 3 parte 2
SELECT sf.fecha,
count(sf.folio) as "Folios para eliminacion",
sum(case when (opcion in ('RETRACTADO','RETRACTADO OTRO')) then 1 end) as "Folios retractados",
sum(case when (opcion = 'NO RETRACTADO') then 1 end) as "Folios no retractados",
concat(ROUND(CAST(sum(case when (opcion in ('RETRACTADO','RETRACTADO OTRO')) then 1 end) as numeric)*100 / CAST(count(distinct folio)  as numeric), 2), '%') as "% Efectividad",
sum(case when (opcion = '') then 1 end) as "vacios"
FROM inbound_fidelizacion.sabana_fidelizacion sf 
group by sf.fecha
order by sf.fecha

SELECT sf.fecha,
count(sf.folio) as "Folios para eliminacion",
sum(case when (upper(opcion) like ('RETRACTADO%')) then 1 end) as "Folios retractados",
sum(case when (upper(opcion) = 'NO RETRACTADO') then 1 end) as "Folios no retractados",
concat(ROUND(CAST(sum(case when (upper(opcion) like ('RETRACTADO%')) then 1 end) as numeric)*100 / CAST(count(distinct folio)  as numeric), 2), '%') as "% Efectividad",
sum(case when (upper(opcion) = '') then 1 end) as "vacios"
FROM inbound_fidelizacion.sabana_fidelizacion sf 
group by sf.fecha
order by sf.fecha
--------------------

--reporte 3 parte 3
SELECT sf.fecha,
count(ramo) as "Folios para eliminacion proteccion",
((sum(case when (opcion = 'NO RETRACTADO') then 1 else 0 end)) - sum(case when ("motivo de elimanacion"  = 'CIERRE DE PRODUCTOS DEL BANCO' and opcion = 'NO RETRACTADO')  then 1 else 0 end))  as "Folios para eliminacion Ley",
sum(case when ("motivo de elimanacion"  = 'CIERRE DE PRODUCTOS DEL BANCO' and opcion = 'NO RETRACTADO')  then 1 else 0 end) as "Folio para eliminacion de cierre de productos",
sum( case when (opcion like 'RETRACTADO%') then 1 else 0 end) as "Folios Retractados Protección",
concat(ROUND(CAST(sum( case when (opcion like 'RETRACTADO%') then 1 else 0 end) as numeric ) * 100 / CAST(count(ramo) as numeric), 2),'%') as "% Efectividad retractación Protección",
sum( case when (opcion = 'NO RETRACTADO') then 1 else 0 end) as "Folios No Retractados Proteccion"
FROM inbound_fidelizacion.sabana_fidelizacion sf
where ramo = 'PROTECCION'
and sf.fecha is not null
group by sf.fecha
order by sf.fecha;

SELECT sf.fecha,
count(ramo) as "Folios para eliminacion proteccion",
((sum(case when (upper(opcion) = 'NO RETRACTADO') then 1 else 0 end)) - sum(case when ("motivo de elimanacion"  = 'CIERRE DE PRODUCTOS DEL BANCO' and upper(opcion) = 'NO RETRACTADO')  then 1 else 0 end))  as "Folios para eliminacion Ley",
sum(case when ("motivo de elimanacion"  = 'CIERRE DE PRODUCTOS DEL BANCO' and upper(opcion) = 'NO RETRACTADO')  then 1 else 0 end) as "Folio para eliminacion de cierre de productos",
sum( case when (upper(opcion) like 'RETRACTADO%') then 1 else 0 end) as "Folios Retractados Protección",
concat(ROUND(CAST(sum( case when (upper(opcion) like 'RETRACTADO%') then 1 else 0 end) as numeric ) * 100 / CAST(count(ramo) as numeric), 2),'%') as "% Efectividad retractación Protección",
sum( case when (upper(opcion) = 'NO RETRACTADO') then 1 else 0 end) as "Folios No Retractados Proteccion"
FROM inbound_fidelizacion.sabana_fidelizacion sf
where ramo = 'PROTECCION'
and sf.fecha is not null
group by sf.fecha
order by sf.fecha;