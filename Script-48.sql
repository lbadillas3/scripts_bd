CREATE OR REPLACE VIEW inbound_fidelizacion.sabana_fidelizacion
AS SELECT DISTINCT ON (hfh.for_his_genesys_id, (hih.inv_his_metadata ->> 'Folio'::text)) to_char(hih.inv_his_date_form, 'DD/MM/YYYY'::text) AS fecha,
    to_char(hih.inv_his_date_form, 'HH24:MI'::text) AS hora,
    hgh.ges_his_tipificacion_4 AS gestion,
    concat(hfh.for_his_metadata ->> 'PrimerNombre'::text, ' ', hfh.for_his_metadata ->> 'SegundoNombre'::text) AS nombre_cliente,
    concat(hfh.for_his_metadata ->> 'ApPaterno'::text, ' ', hfh.for_his_metadata ->> 'ApMaterno'::text) AS apellido_cliente,
    hfh.for_his_metadata ->> 'Rut'::text AS rut_cliente,
    hih.inv_his_metadata ->> 'Folio'::text AS folio,
    hih.inv_his_metadata ->> 'Ramo'::text AS ramo,
    hih.inv_his_metadata ->> 'MotivoEliminacion'::text AS "motivo de elimanacion",
    hih.inv_his_metadata ->> 'Opcion'::text AS opcion,
    (uu.use_name || ' ' || uu.use_appaterno  || ' ' || uu.use_apmaterno)::varchar AS ejecutivo
   FROM "Genesys".his_form_history hfh
     LEFT JOIN "Genesys".his_invoice_history hih ON hfh.for_his_genesys_id::text = hih.inv_his_genesys_id::text
     LEFT JOIN "Genesys".his_gestion_history hgh ON hfh.for_his_genesys_id::text = hgh.ges_his_genesys_id::text
     LEFT JOIN "Genesys".use_user uu ON hfh.for_his_use_id::text = uu.use_genesys_id::text
  WHERE (hfh.for_his_metadata ->> 'id_campana'::text) = 'd42b70f8-88b5-4bf4-aa37-7203a5c3d919'::text AND to_char(hih.inv_his_date_form, 'DD/MM/YYYY'::text) IS NOT NULL AND hfh.for_his_date_form::date >= '2021-11-02'::date;