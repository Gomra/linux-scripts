#!/bin/bash
LOGDATEI=/tmp/touchlog.log
/usr/bin/synclient TapButton2=2
/usr/bin/synclient TapButton3=3

echo `date` > $LOGDATEI
echo "Touchpad settings modified" >> $LOGDATEI

exit 0
