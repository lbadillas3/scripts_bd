SELECT 
adi_his_metadata::JSON->>'Rut' as rut,
to_char((adi_his_metadata::JSON->>'FechaNacimiento')::date,'DD/MM/YYYY') as fechaNacimiento,
adi_his_metadata::JSON->>'Nombre' as nombre,
adi_his_metadata::JSON->>'ApPaterno' as apPaterno,
adi_his_metadata::JSON->>'ApMaterno' as apMaterno,
adi_his_metadata::JSON->>'Folio' as folio,
adi_his_metadata::JSON->>'Plan' as plan,
adi_his_metadata::JSON->>'Observacion' as observacion,
adi_his_metadata::JSON->>'CodigoConfirmacion' as codigoConfirmacion,
adi_his_metadata::JSON->>'Ramo' as ramo,
adi_his_metadata::JSON->>'pro_name_cam' as proNameCam,
adi_his_metadata::JSON->>'pro_cod_plan' as proCodPlan,
adi_his_metadata::JSON->>'pro_valu_plan' as proValuPlan,
adi_his_metadata::JSON->>'pro_cod_plan_sponsor' as proCodPlanSponsor,
adi_his_metadata::JSON->>'pro_sponsor' as proSponsor
FROM "Genesys".his_aditional_history
where adi_his_genesys_id  = '4'