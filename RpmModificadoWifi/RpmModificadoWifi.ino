#include "FirebaseESP8266.h"
#include <ESP8266WiFi.h>
#include <StaticThreadController.h>
#include <Thread.h>            // Libreria Acondicionada para realizar la programacion MultiHilo
#include <ThreadController.h>
#include "Wire.h"


#define FIREBASE_HOST "prueba-1-33925-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "yK4iOdcflcF0CWjAzvNJ3IuqqhR8vs4C4vvjXqwM"
#define WIFI_SSID "WORKEN" // escriba su nombre de red
#define WIFI_PASSWORD "10mayo1971" // escriba la contraseña de la red

FirebaseData firebaseData;
FirebaseJson json;
void printResult(FirebaseData &data);
ThreadController controlFirebase = ThreadController();   //control independiente
ThreadController controlFirebase2 = ThreadController();   //control independiente
ThreadController control = ThreadController();   //control independiente

Thread* ThreadSendFirebase = new Thread();
Thread* ThreadReciveFirebase = new Thread();

/*
   Definicion de variables
   estadoProceso = indica el estado True or False del envio de datos
   Fc = Variable de tipo Int o entero
   F = Variable de tipo Int o entero
   Dir = Variable de tipo Int o entero
   m = Variable de tipo Int o entero
   Vl = Variable de tipo Int o entero
   Tm = Variable de tipo Int o entero
*/

bool estadoProceso;
int Fc, F, Dir, m, Vl, Tm, EstP;
char test1[] = "1000";
int i = 0;
String valor;
double rpm;
int led = 2;
int internet;
void setup() {

  pinMode(led, OUTPUT);
  // Initialize serial

  // inputString.reserve(200);
  Wire.begin();


  // connect to wifi.
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  while (WiFi.status() != WL_CONNECTED) {

    delay(500);
  }

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  //Serial.println("");

  //ThingSpeak.begin(client);  // Initialize ThingSpeak
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);

  ThreadSendFirebase->onRun(EnvioFirebase);
  ThreadSendFirebase->setInterval(3000);

  ThreadReciveFirebase->onRun(LecturaFirebase);
  ThreadReciveFirebase->setInterval(1200);

  controlFirebase.add(ThreadSendFirebase);
  controlFirebase2.add(ThreadReciveFirebase);

  Serial.begin(9600);


}

void loop() {
  while (Serial.available() > 0) {
    test1[i] = Serial.read();
    i = i + 1;

    if (test1[i - 1] == 'R') {
      controlFirebase2.run();
      estadoProceso = false;
      i = 0;
    }

    if (test1[i - 1] == '%') {
      test1[i - 1] = 0;
      i = 0;
      //rpm = atoi(test1);
      rpm = atof(test1);
      controlFirebase.run();
    }
  }
}
