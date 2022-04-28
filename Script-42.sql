--reporte motivos eliminacion
SELECT split_part(sf.hora,':', 1) as "Hora",
count(distinct folio) as "Folios para eliminacion",
count(distinct case when ("motivo de elimanacion" = 'CAMBIO MATERIA ASEGURADA') then opcion end) as "CAMBIO MATERIA ASEGURADA",
count(distinct case when ("motivo de elimanacion" = 'CIERRE DE PRODUCTOS DEL BANCO') then opcion end) as "CIERRE DE PRODUCTOS DEL BANCO",
count(distinct case when ("motivo de elimanacion" = 'COSTO DE SEGURO') then opcion end) as "COSTO DE SEGURO",
count(distinct case when ("motivo de elimanacion" = 'DESCONOCE CONTRATACION / NO RECUERDA') then opcion end) as "DESCONOCE CONTRATACION / NO RECUERDA",
count(distinct case when ("motivo de elimanacion" = 'NO DESEA CONTRAER MAS OBLIGACIONES') then opcion end) as "NO DESEA CONTRAER MAS OBLIGACIONES",
count(distinct case when ("motivo de elimanacion" = 'NO SABE QUE CUBRE EL SEGURO') then opcion end) as "NO SABE QUE CUBRE EL SEGURO",
count(distinct case when ("motivo de elimanacion" = 'PROBLEMAS ECONOMICOS') then opcion end) as "PROBLEMAS ECONOMICOS"
FROM inbound_fidelizacion.sabana_fidelizacion sf
--left join "Genesys".his_invoice_history hih ON hfh.for_his_genesys_id = hih.inv_his_genesys_id
where --for_his_metadata::json->>'id_campana' = 'd42b70f8-88b5-4bf4-aa37-7203a5c3d919'
sf.fecha is not null
group by split_part(sf.hora,':', 1)
order by split_part(sf.hora,':', 1);


----------------
select
	t.fecha,
	count(distinct case when (userId is null or userId = '') then null else t.jso_cdr_genesys_id end) "Llamadas contestadas",
	count(distinct case when (folio is not null or folio <> '') then folio end) as "Folios atendidos",
	count(distinct case when (opcion = 'NO RETRACTADO') then opcion end) as "Folios no retractados",
	count(distinct case when (opcion in ('RETRACTADO')) then opcion end) as "Folios Retractados"
 from (	
	select
		to_char(cdr.jso_cdr_date,'HH24') as fecha,
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
	where
		(cdr.jso_cdr_results->>'queueId') in ('d42b70f8-88b5-4bf4-aa37-7203a5c3d919')
		and cdr.jso_cdr_date::date between current_date - 7 and current_date	
		and ((cdr.jso_cdr_results->>'agents')::json->>'userId')::text <> 'eebc15f2-2889-4317-92e6-357df1b35fa3'
)t
group by t.fecha
order by t.fecha