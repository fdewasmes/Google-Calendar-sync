This python script allows me to get next events from my professional calendar and have them available as an HTML snippet to display on my MagicMirror installation.

to install you can read 
https://developers.google.com/calendar/api/quickstart/python

or follow instructions:

```sh
pip install virtualenv
virtualenv <your-env>
source <your-env>/bin/activate
<your-env>/bin/pip install --upgrade \
google-api-python-client \
google-auth-httplib2 \
google-auth-oauthlib
```
do any modification needed on the first wto lines of `start.sh` script to adapt it for your paths.

```sh
cd /home/pi/smile-calendar-export
FILE=../MagicMirror/modules/MMM-HTMLBox/smile-cal.html
```

create a crontab using `crontab -e` and add this 

```
*/10 * * * * /home/pi/smile-calendar-export/start.sh > /tmp/cronlog.txt 2>&1
````
