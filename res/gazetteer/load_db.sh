#!/bin/sh


rethinkdb-import -f $1 -c $2 --format csv --delimiter '\t' --table geonames.geonames --no-header --custom-header geonameid,name,asciiname,alternatenames,latitude,longitude,feature_class,feature_code,country_code,cc2,admin1_code,admin2_code,admin3_code,admin4_code,population,elevation,dem,timezone,modification_date
