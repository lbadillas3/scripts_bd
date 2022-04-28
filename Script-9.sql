SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''101'' as categoria,case
when hbh.ben_his_metadata::json->>'PrimerNombre' is null then ' '
	 else hbh.ben_his_metadata::json->>'PrimerNombre'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union 
SELECT hbh.ben_his_con_id::int, (ben_his_id-subquery.ben_his_con_id::int)||''102'' as categoria,case
when hbh.ben_his_metadata::json->>'ApPaterno' is null then ' '
	 else hbh.ben_his_metadata::json->>'ApPaterno'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union 
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''103'' as categoria,case
when hbh.ben_his_metadata::json->>'ApMAterno' is null then ''
	 else hbh.ben_his_metadata::json->>'ApMAterno'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''104'' as categoria,case
when hbh.ben_his_metadata::json->>'Rut' is null then ''
	 else hbh.ben_his_metadata::json->>'Rut'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int, (ben_his_id-subquery.ben_his_con_id::int)||''105'' as categoria,case
when hbh.ben_his_metadata::json->>'Telefono' is null then ''
	 else hbh.ben_his_metadata::json->>'Telefono'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''106'' as categoria,case
when hbh.ben_his_metadata::json->>'Mail' is null then ''
	 else hbh.ben_his_metadata::json->>'Mail'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int, (ben_his_id-subquery.ben_his_con_id::int)||''107'' as categoria,case
when hbh.ben_his_metadata::json->>'FechaNacimiento' is null then ''
	 else hbh.ben_his_metadata::json->>'FechaNacimiento'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''108'' as categoria,case
when hbh.ben_his_metadata::json->>'Direccion' is null then ' '
	 else hbh.ben_his_metadata::json->>'Direccion'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''109'' as categoria,case
when hbh.ben_his_metadata::json->>'Ciudad' is null then ''
	 else hbh.ben_his_metadata::json->>'Ciudad'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''110'' as categoria,case
when hbh.ben_his_metadata::json->>'Comuna' is null then ''
	 else hbh.ben_his_metadata::json->>'Comuna'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''111'' as categoria,case
when hbh.ben_his_metadata::json->>'pro_valu_plan' is null then ''
	 else hbh.ben_his_metadata::json->>'pro_valu_plan'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''112'' as categoria,case
when hbh.ben_his_metadata::json->>'TipoTarjeta' is null then ''
	 else hbh.ben_his_metadata::json->>'TipoTarjeta'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''113'' as categoria,case
when hbh.ben_his_metadata::json->>'Parentesco' is null then ''
	 else hbh.ben_his_metadata::json->>'Parentesco'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
union
SELECT hbh.ben_his_con_id::int,(ben_his_id-subquery.ben_his_con_id::int)||''114'' as categoria,case
when hbh.ben_his_metadata::json->>'Porcentaje' is null then ''
	 else hbh.ben_his_metadata::json->>'Porcentaje'
end
FROM "Genesys".his_beneficiary_history hbh inner join (SELECT min(hbh.ben_his_id) as mini,hbh.ben_his_con_id
from "Genesys".his_beneficiary_history hbh
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
group by hbh.ben_his_con_id) as subquery on hbh.ben_his_con_id = subquery.ben_his_con_id
where hbh.ben_his_con_id <> ''{{dialer.con_id}}''
order by ben_his_con_id,categoria