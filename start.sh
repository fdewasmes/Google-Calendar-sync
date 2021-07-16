cd /home/pi/smile-calendar-export
FILE=../MagicMirror/modules/MMM-HTMLBox/smile-cal.html
if test -f "$FILE"; then
    rm $FILE
fi
venv/bin/python3 querycalendar.py > $FILE