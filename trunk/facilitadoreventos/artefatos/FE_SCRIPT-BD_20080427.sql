-- SQL Manager 2007 Lite for PostgreSQL 4.3.0.4
-- ---------------------------------------
-- Host      : localhost
-- Database  : fe_bd
-- Version   : PostgreSQL 8.3.0, compiled by Visual C++ build 1400


--
-- Definition for language plpgsql (OID = 16386) : 
--
CREATE TRUSTED PROCEDURAL LANGUAGE plpgsql
   HANDLER "plpgsql_call_handler"
;
SET check_function_bodies = false;
--
-- Definition for type breakpoint (OID = 16405) : 
--
SET search_path = public, pg_catalog;
CREATE TYPE public.breakpoint AS (
  func oid,
  linenumber integer,
  targetname text
);
--
-- Definition for type frame (OID = 16408) : 
--
CREATE TYPE public.frame AS (
  "level" integer,
  targetname text,
  func oid,
  linenumber integer,
  args text
);
--
-- Definition for type targetinfo (OID = 16411) : 
--
CREATE TYPE public.targetinfo AS (
  target oid,
  "schema" oid,
  nargs integer,
  argtypes oidvector,
  targetname name,
  argmodes "char"[],
  argnames text[],
  targetlang oid,
  fqname text,
  returnsset boolean,
  returntype oid
);
--
-- Definition for type var (OID = 16414) : 
--
CREATE TYPE public.var AS (
  name text,
  varclass character(1),
  linenumber integer,
  isunique boolean,
  isconst boolean,
  isnotnull boolean,
  dtype oid,
  value text
);
--
-- Definition for type proxyinfo (OID = 16417) : 
--
CREATE TYPE public.proxyinfo AS (
  serverversionstr text,
  serverversionnum integer,
  proxyapiver integer,
  serverprocessid integer
);
--
-- Definition for function plpgsql_oid_debug (OID = 16418) : 
--
CREATE FUNCTION public.plpgsql_oid_debug (functionoid oid) RETURNS integer
AS '$libdir/plugins/plugin_debugger', 'plpgsql_oid_debug'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_abort_target (OID = 16419) : 
--
CREATE FUNCTION public.pldbg_abort_target (session integer) RETURNS SETOF boolean
AS '$libdir/pldbgapi', 'pldbg_abort_target'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_attach_to_port (OID = 16420) : 
--
CREATE FUNCTION public.pldbg_attach_to_port (portnumber integer) RETURNS integer
AS '$libdir/pldbgapi', 'pldbg_attach_to_port'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_continue (OID = 16421) : 
--
CREATE FUNCTION public.pldbg_continue (session integer) RETURNS breakpoint
AS '$libdir/pldbgapi', 'pldbg_continue'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_create_listener (OID = 16422) : 
--
CREATE FUNCTION public.pldbg_create_listener () RETURNS integer
AS '$libdir/pldbgapi', 'pldbg_create_listener'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_deposit_value (OID = 16423) : 
--
CREATE FUNCTION public.pldbg_deposit_value (session integer, varname text, linenumber integer, value text) RETURNS boolean
AS '$libdir/pldbgapi', 'pldbg_deposit_value'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_drop_breakpoint (OID = 16424) : 
--
CREATE FUNCTION public.pldbg_drop_breakpoint (session integer, func oid, linenumber integer) RETURNS boolean
AS '$libdir/pldbgapi', 'pldbg_drop_breakpoint'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_breakpoints (OID = 16425) : 
--
CREATE FUNCTION public.pldbg_get_breakpoints (session integer) RETURNS SETOF breakpoint
AS '$libdir/pldbgapi', 'pldbg_get_breakpoints'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_source (OID = 16426) : 
--
CREATE FUNCTION public.pldbg_get_source (session integer, func oid) RETURNS text
AS '$libdir/pldbgapi', 'pldbg_get_source'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_stack (OID = 16427) : 
--
CREATE FUNCTION public.pldbg_get_stack (session integer) RETURNS SETOF frame
AS '$libdir/pldbgapi', 'pldbg_get_stack'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_proxy_info (OID = 16428) : 
--
CREATE FUNCTION public.pldbg_get_proxy_info () RETURNS proxyinfo
AS '$libdir/pldbgapi', 'pldbg_get_proxy_info'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_variables (OID = 16429) : 
--
CREATE FUNCTION public.pldbg_get_variables (session integer) RETURNS SETOF var
AS '$libdir/pldbgapi', 'pldbg_get_variables'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_select_frame (OID = 16430) : 
--
CREATE FUNCTION public.pldbg_select_frame (session integer, frame integer) RETURNS breakpoint
AS '$libdir/pldbgapi', 'pldbg_select_frame'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_set_breakpoint (OID = 16431) : 
--
CREATE FUNCTION public.pldbg_set_breakpoint (session integer, func oid, linenumber integer) RETURNS boolean
AS '$libdir/pldbgapi', 'pldbg_set_breakpoint'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_set_global_breakpoint (OID = 16432) : 
--
CREATE FUNCTION public.pldbg_set_global_breakpoint (session integer, func oid, linenumber integer, targetpid integer) RETURNS boolean
AS '$libdir/pldbgapi', 'pldbg_set_global_breakpoint'
    LANGUAGE c;
