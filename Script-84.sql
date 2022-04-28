select a.idunico::int,(cod_aseg-subquery.idunico::int)||'101' as categoria,case
when a.rut_cliente is null then ' '
else a.rut_cliente
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> 'dialer.idunico'
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> 'dialer.idunico'
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||'102' as categoria,case
when a.nombre_asegurado is null then ' '
else a.nombre_asegurado 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> 'dialer.idunico'
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> 'dialer.idunico'
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||'103' as categoria,case
when a.paterno_asegurado is null then ' '
else a.paterno_asegurado 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> 'dialer.idunico'
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> 'dialer.idunico'
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||'104' as categoria,case
when a.materno_asegurado is null then ' '
else a.materno_asegurado 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> 'dialer.idunico'
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> 'dialer.idunico'
union
--select a.idunico::int,(cod_aseg-subquery.idunico::int)||'105' as categoria,case
--when a.porcentaje is null then ' '
--else a.porcentaje 
--end
--from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
--from cardif_hospitalario_familiar.asegurados a 
--where a.idunico <> 'dialer.idunico'
--group by a.idunico) as subquery on a.idunico = subquery.idunico
--where a.idunico <> 'dialer.idunico'
--union
--select a.idunico::int,(cod_aseg-subquery.idunico::int)||'106' as categoria,case
--when a.telefono is null then ' '
--else a.telefono 
--end
--from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
--from cardif_hospitalario_familiar.asegurados a 
--where a.idunico <> 'dialer.idunico'
--group by a.idunico) as subquery on a.idunico = subquery.idunico
--where a.idunico <> 'dialer.idunico'
--union
--select a.idunico::int,(cod_aseg-subquery.idunico::int)||'107' as categoria,case
--when a.mail is null then ' '
--else a.mail 
--end
--from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
--from cardif_hospitalario_familiar.asegurados a 
--where a.idunico <> 'dialer.idunico'
--group by a.idunico) as subquery on a.idunico = subquery.idunico
--where a.idunico <> 'dialer.idunico'
--union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||'108' as categoria,case
when a.residencia is null then ' '
else a.residencia 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> 'dialer.idunico'
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> 'dialer.idunico'
union
--select a.idunico::int,(cod_aseg-subquery.idunico::int)||'109' as categoria,case
--when a.comuna is null then ' '
--else a.comuna 
--end
--from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
--from cardif_hospitalario_familiar.asegurados a 
--where a.idunico <> 'dialer.idunico'
--group by a.idunico) as subquery on a.idunico = subquery.idunico
--where a.idunico <> 'dialer.idunico'
--union
--select a.idunico::int,(cod_aseg-subquery.idunico::int)||'110' as categoria,case
--when a.ciudad is null then ' '
--else a.ciudad 
--end
--from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
--from cardif_hospitalario_familiar.asegurados a 
--where a.idunico <> 'dialer.idunico'
--group by a.idunico) as subquery on a.idunico = subquery.idunico
--where a.idunico <> 'dialer.idunico'
--union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||'111' as categoria,case
when a.fecha_nacimiento is null then ' '
else a.fecha_nacimiento 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> 'dialer.idunico'
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> 'dialer.idunico'
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||'112' as categoria,case
when a.nacionalidad is null then ' '
else a.nacionalidad 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> 'dialer.idunico'
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> 'dialer.idunico'
union
select a.idunico::int,(cod_aseg-subquery.idunico::int)||'113' as categoria,case
when a.nacionalidad is null then ' '
else a.nacionalidad 
end
from cardif_hospitalario_familiar.asegurados a inner join (select min(a.cod_aseg) as mini,a.idunico
from cardif_hospitalario_familiar.asegurados a 
where a.idunico <> 'dialer.idunico'
group by a.idunico) as subquery on a.idunico = subquery.idunico
where a.idunico <> 'dialer.idunico'
order by idunico,categoria