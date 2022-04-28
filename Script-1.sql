SELECT con_id, id_interaction, cod_plan, num_servicio
FROM chubb.log_altas_saesa
where id_interaction = '185226f4-2f54-40ac-97a3-1f8df96dd7e8';


select
	case when cod_plan = 'INCED4' then 'Venta Edelaysen'
		when cod_plan = 'SAINCR' then 'Regalo Saesa'
		when cod_plan = 'INCSA4' then 'Venta Saesa'
		when cod_plan = 'INCFR4' then 'Venta Frontel'
		when cod_plan = 'INCLO4' then 'Venta Luz Osorno'
		when cod_plan = 'LOINCR' then 'Regalo Luz Osorno'
		when cod_plan = 'FRINCR' then 'Regalo Frontel'
		when cod_plan = 'EYINCR' then 'Regalo Edelaysen'
		end,
	count(cod_plan)
from
	chubb.log_altas_saesa
	--where fecha_carga = to_char(now()::date,'YYYYMMDD')
group by
	cod_plan;


--DELETE FROM chubb.log_altas_saesa;