--
-- Definition for function pldbg_step_into (OID = 16433) : 
--
CREATE FUNCTION public.pldbg_step_into (session integer) RETURNS breakpoint
AS '$libdir/pldbgapi', 'pldbg_step_into'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_step_over (OID = 16434) : 
--
CREATE FUNCTION public.pldbg_step_over (session integer) RETURNS breakpoint
AS '$libdir/pldbgapi', 'pldbg_step_over'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_wait_for_breakpoint (OID = 16435) : 
--
CREATE FUNCTION public.pldbg_wait_for_breakpoint (session integer) RETURNS breakpoint
AS '$libdir/pldbgapi', 'pldbg_wait_for_breakpoint'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_wait_for_target (OID = 16436) : 
--
CREATE FUNCTION public.pldbg_wait_for_target (session integer) RETURNS integer
AS '$libdir/pldbgapi', 'pldbg_wait_for_target'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_target_info (OID = 16437) : 
--
CREATE FUNCTION public.pldbg_get_target_info (signature text, targettype "char") RETURNS targetinfo
AS '$libdir/targetinfo', 'pldbg_get_target_info'
    LANGUAGE c STRICT;
--
-- Definition for function plpgsql_oid_debug (OID = 16418) : 
--
CREATE FUNCTION public.plpgsql_oid_debug (functionoid oid) RETURNS integer
AS '$libdir/plugins/plugin_debugger', 'plpgsql_oid_debug'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_abort_target (OID = 16419) : 
--
CREATE FUNCTION public.pldbg_abort_target (session integer) RETURNS SETOF boolean
AS '$libdir/pldbgapi', 'pldbg_abort_target'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_attach_to_port (OID = 16420) : 
--
CREATE FUNCTION public.pldbg_attach_to_port (portnumber integer) RETURNS integer
AS '$libdir/pldbgapi', 'pldbg_attach_to_port'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_continue (OID = 16421) : 
--
CREATE FUNCTION public.pldbg_continue (session integer) RETURNS breakpoint
AS '$libdir/pldbgapi', 'pldbg_continue'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_create_listener (OID = 16422) : 
--
CREATE FUNCTION public.pldbg_create_listener () RETURNS integer
AS '$libdir/pldbgapi', 'pldbg_create_listener'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_deposit_value (OID = 16423) : 
--
CREATE FUNCTION public.pldbg_deposit_value (session integer, varname text, linenumber integer, value text) RETURNS boolean
AS '$libdir/pldbgapi', 'pldbg_deposit_value'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_drop_breakpoint (OID = 16424) : 
--
CREATE FUNCTION public.pldbg_drop_breakpoint (session integer, func oid, linenumber integer) RETURNS boolean
AS '$libdir/pldbgapi', 'pldbg_drop_breakpoint'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_breakpoints (OID = 16425) : 
--
CREATE FUNCTION public.pldbg_get_breakpoints (session integer) RETURNS SETOF breakpoint
AS '$libdir/pldbgapi', 'pldbg_get_breakpoints'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_source (OID = 16426) : 
--
CREATE FUNCTION public.pldbg_get_source (session integer, func oid) RETURNS text
AS '$libdir/pldbgapi', 'pldbg_get_source'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_stack (OID = 16427) : 
--
CREATE FUNCTION public.pldbg_get_stack (session integer) RETURNS SETOF frame
AS '$libdir/pldbgapi', 'pldbg_get_stack'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_proxy_info (OID = 16428) : 
--
CREATE FUNCTION public.pldbg_get_proxy_info () RETURNS proxyinfo
AS '$libdir/pldbgapi', 'pldbg_get_proxy_info'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_variables (OID = 16429) : 
--
CREATE FUNCTION public.pldbg_get_variables (session integer) RETURNS SETOF var
AS '$libdir/pldbgapi', 'pldbg_get_variables'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_select_frame (OID = 16430) : 
--
CREATE FUNCTION public.pldbg_select_frame (session integer, frame integer) RETURNS breakpoint
AS '$libdir/pldbgapi', 'pldbg_select_frame'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_set_breakpoint (OID = 16431) : 
--
CREATE FUNCTION public.pldbg_set_breakpoint (session integer, func oid, linenumber integer) RETURNS boolean
AS '$libdir/pldbgapi', 'pldbg_set_breakpoint'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_set_global_breakpoint (OID = 16432) : 
--
CREATE FUNCTION public.pldbg_set_global_breakpoint (session integer, func oid, linenumber integer, targetpid integer) RETURNS boolean
AS '$libdir/pldbgapi', 'pldbg_set_global_breakpoint'
    LANGUAGE c;
