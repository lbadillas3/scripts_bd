--reporte3 parte 1
select
	t.fecha,
	count(distinct t.jso_cdr_genesys_id) llamadas ,
	count(distinct case when (userId is null or userId <> '') then null else t.jso_cdr_genesys_id end) "Llamadas abandonas" ,
	count(distinct case when (userId is null or userId = '') then null else t.jso_cdr_genesys_id end) "Llamadas contestadas",
	ROUND(CAST(count(distinct case when (userId is null or userId <> '') then null else t.jso_cdr_genesys_id end) as numeric) * 100 / cast(count(distinct t.jso_cdr_genesys_id) AS NUMERIC), 2) as "% Abandono"
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
group by t.fecha
order by t.fecha