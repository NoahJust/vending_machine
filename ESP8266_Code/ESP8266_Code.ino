#include <ESP8266WiFi.h>

WiFiServer wifiServer (80);

const char* ssid = "****";                    //Nom du WiFi
const char* password = "****";    //Mot de Passe du WiFi


void setup() {
  Serial.begin(115200);

  delay(10);

  WiFi.begin(ssid, password);       //Se connecte au WiFi

  WiFi.begin(ssid, password);
  IPAddress ip(192, 168, 1, 147);       //L'ip sera tout le temps 192.168.1.147
  IPAddress gateway(192, 168, 1, 1);
  IPAddress subnet(255, 255, 255, 0);
  WiFi.config(ip, gateway, subnet);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print("*");
  }
  Serial.println("");
  Serial.print("Connected to WiFi. IP:");
  Serial.println(WiFi.localIP());

  wifiServer.begin();

}

void loop() {

  WiFiClient client = wifiServer.available();
  String command = "";

  if (client) {

    while (client.connected()) {

      while (client.available() > 0) {
        char c = client.read();
        if (c == '\n') {
          break;
        }
        command += c;
        Serial.write(c);
      }

      if (command == "1") {
        Serial.println("BADIANE"); //Ici, mettre les déplacements de moteur quand on clique sur 1
      } else if (command == "2") {
        Serial.println("CANELLE"); //Ici, mettre les déplacements de moteur quand on clique sur 2
      } else if (command == "3") {
        Serial.println("CURRY"); //Ici, mettre les déplacements de moteur quand on clique sur 3
      } else if (command == "4") {
        Serial.println("PAPRIKA"); //Ici, mettre les déplacements de moteur quand on clique sur 4
      } else if (command == "5") {
        Serial.println("PIMENT"); //Ici, mettre les déplacements de moteur quand on clique sur 5
      }

      command = "";
      delay(10);

      ScanNFC();
    }

    client.stop();
    Serial.println("Client disconnected");

  }
}

ScanNFC();
delay(50);

void ScanNFC() {
  Serial.println("Scan de la puce NFC");  //Ici, mettre tout le code pour le Scan NFC
}