--
-- Definition for function pldbg_step_into (OID = 16433) : 
--
CREATE FUNCTION public.pldbg_step_into (session integer) RETURNS breakpoint
AS '$libdir/pldbgapi', 'pldbg_step_into'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_step_over (OID = 16434) : 
--
CREATE FUNCTION public.pldbg_step_over (session integer) RETURNS breakpoint
AS '$libdir/pldbgapi', 'pldbg_step_over'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_wait_for_breakpoint (OID = 16435) : 
--
CREATE FUNCTION public.pldbg_wait_for_breakpoint (session integer) RETURNS breakpoint
AS '$libdir/pldbgapi', 'pldbg_wait_for_breakpoint'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_wait_for_target (OID = 16436) : 
--
CREATE FUNCTION public.pldbg_wait_for_target (session integer) RETURNS integer
AS '$libdir/pldbgapi', 'pldbg_wait_for_target'
    LANGUAGE c STRICT;
--
-- Definition for function pldbg_get_target_info (OID = 16437) : 
--
CREATE FUNCTION public.pldbg_get_target_info (signature text, targettype "char") RETURNS targetinfo
AS '$libdir/targetinfo', 'pldbg_get_target_info'
    LANGUAGE c STRICT;
--
-- Structure for table evento (OID = 24585) : 
--
CREATE TABLE public.evento (
    id integer NOT NULL,
    nome character varying(50),
    "local" character varying(50),
    data_hora timestamp(0) without time zone,
    responsavel character varying(50)
);
--
-- Structure for table promocao (OID = 24590) : 
--
CREATE TABLE public.promocao (
    id integer NOT NULL,
    id_evento integer,
    data_hora_inicial timestamp(0) without time zone,
    data_hora_final timestamp(0) without time zone,
    descricao character varying(100),
    img bytea,
    titulo character varying(50)
);
--
-- Structure for table propaganda (OID = 24598) : 
--
CREATE TABLE public.propaganda (
    id integer NOT NULL,
    id_evento integer,
    data_hora_inicial timestamp(0) without time zone,
    data_hora_final timestamp(0) without time zone,
    descricao text,
    prioridade integer
);
--
-- Structure for table usuario (OID = 24615) : 
--
CREATE TABLE public.usuario (
    id integer NOT NULL,
    nome character varying(50),
    login character varying(10),
    senha character varying(20)
);
--
-- Structure for table evento_usuario (OID = 24620) : 
--
CREATE TABLE public.evento_usuario (
    id_evento integer NOT NULL,
    id_usuario integer NOT NULL
);
--
-- Structure for table mapa (OID = 24679) : 
--
CREATE TABLE public.mapa (
    id integer NOT NULL,
    id_evento integer,
    img bytea
);
--
-- Structure for table programacao (OID = 24687) : 
--
CREATE TABLE public.programacao (
    id integer NOT NULL,
    id_evento integer,
    "local" character varying(50),
    data_hora timestamp(0) without time zone,
    responsavel character varying(45),
    conteudo text,
    id_tipo_atividade integer
);
--
-- Structure for table tipo_atividade (OID = 24705) : 
--
CREATE TABLE public.tipo_atividade (
    id integer NOT NULL,
    descricao text
);
--
-- Definition for index evento_pkey (OID = 24588) : 
--
ALTER TABLE ONLY evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id);
--
-- Definition for index promocao_pkey (OID = 24606) : 
--
ALTER TABLE ONLY promocao
    ADD CONSTRAINT promocao_pkey PRIMARY KEY (id);
