--reporte3 parte 1
select
	t.fecha,
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
group by t.fecha
order by t.fecha

--reporte 3 parte 2
SELECT to_char(hih.inv_his_date_form,'DD-MM-YYYY') as "fecha",
count(distinct hih.inv_his_metadata::json->>'Folio') as "Folios para eliminacion",
count(distinct case when (hih.inv_his_metadata::json->>'Opcion' <> 'NO RETRACTADO') then hih.inv_his_metadata::json->>'Opcion' end) as "Folios retractados",
count(distinct case when (hih.inv_his_metadata::json->>'Opcion' = 'NO RETRACTADO') then hih.inv_his_metadata::json->>'Opcion' end) as "Folios no retractados",
ROUND(CAST(count(distinct case when (hih.inv_his_metadata::json->>'Opcion' = 'RETRACTADO') then hih.inv_his_metadata::json->>'Opcion' end) as numeric) * 100 / CAST(count(distinct hih.inv_his_metadata::json->>'Folio') as numeric), 2) as "% Efectividad" 
--hih.inv_his_metadata::json->>'Opcion' as "opcion"
FROM "Genesys".his_form_history hfh
left join "Genesys".his_invoice_history hih ON hfh.for_his_genesys_id = hih.inv_his_genesys_id
where for_his_metadata::json->>'id_campana' = 'd42b70f8-88b5-4bf4-aa37-7203a5c3d919'
and to_char(hih.inv_his_date_form,'DD-MM-YYYY') is not null 
group by to_char(hih.inv_his_date_form,'DD-MM-YYYY')
order by to_char(hih.inv_his_date_form,'DD-MM-YYYY');


--reporte 3 parte 3
SELECT to_char(hih.inv_his_date_form,'DD-MM-YYYY') as "fecha",
count(distinct hih.inv_his_metadata::json->>'Folio' and hih.inv_his_metadata::json->>'Ramo' = 'PROTECCION') as "Folios para eliminacion proteccion",
count(distinct hih.inv_his_metadata::json->>'Folio') - (count(distinct case when (hih.inv_his_metadata::json->>'MotivoEliminacion' = 'CIERRE DE PRODUCTOS DEL BANCO') then hih.inv_his_metadata::json->>'MotivoEliminacion' end) +count(distinct case when (hih.inv_his_metadata::json->>'Ramo' = 'PROTECCION') then hih.inv_his_metadata::json->>'Ramo' end)) as "Folios para eliminacion Ley",
count(distinct case when (hih.inv_his_metadata::json->>'MotivoEliminacion' = 'CIERRE DE PRODUCTOS DEL BANCO') then hih.inv_his_metadata::json->>'MotivoEliminacion' end) as "Folio para eliminacion de cierre de productos",
count(distinct case when (hih.inv_his_metadata::json->>'Ramo' = 'PROTECCION') then hih.inv_his_metadata::json->>'Ramo' end) as "Folios Retractados Protección",
ROUND(CAST(count(distinct case when (hih.inv_his_metadata::json->>'Ramo' = 'PROTECCION') then hih.inv_his_metadata::json->>'Ramo' end) as numeric)  * 100 / CAST(count(distinct hih.inv_his_metadata::json->>'Folio') as numeric), 2) as "% Efectividad retractación Protección",
count(distinct case when (hih.inv_his_metadata::json->>'Ramo' <> 'PROTECCION') then hih.inv_his_metadata::json->>'Ramo' end) as "Folios No Retractados Proteccion"
FROM "Genesys".his_form_history hfh
left join "Genesys".his_invoice_history hih ON hfh.for_his_genesys_id = hih.inv_his_genesys_id
where for_his_metadata::json->>'id_campana' = 'd42b70f8-88b5-4bf4-aa37-7203a5c3d919'
and to_char(hih.inv_his_date_form,'DD-MM-YYYY') is not null 
group by to_char(hih.inv_his_date_form,'DD-MM-YYYY')
order by to_char(hih.inv_his_date_form,'DD-MM-YYYY');