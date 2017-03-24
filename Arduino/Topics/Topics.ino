#include <Ultrasonic.h>
 
#define pino_trigger1 13 //VERDE
#define pino_echo1 12
#define pino_trigger2 11 //VERMELHO
#define pino_echo2 10
#define led1 6 //VERDE
#define led2 5 //VERMELHO

Ultrasonic ultrasonic1(pino_trigger1, pino_echo1);
Ultrasonic ultrasonic2(pino_trigger2, pino_echo2);
 
void setup() {
  Serial.begin(9600);
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
}
 
void loop() {
  float cmMsec1, cmMsec2;
  long microsec1 = ultrasonic1.timing();
  long microsec2 = ultrasonic2.timing();
  cmMsec1 = ultrasonic1.convert(microsec1, Ultrasonic::CM);
  cmMsec2 = ultrasonic2.convert(microsec2, Ultrasonic::CM);
  Serial.print(cmMsec1);
  Serial.print("~");
  Serial.print(cmMsec2);
  Serial.print("^");

  if(cmMsec1 < 10) digitalWrite(led1, HIGH);
  else digitalWrite(led1, LOW);
  if(cmMsec2 < 10) digitalWrite(led2, HIGH);
  else digitalWrite(led2, LOW);
  delay(1000);
}
