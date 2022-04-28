CREATE SCHEMA almamedis;

CREATE TABLE almamedis.cam_product_type (
	pro_typ_id serial4 NOT NULL,
	pro_typ_name varchar(150),
	pro_typ_user varchar(150),
	type_campana varchar(150),
	id_campana varchar(150),
	desc_campana varchar(150),
	CONSTRAINT cam_product_type_pk PRIMARY KEY (pro_typ_id)
)

CREATE TABLE almamedis.cam_result_type (
	result_typ_id serial4 NOT NULL,
	result_typ_name varchar(150),
	result_typ_name_product varchar(150),
	result_typ_selec varchar(150),
	typ_result varchar(150),
	typ_campana varchar(150),
	id_campana varchar(150),
	desc_campana varchar(150),
	CONSTRAINT cam_result_type_pk PRIMARY KEY (result_typ_id)
)

ALTER TABLE almamedis.cam_product_type ADD COLUMN desc_type_agent varchar(150)


ALTER TABLE almamedis.cam_product_type DROP COLUMN desc_type_agent;

CREATE TABLE almamedis.his_form_history (
	for_his_id int4 NOT NULL DEFAULT nextval('almamedis.his_historial_formulario_his_for_id_seq'::regclass),
	for_his_con_id varchar NOT NULL,
	for_his_metadata json NOT NULL,
	for_his_genesys_id varchar NOT NULL,
	for_his_date_form timestamp NOT NULL,
	for_his_use_id varchar NOT NULL,
	for_his_lis_id int4 NOT NULL,
	CONSTRAINT his_form_history_pk PRIMARY KEY (for_his_id)
);

create trigger assignments_quality after
insert
    or
update
    on
    almamedis.his_form_history for each row execute function calidad_app.function_pass_quality();


CREATE SEQUENCE almamedis.his_historial_formulario_his_for_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;


-----

CREATE TABLE almamedis.his_type_modal_history (
	ben_his_id int4 NOT NULL DEFAULT nextval('almamedis.his_historial_formulario_his_for_id_seq'::regclass),
	ben_his_con_id varchar NOT NULL,
	ben_his_metadata json NOT NULL,
	ben_his_genesys_id varchar NOT NULL,
	ben_his_date_form timestamp NOT NULL,
	ben_his_use_id varchar NULL,
	ben_his_lis_id int4 NOT NULL,
	CONSTRAINT his_beneficiary_history_pk PRIMARY KEY (ben_his_id)
);

create trigger his_type_modal_history_log_trigger after
insert
    or
update
    on
    almamedis.his_type_modal_history for each row execute function almamedis.his_type_modal_history_log_function_backup();
   
-----
CREATE TABLE almamedis.res_json_form (
	jso_for_id serial4 NOT NULL,
	jso_for_date timestamp NOT NULL,
	jso_for_metadata json NOT NULL,
	jso_for_response varchar(200) NOT NULL,
	CONSTRAINT res_json_form_pk PRIMARY KEY (jso_for_id)
);

create trigger his_form_history_insert_trigger after
insert
    on
    almamedis.res_json_form for each row execute function almamedis.his_form_history_insert_trigger_fnc();

-----------------

CREATE TABLE almamedis.res_json_type_modal (
	jso_ben_id serial4 NOT NULL,
	jso_ben_date timestamp NOT NULL,
	jso_ben_metadata json NOT NULL,
	jso_ben_response varchar(200) NOT NULL,
	CONSTRAINT res_json_beneficiary_pk PRIMARY KEY (jso_ben_id)
);

create trigger his_type_modal_history_insert_trigger after
insert
    on
    almamedis.res_json_type_modal for each row execute function almamedis.his_type_modal_history_insert_trigger_fnc();
