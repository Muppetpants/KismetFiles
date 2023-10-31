# KismetFiles
Bash script to create kismet_site.conf override file and write output to desired directory.


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

Add user input for ```VPS IPv4 Address```

Add user input for ```VPS SSH Port```

Add user input for ```VPS Username```

```Press enter if settings are correct. ```
