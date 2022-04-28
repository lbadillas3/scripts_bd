
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''101'' as categoria,case
when hah.adi_his_metadata::json->>''cod_parentesco_campana'' is null then '' ''
	 else hah.adi_his_metadata::json->>''cod_parentesco_campana''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union 
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''102'' as categoria,case
when hah.adi_his_metadata::json->>''Rut'' is null then '' ''
	 else hah.adi_his_metadata::json->>''Rut''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union 
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''103'' as categoria,case
when hah.adi_his_metadata::json->>''Nombre'' is null then ''''
	 else hah.adi_his_metadata::json->>''Nombre''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''104'' as categoria,case
when hah.adi_his_metadata::json->>''SegundoNombre'' is null then ''''
	 else hah.adi_his_metadata::json->>''SegundoNombre''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''105'' as categoria,case
when hah.adi_his_metadata::json->>''ApPaterno'' is null then ''''
	 else hah.adi_his_metadata::json->>''ApPaterno''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''106'' as categoria,case
when hah.adi_his_metadata::json->>''ApMaterno'' is null then ''''
	 else hah.adi_his_metadata::json->>''ApMaterno''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''107'' as categoria,case
when hah.adi_his_metadata::json->>''Porcentaje'' is null then ''''
	 else hah.adi_his_metadata::json->>''Porcentaje''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''108'' as categoria,case
when hah.adi_his_metadata::json->>''Telefono'' is null then '' ''
	 else hah.adi_his_metadata::json->>''Telefono''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''109'' as categoria,case
when hah.adi_his_metadata::json->>''Mail'' is null then ''''
	 else hah.adi_his_metadata::json->>''Mail''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''110'' as categoria,case
when hah.adi_his_metadata::json->>''Direccion'' is null then ''''
	 else hah.adi_his_metadata::json->>''Direccion''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''111'' as categoria,case
when hah.adi_his_metadata::json->>''Comuna'' is null then ''''
	 else hah.adi_his_metadata::json->>''Comuna''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''112'' as categoria,case
when hah.adi_his_metadata::json->>''Ciudad'' is null then ''''
	 else hah.adi_his_metadata::json->>''Ciudad''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''113'' as categoria,case
when hah.adi_his_metadata::json->>''Fechanacimiento'' is null then ''''
	 else hah.adi_his_metadata::json->>''Fechanacimiento''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''114'' as categoria,case
when hah.adi_his_metadata::json->>''Nacionalidad'' is null then ''''
	 else hah.adi_his_metadata::json->>''Nacionalidad''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hah.adi_his_con_id::int,(adi_his_id-subquery.adi_his_con_id::int)||''115'' as categoria,case
when hah.adi_his_metadata::json->>''Nacionalidad'' is null then ''''
	 else hah.adi_his_metadata::json->>''Nacionalidad''
end
FROM "Genesys".his_aditional_history hah inner join (SELECT min(hah.adi_his_id) as mini,hah.adi_his_con_id
from "Genesys".his_aditional_history hah
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
group by hah.adi_his_con_id) as subquery on hah.adi_his_con_id = subquery.adi_his_con_id
where hah.adi_his_con_id <> ''{{dialer.con_id}}''
order by adi_his_con_id,categoria