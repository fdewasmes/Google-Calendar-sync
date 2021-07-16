This python script allows me to get next events from my professional calendar and have them available as an HTML snippet to display on my MagicMirror installation.

to install you can read 
[https://developers.google.com/calendar/api/quickstart/python](https://developers.google.com/calendar/api/quickstart/python)

or follow instructions:

1. You need a Google Cloud Platform project with the API enabled. To create a project and enable an API, refer to 
[Create a project and enable the API](https://developers.google.com/workspace/guides/create-project) 
Note: For this quickstart, you are enabling the "Google Calendar API".

2. Authorization credentials for a desktop application. To learn how to create credentials for a desktop application, refer to [Create credentials](https://developers.google.com/workspace/guides/create-credentials).
3. install environment

```sh
pip install virtualenv
virtualenv <your-env>
source <your-env>/bin/activate
<your-env>/bin/pip install --upgrade \
google-api-python-client \
google-auth-httplib2 \
google-auth-oauthlib
```
4. do any modification needed on the first wto lines of `start.sh` script to adapt it for your paths. 

```sh
cd /home/pi/smile-calendar-export
FILE=../MagicMirror/modules/MMM-HTMLBox/smile-cal.html
```
5. Test your modification by launching the script:

```sh
chmod +x start.sh
start.sh
```

6. create a crontab using `crontab -e` and add this 

```
*/10 * * * * /home/pi/smile-calendar-export/start.sh > /tmp/cronlog.txt 2>&1
````

to display the calendar, install https://github.com/ulrichwisser/MMM-HTMLBox on your MagicMirror install and add this configuration to your `config.js` file:
```json
{
   module: "MMM-HTMLBox",
   position:"bottom_right",
   config: {
     width: "100%",
     height: "250px",
     refresh_interval_sec: 300,
     content: "",
     file: "smile-cal.html",
     }
},
```
