# KismetFiles
Bash script to create kismet_site.conf override file and write output to desired directory. Script will create /etc/kismet/kismet_site.conf file with user input, create the output directory if not already created, and make a backup copy of the existing /etc/kismet/kismet_site.conf file within the /etc/kismet directory.


Create a local copy of the script.

```wget https://raw.githubusercontent.com/Muppetpants/KismetFiles/main/kismetSetup.sh```

Make the script executable

```sudo chmod +x kismetSetup.sh```

# Important: Ensure the desired wlan Interface is in standard (managed) mode). Kismet will set the adapter to monitor mode. 

Run the script

```sudo ./kismetSetup.sh```

Add user input for ```hci Interface```

Add user input for ```wlan Interface```

Add user input for ```Output directory```

```Press enter if settings are correct. ```
