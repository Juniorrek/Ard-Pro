#include <SoftwareSerial.h>
 
SoftwareSerial bt(6, 7); // RX&nbsp; TX
int led = 13;
int caractere;
 
void setup() {
 bt.begin(9600);
 pinMode(led,OUTPUT);
}
 
void loop() {
 if (bt.available()) {
 caractere = bt.read();
 if(caractere == '1') {
 digitalWrite(led,HIGH);
 bt.println("OK, led ligado.");
 }
 if (caractere == '0') {
 digitalWrite(led,LOW);
 bt.println("OK, led desligado.");
 }
 }
 delay(100);
}

