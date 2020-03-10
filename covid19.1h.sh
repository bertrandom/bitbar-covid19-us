#!/bin/bash
# <bitbar.title>Coronavirus COVID-19 U.S. Cases</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Bertrand Fan</bitbar.author>
# <bitbar.author.github>bertrandom</bitbar.author.github>
# <bitbar.desc>Displays Coronavirus COVID-19 cases in the U.S.</bitbar.desc>
# <bitbar.image>https://github.com/bertrandom/bitbar-covid19-us/blob/master/screenshot.png</bitbar.image>
# <bitbar.dependencies>jq,tr</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/bertrandom/bitbar-covid19-us</bitbar.abouturl>
curl "https://services1.arcgis.com/0MSEUqKaxRlEPj5g/arcgis/rest/services/ncov_cases/FeatureServer/1/query?f=json&where=(Confirmed%20%3E%200)%20AND%20(Country_Region%3D%27US%27)&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&orderByFields=Confirmed%20desc%2CCountry_Region%20asc%2CProvince_State%20asc&outSR=102100&resultOffset=0&resultRecordCount=250&cacheHint=true" --silent > /tmp/covid19.json
echo -n "😷 "
cat /tmp/covid19.json | /usr/local/bin/jq '[.features[].attributes.Confirmed] | add' | tr -d '\n'
echo -n " 😳 "
cat /tmp/covid19.json | /usr/local/bin/jq '[.features[].attributes.Recovered] | add' | tr -d '\n'
echo -n " ⚰️ "
cat /tmp/covid19.json | /usr/local/bin/jq '[.features[].attributes.Deaths] | add'