--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: haddam_timeseries_usgs; Type: TABLE; Schema: public; Owner: matthewxi; Tablespace: 
--

CREATE TABLE haddam_timeseries_usgs_extended (
    agency character varying(40),
    site_no character varying(40),
    datetime_string character varying(40),
    timezone character varying(40),
		doxygen numeric(3,1),
		doxygen_quality character varying(1),
		ph numeric(2,1),
		ph_quality character varying(1),
		conductance numeric(3,0),
		conductance_quality character varying(1),
    discharge numeric(7,1),
    discharge_quality character varying(1),
		turbidity numeric(3,1),
		turbitiy_quality character varying(1),
    cdom numeric(6,2),
    cdom_quality character varying(1),
		nitrate numeric(3,2),
		nitrate_quality character varying(1),
    "timestamp" timestamp without time zone,
    month integer,
    doc_concentration numeric(8,6),
    doc_mass_flow numeric(10,4)

);


ALTER TABLE public.haddam_timeseries_usgs_extended OWNER TO matthewxi;

--
-- PostgreSQL database dump complete
--

