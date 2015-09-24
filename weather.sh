#!/bin/bash

# https://api.forecast.io/forecast/APIKEY/LATITUDE,LONGITUDE,TIME
# https://api.forecast.io/forecast/81575ee5c44342354f213716dd4dcd1c/37.8267,-122.423,1443107082?exclude=minutely,hourly,daily,alerts,flags
 # http://stackoverflow.com/questions/25567160/shell-scripts-to-get-geolocations-from-google


APIKEY=81575ee5c44342354f213716dd4dcd1c
LATITUDE=41.9839
LONGITUDE=-73.9972
TIME=`date +%s`
EXCLUDE="exclude=minutely,hourly,daily,alerts,flags"

RESPONSE=`curl https://api.forecast.io/forecast/$APIKEY/$LATITUDE,$LONGITUDE,$TIME?$EXCLUDE`

echo $RESPONSE


