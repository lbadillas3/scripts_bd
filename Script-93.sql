select 
as "CRM ID"
as "EJECUTIVO VENTA"
as "FONO CONTACTO"
as "FECHA VENTA"
as "RUT VENTA"
as "DV VENTA"
as "NOMBRE VENTA"
as "NOMBRE GRABACION"
as "PRIMER ESTADO"
as "SEGUNDO ESTADO"
as "PRIMER MOTIVO"
as "OBSERVACION PRIMER ESTADO"
from 


select distinct on (dv.mdata::json->>'id_gestion')
	 dv.mdata::json->>'id_gestion',
	c.id as campana_id,
	case when dtg2.mdata::json->>'cal_assig_id' is not null then dtg2.mdata::json->>'cal_assig_id' else 'SIN ASIGNAR' END as "ID ASIGNACION",
	To_date(dv.mdata::json->>'for_his_date_form','YYYY-MM-DD') as "Fecha",
	split_part(split_part((TO_TIMESTAMP(dv.mdata::json->>'for_his_date_form', 'YYYY-MM-DD HH24:MI:SS'))::text , ' ',2), '-', 1) as "Hora",
	dv.mdata::json->>'pro_name_cam' as "CAMPA?A",
	dv.mdata::json->>'for_his_genesys_id' as "ID INTERACCION",
	'' as "ROW ID",
	dv.mdata::json->>'Rut' as "RUT",
	dv.mdata::json->>'pro_desc_plan' as "PLAN",
	dv.mdata::json->>'pro_valu_plan' as "RAMO",
	da."name" as "EJECUTIVO VENTA",
	da.rut as "RUT EJECUTIVO VENTA",
	case when dtg2.mdata::json->>'cal_eval_typing' in ('1') then 'OK'
	when dtg2.mdata::json->>'cal_eval_typing' in ('9','10','11','15') then 'RECHAZADO'
	when dtg2.mdata::json->>'cal_eval_typing' in ('2','5','8','12','13') then 'PENDIENTE'
	when dtg2.mdata::json->>'cal_eval_typing' in ('4','14') then 'RECUPERADO'
	else 'Venta No Auditada'
	end as "ESTADO VENTA",
	dtg2.mdata::json->>'cal_eval_reject_type' as "TIPO RECHAZO",
	dtg2.mdata::json->>'eval_date_hour' as "FECHA CALIDAD",
	case when (dtg2.mdata::json->>'cal_eval_typing' = '1' or dtg2.mdata::json->>'cal_eval_typing' = '4' or dtg2.mdata::json->>'cal_eval_typing' = '9' or dtg2.mdata::json->>'cal_eval_typing' ='10' or dtg2.mdata::json->>'cal_eval_typing' = '11') then 'FINALIZADO'
	 when dv.mdata::json->>'for_his_date_form' > dtg2.mdata::json->>'cal_eval_date_hour' and (dtg2.mdata::json->>'cal_eval_typing' <> '1' or dtg2.mdata::json->>'cal_eval_typing' <> '4') then 'GESTIONADO'
	 else 'NO GESTIONADAO'
	end as "CPA",
	ge.mdata::json->>'cal_assig_state' as "ESTADO ASIGNACION",
	dtg2.mdata::json->>'cal_eval_id' as "ID EVALUACION",
	dtg2.mdata::json->'cal_pauta_evaluada'->>'observacion' as "OBSERVACION"
FROM (
	select *
	from dw_nuevo.dw_ventas ve2
	where 
		ve2.campana_id = 125
		and To_date(ve2.mdata::json->>'for_his_date_form','YYYY-MM-DD') between to_char(now (),'YYYYMM01')::date and to_char(now () - INTERVAL '1 DAY','YYYYMMDD')::date
		--and ve2.date::date between '20210801' and '20210831'
		and (ve2.venta_id, (ve2.mdata->>'for_his_genesys_id')) in (
			select 
				--max(ve.date) fecha,
				max(ve.venta_id) id_venta,
				(ve.mdata->>'for_his_genesys_id') id_gestion
			from dw_nuevo.dw_ventas ve
			where
				ve.campana_id = 125
				and To_date(ve.mdata::json->>'for_his_date_form','YYYY-MM-DD') between to_char(now (),'YYYYMM01')::date and to_char(now () - INTERVAL '1 DAY','YYYYMMDD')::date
				--and ve.date::date between '20210801' and '20210831'
			group by (ve.mdata->>'for_his_genesys_id')
		)
)dv 
left join dw_nuevo.campanas c ON c.id = dv.campana_id
left join dw_nuevo.dw_agentes da on da.mdata->>'id'::varchar = dv.mdata::json->>'id_ejecutivo'
left join dw_nuevo.genesys_esquemas dtg2 on dtg2.name_table = 'cal_evaluations' and dtg2.mdata::json->>'cal_eval_interaction' = dv.mdata::json->>'for_his_genesys_id' and dtg2.mdata::json->>'cal_eval_state' is null
left join dw_nuevo.genesys_esquemas ge on ge.mdata::json->>'cal_assig_id' = dtg2.mdata::json->>'cal_assig_id' and ge.name_table ='cal_assignments'
--where 
	--c.id in (125)
	--and dtg2.mdata::json->>'cal_eval_typing' in ('2','5','8','12','13','1','9','10','11','15','4','14')
	--and  To_date(dv.mdata::json->>'for_his_date_form','YYYY-MM-DD') between to_char(now (),'YYYYMM01')::date and '20210913' --to_char(now () - INTERVAL '1 DAY','YYYYMMDD')::date