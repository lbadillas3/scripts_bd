SELECT con_id, id_interaction, cod_plan, num_servicio, fecha_carga
FROM chubb.log_altas_car_cla_hsp
where con_id like '746198'


20211102
20220114


-- Drop table

-- DROP TABLE "Genesys".bra_model;

CREATE TABLE bci_full.color_auto (
	ban_id_cam varchar NULL,
	ban_desc varchar NULL,
	ban_desc_id varchar NULL,
	ba_desc_cam varchar NULL
)

CREATE TABLE bci_full.color_auto (
	col_id_cam varchar NULL,
	col_desc varchar NULL,
	col_desc_id varchar NULL,
	col_desc_cam varchar NULL
);

CREATE TABLE bci_full.deducible (
	id_deducible varchar NULL,
	deducible varchar NULL,
	id_campana varchar NULL
);