--
-- Definition for index propaganda_pkey (OID = 24613) : 
--
ALTER TABLE ONLY propaganda
    ADD CONSTRAINT propaganda_pkey PRIMARY KEY (id);
--
-- Definition for index usuario_pkey (OID = 24618) : 
--
ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
--
-- Definition for index evento_usuario_pkey (OID = 24657) : 
--
ALTER TABLE ONLY evento_usuario
    ADD CONSTRAINT evento_usuario_pkey PRIMARY KEY (id_evento, id_usuario);
--
-- Definition for index evento_id (OID = 24659) : 
--
ALTER TABLE ONLY promocao
    ADD CONSTRAINT evento_id FOREIGN KEY (id_evento) REFERENCES evento(id);
--
-- Definition for index evento_id (OID = 24664) : 
--
ALTER TABLE ONLY propaganda
    ADD CONSTRAINT evento_id FOREIGN KEY (id_evento) REFERENCES evento(id);
--
-- Definition for index evento_id (OID = 24669) : 
--
ALTER TABLE ONLY evento_usuario
    ADD CONSTRAINT evento_id FOREIGN KEY (id_evento) REFERENCES evento(id);
--
-- Definition for index usuario_id (OID = 24674) : 
--
ALTER TABLE ONLY evento_usuario
    ADD CONSTRAINT usuario_id FOREIGN KEY (id_usuario) REFERENCES usuario(id);
--
-- Definition for index mapa_pkey (OID = 24685) : 
--
ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);
--
-- Definition for index programacao_pkey (OID = 24690) : 
--
ALTER TABLE ONLY programacao
    ADD CONSTRAINT programacao_pkey PRIMARY KEY (id);
--
-- Definition for index evento_id (OID = 24692) : 
--
ALTER TABLE ONLY programacao
    ADD CONSTRAINT evento_id FOREIGN KEY (id_evento) REFERENCES evento(id);
--
-- Definition for index evento_id (OID = 24697) : 
--
ALTER TABLE ONLY mapa
    ADD CONSTRAINT evento_id FOREIGN KEY (id_evento) REFERENCES evento(id);
--
-- Definition for index tipo_atividade_pkey (OID = 24711) : 
--
ALTER TABLE ONLY tipo_atividade
    ADD CONSTRAINT tipo_atividade_pkey PRIMARY KEY (id);
--
-- Definition for index tipo_atividade_id (OID = 24713) : 
--
ALTER TABLE ONLY programacao
    ADD CONSTRAINT tipo_atividade_id FOREIGN KEY (id_tipo_atividade) REFERENCES tipo_atividade(id);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
