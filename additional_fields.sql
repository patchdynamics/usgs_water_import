ALTER TABLE haddam_timeseries_usgs_extended ADD COLUMN  timestamp timestamp;
ALTER TABLE haddam_timeseries_usgs_extended ADD COLUMN  month integer;
ALTER TABLE haddam_timeseries_usgs_extended ADD COLUMN  doc_concentration numeric(8,6);
ALTER TABLE haddam_timeseries_usgs_extended ADD COLUMN  doc_mass_flow numeric(11,4);

update haddam_timeseries_usgs_extended set timestamp = to_timestamp(datetime_string, 'YYYY-MM-DD HH24:MI');
update haddam_timeseries_usgs_extended set month = date_part('month', timestamp);
update haddam_timeseries_usgs_extended set doc_concentration = ( 0.0637 * cdom + 1.3189);
update haddam_timeseries_usgs_extended set doc_mass_flow = (discharge * 28.31 * doc_concentration);

