#!/bin/bash
# <bitbar.title>Coronavirus COVID-19 U.S. Cases</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Bertrand Fan</bitbar.author>
# <bitbar.author.github>bertrandom</bitbar.author.github>
# <bitbar.desc>Displays Coronavirus COVID-19 cases in the U.S.</bitbar.desc>
# <bitbar.image>https://github.com/bertrandom/bitbar-covid19-us/blob/master/screenshot.png</bitbar.image>
# <bitbar.dependencies>jq,tr</bitbar.dependencies>
# <bitbar.abouturl>https://github.com/bertrandom/bitbar-covid19-us</bitbar.abouturl>
COVID_DATA_DIR="/Users/bert/code/COVID-19/"
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH'
cd $COVID_DATA_DIR
git pull --rebase > /dev/null 2>&1
cd "$COVID_DATA_DIR"csse_covid_19_data/csse_covid_19_daily_reports
FILE=$(date +"%m-%d-%Y".csv)
if [ ! -f "$FILE" ]; then
    FILE=$(date -v -1d +"%m-%d-%Y".csv)
fi
xsv search -s 2 'US' "$FILE" | xsv select 4,6,5 | xsv stats | xsv select 3 | tail -n 3 > /tmp/covid19.txt
echo -n "😷 "
cat /tmp/covid19.txt | sed -n 1,1p | tr -d '\n'
echo -n " 😳 "
cat /tmp/covid19.txt | sed -n 2,2p | tr -d '\n'
echo -n " ⚰️ "
cat /tmp/covid19.txt | sed -n 3,3p