--reporte3 parte 1
select
	to_char(t.fecha,'DD/MM/YYYY')as fecha,
	count(distinct t.jso_cdr_genesys_id) llamadas ,
	count(distinct case when (userId is null or userId <> '') then null else t.jso_cdr_genesys_id end) "Llamadas abandonas" ,
	count(distinct case when (userId is null or userId = '') then null else t.jso_cdr_genesys_id end) "Llamadas contestadas",
	concat(ROUND(CAST(count(distinct case when (userId is null or userId <> '') then null else t.jso_cdr_genesys_id end) as numeric) * 100 / cast(count(distinct t.jso_cdr_genesys_id) AS NUMERIC), 2), '%') as "% Abandono"
 from (	
	select
		cdr.jso_cdr_date::date fecha,
		cdr.jso_cdr_genesys_id,
		--(cdr.jso_cdr_results->>'queueId') queueId,
		(cdr.jso_cdr_results->>'timeoutConversation')::float ,
		(cdr.jso_cdr_results->>'timeoutConversation')::float/60 ,
		((cdr.jso_cdr_results->>'agents')::json->>'userId') userId,
		((cdr.jso_cdr_results->>'agents')::json->>'wrapUpCode') code
	from "Genesys".res_json_genesys_cdr cdr
	where
		(cdr.jso_cdr_results->>'queueId') in ('d42b70f8-88b5-4bf4-aa37-7203a5c3d919')
		and cdr.jso_cdr_date::date between current_date - 7 and current_date	
		and ((cdr.jso_cdr_results->>'agents')::json->>'userId')::text <> 'eebc15f2-2889-4317-92e6-357df1b35fa3'
)t
where t.fecha >= '20211102'
group by t.fecha
order by t.fecha


--reporte 3 parte 2
SELECT sf.fecha,
count(sf.folio) as "Folios para eliminacion",
sum(case when (upper(opcion) like ('RETRACTADO%')) then 1 end) as "Folios retractados",
sum(case when (upper(opcion) = 'NO RETRACTADO') then 1 end) as "Folios no retractados",
concat(ROUND(CAST(sum(case when (upper(opcion) like ('RETRACTADO%')) then 1 end) as numeric)*100 / CAST(count(distinct folio)  as numeric), 2), '%') as "% Efectividad",
sum(case when (upper(opcion) = '') then 1 end) as "vacios"
FROM inbound_fidelizacion.sabana_fidelizacion sf 
group by sf.fecha
order by sf.fecha


