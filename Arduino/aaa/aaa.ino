#include <Ultrasonic.h>

#define qntdeUltrassons 2
#define qntdeLeds 2

struct sensorUltrassonico {
    byte pinEcho;
    byte pinTrigger;
    float distancia;
    long microSec;
};

sensorUltrassonico ultrassons[qntdeUltrassons] = {{10, 11},
                                         {12, 13}};
Ultrasonic ultrasonic1(ultrassons[0].pinTrigger, ultrassons[0].pinEcho);
Ultrasonic ultrasonic2(ultrassons[1].pinTrigger, ultrassons[1].pinEcho);

byte pinLed[qntdeLeds] = {5, 6};

void setup() {
  Serial.begin(9600);
  for(int i = 0; i < qntdeLeds; i++){
      pinMode(pinLed[i], OUTPUT);
  }
}
 
void loop() {
  ultrassons[0].microSec = ultrasonic1.timing();
  ultrassons[1].microSec = ultrasonic2.timing();
  ultrassons[0].distancia = ultrasonic1.convert(ultrassons[0].microSec, Ultrasonic::CM);
  ultrassons[1].distancia = ultrasonic2.convert(ultrassons[1].microSec, Ultrasonic::CM);
  Serial.print(ultrassons[0].distancia);
  Serial.print("~");
  Serial.print(ultrassons[1].distancia);
  Serial.print("^");

  if(ultrassons[0].distancia < 15) digitalWrite(pinLed[0], HIGH);
  else digitalWrite(pinLed[0], LOW);
  if(ultrassons[1].distancia < 15) digitalWrite(pinLed[1], HIGH);
  else digitalWrite(pinLed[1], LOW);
  delay(1000);
}
