SELECT campana_id, venta_id, "date", id_unico, agente_id, update_date, mdata
FROM dw_nuevo.dw_ventas
where mdata::json->>'cod_venta' in ('16392')
