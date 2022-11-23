  #include <Arduino.h>
  #include <ESP8266WiFi.h>
  #include <ESP8266mDNS.h>
  #include <WiFiUdp.h>
  #include <ArduinoOTA.h> // Over-the-Air updates
  #include <ESP8266WebServer.h>
  #include "./DNSServer.h" // Dns server

  DNSServer dnsServer;
  const byte DNS_PORT = 53;
  
  ESP8266WebServer server(80);

  #ifndef STASSID
  #define STASSID "music" // ssid of wifi access point
  //#define STASPSK "mypassword" // password of wifi access point
  #endif

  IPAddress apIP(192, 168, 4, 1); // ip address of access point ('router')
  const char* ssid = STASSID;
  //const char* password = STAPSK; // disable encryption


#include "AudioFileSourceSPIFFS.h"
#include "AudioFileSourceID3.h"
#include "AudioGeneratorMP3.h"
#include "AudioOutputI2SNoDAC.h"

// To run, set your ESP8266 build to 160MHz, and include a SPIFFS of 512KB or greater.
// Use the "Tools->ESP8266/ESP32 Sketch Data Upload" menu to write the MP3 to SPIFFS
// Then upload the sketch normally.  

// pno_cs from https://ccrma.stanford.edu/~jos/pasp/Sound_Examples.html

AudioGeneratorMP3 *mp3;
AudioFileSourceSPIFFS *file;
AudioOutputI2SNoDAC *out;
AudioFileSourceID3 *id3;


// Called when a metadata event occurs (i.e. an ID3 tag, an ICY block, etc.
void MDCallback(void *cbData, const char *type, bool isUnicode, const char *string)
{
  (void)cbData;
  Serial.printf("ID3 callback for: %s = '", type);

  if (isUnicode) {
    string += 2;
  }
  
  while (*string) {
    char a = *(string++);
    if (isUnicode) {
      string++;
    }
    Serial.printf("%c", a);
  }
  Serial.printf("'\n");
  Serial.flush();
}

String getContentType(String filename){
  if(server.hasArg("download")) return "application/octet-stream";
  else if(filename.endsWith(".htm")) return "text/html";
  else if(filename.endsWith(".html")) return "text/html";
  else if(filename.endsWith(".css")) return "text/css";
  else if(filename.endsWith(".js")) return "application/javascript";
  else if(filename.endsWith(".png")) return "image/png";
  else if(filename.endsWith(".gif")) return "image/gif";
  else if(filename.endsWith(".jpg")) return "image/jpeg";
  else if(filename.endsWith(".ico")) return "image/x-icon";
  else if(filename.endsWith(".xml")) return "text/xml";
  else if(filename.endsWith(".mp4")) return "video/mp4";
  else if(filename.endsWith(".pdf")) return "application/x-pdf";
  else if(filename.endsWith(".zip")) return "application/x-zip";
  else if(filename.endsWith(".gz")) return "application/x-gzip";
  return "text/plain";
}

//Given a file path, look for it in the SPIFFS file storage. Returns true if found, returns false if not found.
bool handleFileRead(String path){
  if(path.endsWith("/")) path += "index.html";
  String contentType = getContentType(path);
  String pathWithGz = path + ".gz";
  if(SPIFFS.exists(pathWithGz) || SPIFFS.exists(path)){
    if(SPIFFS.exists(pathWithGz))
      path += ".gz";
    File file = SPIFFS.open(path, "r");
    size_t sent = server.streamFile(file, contentType);
    file.close();
    return true;
  }
  return false;
}

void setup()
{
      Serial.begin(115200);
    Serial.println("Booting");

    WiFi.mode(WIFI_AP);
    WiFi.softAPConfig(apIP, apIP, IPAddress(255, 255, 255, 0));
    WiFi.softAP(ssid);
    dnsServer.start(DNS_PORT, "*", apIP); // redirect dns request to AP ip
    
    MDNS.begin("esp8266", WiFi.softAPIP());
    Serial.println("Ready");
    Serial.print("IP address: ");
    Serial.println(WiFi.softAPIP());

    //Over-the-Air updates
    ArduinoOTA.setHostname("ESP8266"); // allow apple devices to connect to http://ESP8266.local to visit the contents
    //ArduinoOTA.setPassword("change-me"); // enabling password disables SPIFFS upload
    ArduinoOTA.begin();
    SPIFFS.begin();

     //redirect all traffic to index.html
  server.onNotFound([]() {
    if(!handleFileRead(server.uri())){
      const char *metaRefreshStr = "<head><meta http-equiv=\"refresh\" content=\"0; url=http://192.168.4.1/index.html\" /></head><body><p>redirecting...</p></body>";
      server.send(200, "text/html", metaRefreshStr);
    }
  });
  
    server.begin();

  audioLogger = &Serial;
  file = new AudioFileSourceSPIFFS("/pno-cs.mp3");
  id3 = new AudioFileSourceID3(file);
  id3->RegisterMetadataCB(MDCallback, (void*)"ID3TAG");
  out = new AudioOutputI2SNoDAC();
  mp3 = new AudioGeneratorMP3();
  mp3->begin(id3, out);
}

void loop()
{
       dnsServer.processNextRequest();
    ArduinoOTA.handle();
    server.handleClient();
    delay(50);
   while(mp3->loop());
  
}
