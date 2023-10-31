#!/bin/bash

# Checks to verify that the script is not running as root
if [[ $EUID -eq 0 ]]; then
   echo "THIS SCRIPT SHOULD NOT BE RUN AS ROOT."
   echo "EX:  ./kismetSetup.sh"
   exit 1
fi

#Collect User input
read -p "To collect Bluetooth, specifiy hci(x) interface (or press Enter for native 'hci0'): " BTRADIO
read -p "To collect WLAN, specifiy wlan(x) interface (or press Enter for native 'wlan0'):" WLAN
read -p "Specify absolute path to desired output directory (or press Enter for /home/${USER}/Documents/KismetCapture):" DIRECTORY


# Use default value "hci0" if the user presses Enter without typing anything
if [ -z "$BTRADIO" ]; then
  BTRADIO="hci0"
fi
# Use default value "wlan0" if the user presses Enter without typing anything
if [ -z "$WLAN" ]; then
  WLAN="wlan0"
fi
# Use default value "/home/${USER}/Documents/KismetCapture" if the user presses Enter without typing anything
if [ -z "$DIRECTORY" ]; then
  DIRECTORY="/home/${USER}/Documents/KismetCapture"
fi

clear
echo "Please confirm the following:"
echo "HCI Adatper:  $BTRADIO"
echo "WLAN Adapter:  $WLAN"
echo "Output Directory: $DIRECTORY"
echo " "
read -n 1 -r -s -p $'Press enter to continue if the values above are correct. Otherwise "Ctrl + c" to reenter...\n'

#Make output directory

mkdir $DIRECTORY 2> /dev/null

# Create backup of kismet_site.conf 
ts=$(date +%s)
sudo sh -c "mv /etc/kismet/kismet_site.conf /etc/kismet/kismet_site.conf.BAK.$ts 2> /dev/null"


# writes settings to /etc/kismet/kismet_site.conf
clear
sudo sh -c "echo '
#kismet_site.conf
#bluetooth
source=$BTRADIO:type=linuxbluetooth
#wifi
source=$WLAN:default_ht20=true:channel_hoprate=5/sec,type=linuxwifi
#gps
gps=gpsd:host=localhost,port=2947
#logging
log_prefix= $DIRECTORY
log_types=kismet' > /etc/kismet/kismet_site.conf"

#Print Results
echo 'Successfully created /etc/kismet/kismet_site.conf:'
echo "################################################## "
cat /etc/kismet/kismet_site.conf

echo "################################################## "
echo "Consider running the following:  sudo usermod -aG kismet ${USER}"
