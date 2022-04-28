---------------reporte 1
select * from(
select --distinct on (hfh.for_his_genesys_id,hih.inv_his_metadata::json->>'Folio') 
for_his_metadata::json->>'Rut' as "rut_cliente",
hih.inv_his_metadata::json->>'Folio' as "folio",
to_char(hih.inv_his_date_form,'DD/MM/YYYY')  as "fecha",
hih.inv_his_metadata::json->>'Opcion' as "opcion",
hih.inv_his_metadata::json->>'Ramo' as "ramo",
hih.inv_his_metadata::json->>'MotivoEliminacion' as "motivo de elimanacion",
ROW_NUMBER() OVER(
    PARTITION BY hfh.for_his_genesys_id
    ORDER BY hih.inv_his_date_form
	DESC
	) as ranking
FROM "Genesys".his_form_history hfh
left join "Genesys".his_invoice_history hih ON hfh.for_his_genesys_id = hih.inv_his_genesys_id 
where for_his_metadata::json->>'id_campana' = 'd42b70f8-88b5-4bf4-aa37-7203a5c3d919'
and to_char(hih.inv_his_date_form,'DD/MM/YYYY') is not null
and hih.inv_his_date_form >= '2021/11/02') as total
where ranking = 1


--reporte 3 parte 2
select
	t.ejecutivo,
	count(distinct case when (userId is null or userId = '') then null else t.jso_cdr_genesys_id end) "Llamadas contestadas",
	sum(case when (folio is not null or folio <> '') then 1 else 0 end) as "Folios atendidos",
	sum(case when (upper(opcion) = 'NO RETRACTADO') then 1 else 0 end) as "Folios no retractados",
	sum(case when (upper(opcion) like 'RETRACTADO%') then 1 else 0 end) as "Folios Retractados"
 from (	
	select
		sf.ejecutivo,
		cdr.jso_cdr_genesys_id,
		(cdr.jso_cdr_results->>'queueId') queueId,
		(cdr.jso_cdr_results->>'timeoutConversation')::float ,
		(cdr.jso_cdr_results->>'timeoutConversation')::float/60 ,
		((cdr.jso_cdr_results->>'agents')::json->>'userId') userId,
		((cdr.jso_cdr_results->>'agents')::json->>'wrapUpCode') code,
        (hih.inv_his_metadata::json->>'Opcion') opcion,
        (hih.inv_his_metadata::json->>'Folio') folio
		from "Genesys".res_json_genesys_cdr cdr
	left join "Genesys".his_invoice_history hih ON cdr.jso_cdr_results->>'queueId' = 'd42b70f8-88b5-4bf4-aa37-7203a5c3d919' and cdr.jso_cdr_genesys_id = hih.inv_his_genesys_id
	left join inbound_fidelizacion.sabana_fidelizacion sf on sf.folio = hih.inv_his_metadata::json->>'Folio'
	where
		(cdr.jso_cdr_results->>'queueId') in ('d42b70f8-88b5-4bf4-aa37-7203a5c3d919')
		--and to_char(cdr.jso_cdr_date::date, 'yyyymmdd') = to_char(current_date, 'yyyymmdd')
		and to_char(cdr.jso_cdr_date::date, 'yyyymmdd') = '20220311'
		--and cdr.jso_cdr_date::date = current_date
		and ((cdr.jso_cdr_results->>'agents')::json->>'userId')::text <> 'eebc15f2-2889-4317-92e6-357df1b35fa3'
		and sf.ejecutivo is not null
)t
group by t.ejecutivo 
order by t.ejecutivo