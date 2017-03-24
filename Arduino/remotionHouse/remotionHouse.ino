/*
 * LEGENDA
 * 0 = LED ON
 * 1 = LED OFF
 * 2 = SENSOR ON
 * 3 = SENSOR OFF
 * 4 = MOTOR OFF
 * 5 = MOTOR 1
 * 6 = MOTOR 2
 * 7 = MOTOR 3
 */

int led = 13;
const int LM35 = A0;
float temperatura;
int caractere;
bool enviar = false;
const int pinTransistor = 9;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(led, OUTPUT);
  pinMode(pinTransistor, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (enviar){
    temperatura = (float(analogRead(LM35))*5/(1023))/0.01;
    Serial.print(temperatura);
    Serial.print("~");
  }
  if (Serial.available()) {
    caractere = Serial.read();
    if(caractere == '7'){
      analogWrite(pinTransistor, 255);
     }
     if(caractere == '6'){
      analogWrite(pinTransistor, 170);
     }
     if(caractere == '5'){
      analogWrite(pinTransistor, 85);
     }
     if(caractere == '4'){
      analogWrite(pinTransistor, 0);
     }
     if(caractere == '3'){
      enviar = false;
     }
     if(caractere == '2') {
        enviar = true;
     }
     if(caractere == '1') {
       digitalWrite(led,HIGH);
       Serial.println("OK, led ligado.");
     }
     if (caractere == '0') {
       digitalWrite(led,LOW);
       Serial.println("OK, led desligado.");
     }
   }
   delay(100);
}
