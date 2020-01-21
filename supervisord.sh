#!/bin/sh
FIRSTRUN=1
MACADDRESS=`cat /sys/class/net/eth0/address`
SETHOSTNAME=`cat /etc/hostname`
echo "127.0.0.1 ${SETHOSTNAME}" >> /etc/hosts

until [ -f /var/luxion_flexlm/license.lic ]
do
    if [ "$FIRSTRUN" -eq "1" ]; then
        FIRSTRUN=0
        echo "\nNeeded for license file:"
        echo "MAC Address: ${MACADDRESS}"
        echo "Hostname: ${SETHOSTNAME}"
        echo "\nLicense file not found in the volume."
        echo "Expecting license file /var/luxion_flexlm/license.lic\n"
        echo "Waiting for file to exist...\n"
    fi
     sleep 1
done
echo "License file found, starting license server...\n"
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf