SELECT numero_identificacion, nombre_completo, email, patente, id_modelo, ano, of3_prima_anual, of5_prima_anual, of8_prima_anual, of10_prima_anual, rut_persona
FROM cla_autofull.cla_auto_900_reg
where rut_persona = $1
