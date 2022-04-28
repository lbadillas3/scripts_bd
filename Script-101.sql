--reporte motivos eliminacion
SELECT 
ejecutivo,
sum(case when (folio <> '' or folio is not null) then 1 else 0 end) as "Folios para eliminacion",
sum(case when ("motivo de elimanacion" = 'CAMBIO MATERIA ASEGURADA') then 1 else 0 end) as "CAMBIO MATERIA ASEGURADA",
sum(case when ("motivo de elimanacion" = 'CIERRE DE PRODUCTOS DEL BANCO') then 1 else 0 end) as "CIERRE DE PRODUCTOS DEL BANCO",
sum(case when ("motivo de elimanacion" = 'COSTO DE SEGURO') then 1 else 0 end) as "COSTO DE SEGURO",
sum(case when ("motivo de elimanacion" = 'DESCONOCE CONTRATACION / NO RECUERDA') then 1 else 0 end) as "DESCONOCE CONTRATACION / NO RECUERDA",
sum(case when ("motivo de elimanacion" = 'NO DESEA CONTRAER MAS OBLIGACIONES') then 1 else 0 end) as "NO DESEA CONTRAER MAS OBLIGACIONES",
sum(case when ("motivo de elimanacion" = 'NO SABE QUE CUBRE EL SEGURO') then 1 else 0 end) as "NO SABE QUE CUBRE EL SEGURO",
sum(case when ("motivo de elimanacion" = 'PROBLEMAS ECONOMICOS') then 1 else 0 end) as "PROBLEMAS ECONOMICOS",
sum(case when ("motivo de elimanacion" not in ('CAMBIO MATERIA ASEGURADA', 'CIERRE DE PRODUCTOS DEL BANCO', 'COSTO DE SEGURO', 'DESCONOCE CONTRATACION / NO RECUERDA',
'NO DESEA CONTRAER MAS OBLIGACIONES', 'NO SABE QUE CUBRE EL SEGURO','PROBLEMAS ECONOMICOS')) then 1 else 0 end) as "otro"
FROM inbound_fidelizacion.sabana_fidelizacion sf
where --for_his_metadata::json->>'id_campana' = 'd42b70f8-88b5-4bf4-aa37-7203a5c3d919'
sf.ejecutivo is not null
and fecha between to_char((NOW() - interval '5 days'), 'ddmmyyyy') and TO_CHAR(NOW() :: DATE, 'ddmmyyyy')
group by ejecutivo
order by ejecutivo;


---parte 2
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
		and to_char(cdr.jso_cdr_date::date, 'yyyymmdd') between to_char((NOW() - interval '5 days'), 'yyyymmdd') and to_char(current_date, 'yyyymmdd')
		--and cdr.jso_cdr_date::date = current_date
		and ((cdr.jso_cdr_results->>'agents')::json->>'userId')::text <> 'eebc15f2-2889-4317-92e6-357df1b35fa3'
		and sf.ejecutivo is not null
)t
group by t.ejecutivo
order by t.ejecutivo