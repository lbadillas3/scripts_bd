select etiquetas, count(*) from (select
case when cal.mdata::json->>'cal_eval_typing' in ('1') then 'OK'
when cal.mdata::json->>'cal_eval_typing' in ('9','10','11','15') then 'RECHAZADO'
when cal.mdata::json->>'cal_eval_typing' in ('2','5','8','12','13') then 'PENDIENTE'
when cal.mdata::json->>'cal_eval_typing' in ('4','14') then 'RECUPERADO'
when cal.mdata::json->>'cal_eval_typing' is null then 'PENDIENTE AUDITA'
when cal.mdata::json->>'cal_eval_typing' = '' then 'PENDIENTE AUDITA'
end as etiquetas
FROM (
	select *
	from dw_nuevo.dw_ventas ve2
	where 
		ve2.campana_id = 125
		and To_date(ve2.mdata::json->>'for_his_date_form','YYYY-MM-DD') between to_char(now (),'YYYYMM01')::date and to_char(now () - INTERVAL '1 DAY','YYYYMMDD')::date
		and (ve2.venta_id, (ve2.mdata->>'for_his_genesys_id')) in (
			select 
				--max(ve.date) fecha,
				max(ve.venta_id) id_venta,
				(ve.mdata->>'for_his_genesys_id') id_gestion
			from dw_nuevo.dw_ventas ve
			where
				ve.campana_id = 125
				and To_date(ve.mdata::json->>'for_his_date_form','YYYY-MM-DD') between to_char(now (),'YYYYMM01')::date and to_char(now () - INTERVAL '1 DAY','YYYYMMDD')::date
				--and ve.date::date between '20210901' and '20210914'
			group by (ve.mdata->>'for_his_genesys_id')
		)
)dv 
left join dw_nuevo.campanas c ON c.id = dv.campana_id
left join dw_nuevo.dw_agentes da on da.mdata->>'id'::varchar = dv.mdata::json->>'id_ejecutivo'
left join dw_nuevo.genesys_esquemas cal on cal.esquema = 'calidad_app' and cal.name_table = 'cal_evaluations' and (cal.mdata->>'cal_eval_interaction') = (dv.mdata->>'id_gestion') and (cal.mdata->>'cal_eval_state') is null
left join dw_nuevo.genesys_esquemas ge on ge.mdata::json->>'cal_assig_id' = cal.mdata::json->>'cal_assig_id' and ge.name_table ='cal_assignments'
)t group by etiquetas