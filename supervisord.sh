#!/bin/sh
FIRSTRUN=1
until [ -f /var/luxion_flexlm/license.lic ]
do
    if [ "$FIRSTRUN" -eq "1" ]; then
        FIRSTRUN=0
        echo "\nLicense file not found in the volume."
        echo "Expecting license file /var/luxion_flexlm/license.lic\n"
        echo "Waiting for file to exist...\n"
    fi
     sleep 1
done
echo "License file found, starting license server...\n"
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf