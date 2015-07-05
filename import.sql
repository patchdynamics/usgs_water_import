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
    turbidity numeric(4,1),
    turbitiy_quality character varying(1),
    cdom numeric(6,2),
    cdom_quality character varying(1),
    nitrate numeric(3,2),
    nitrate_quality character varying(1)
);

COPY haddam_timeseries_usgs_extended FROM '/Users/matthewxi/Documents/Projects/PrecipGeoStats/data/2012_2015_time_series/data.csv' DELIMITER ',' CSV;


ALTER TABLE haddam_timeseries_usgs_extended ADD COLUMN  timestamp timestamp;
ALTER TABLE haddam_timeseries_usgs_extended ADD COLUMN  month integer;
ALTER TABLE haddam_timeseries_usgs_extended ADD COLUMN  doc_concentration numeric(8,6);
ALTER TABLE haddam_timeseries_usgs_extended ADD COLUMN  doc_mass_flow numeric(11,4);

update haddam_timeseries_usgs_extended set timestamp = to_timestamp(datetime_string, 'YYYY-MM-DD HH24:MI');
update haddam_timeseries_usgs_extended set month = date_part('month', timestamp);
update haddam_timeseries_usgs_extended set doc_concentration = ( 0.0637 * cdom + 1.3189);
update haddam_timeseries_usgs_extended set doc_mass_flow = (discharge * 28.31 * doc_concentration);

