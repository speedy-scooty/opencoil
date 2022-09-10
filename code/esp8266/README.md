# opencoil-paracity: code

### Description of Files
 * otastaImg - Offline ESP8266 webserver + captive portal + filesystem (iOS only atm)
 * otastaImg-close-button - The above, but with 'close' button, just like your Hotel/Train/Airport wifi ;) (iOS only atm)
 * paracity_gallery_v041 - Offline ESP8266 webserver + captive portal + filesystem hosting relevant files to reproduce all of this hardware and software (BROKEN)


### Prerequisites

This guide assumes you have a 4MB ESP12F microcontroller and use Arduino IDE.

* Board Manager: You will need to add the support for this board to your IDE (Arduino in this case), see: https://github.com/esp8266/Arduino
* SPIFFS: You will need to add SPIFFS file upload support to Arduino if you want to upload files to the ESP12F, see: https://github.com/esp8266/arduino-esp8266fs-plugin


### Uploading Data to SPIFFS
The website served on the ESP8266 lives in the 'data' folder inside the sketchyour sketch. To upload this data you need the 'Arduino ESP8266 filesystem uploader' plugin. Find it [here](https://github.com/esp8266/arduino-esp8266fs-plugin).
You will find the tool/function in Arduino > Tools > ESP8266 Sketch Data Upload (make sure the directory path is correct). Close the Serial Monitor prior to uploading data.


### Uploading Code
For ESP12F use the following settings in Arduino IDE

* Board: Generic ESP8266 Module
* Builtin Led: 2
* Upload Speed: 921600
* CPU Frequency: 80 MHz
* Crystal Frequency: 26MHz
* Flash Size: 4MB (FS:3MB OTA: ~512KB) 
* Flash Mode: DOUT
* Flash Frequency: 40MHz
* Reset Method: dtr (aka nodemcu)
* Debug port: Disabled
* Debug Level: none
* LwIP Variant: v2 Lower Memory
* VTables: Flash
* Exceptions: Legacy (new can return nullptr)
* Erase Flash: depends on if you want to change SSID, Files, or only Sketch
* Espressif FW: nonos-sdk 2.2.1+100 (190703)
* SSL Support: All SSL ciphers (most compatible)
* Port: depend if u are uploading Over The Air, or using a cable
* Programmer: AVRISP mkII


These settings give you about 2.471 KB of SPIFFS storage space for files and ~512KB sketch size


### Over The Air (OTA) Uploading 

* Connect to the hotspot created by the ESP12F.
* Launch Arduino, choose "esp at 192.168.4.1" as the port. 
* If you don't see the port listed in Arduino (Tools > Port), restart Arduino IDE.

You can upload your sketch and files wirelessly, there is one caveat: SPIFFS file uploads don't work with password protected uploads (line 42). Workaround: flash your sketch with line 42 commented out. Upload your files to SPIFFS, then uncomment the line and Upload the code.