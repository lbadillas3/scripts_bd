SELECT nregion, sregion
FROM cardif_coopeuch.regcomciu
group by nregion,sregion;


select nregion ,nciudad, sciudad, ncomuna ,scomuna 
FROM cardif_coopeuch.regcomciu
group by nregion ,nciudad,sciudad,ncomuna ,scomuna ;