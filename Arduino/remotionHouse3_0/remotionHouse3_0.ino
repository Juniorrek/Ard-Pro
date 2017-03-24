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
const int pinTransistor = 9;
int tempc = 0,tempf=0; 
int samples[8]; // Array para precisão na medição

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(led, OUTPUT);
  pinMode(pinTransistor, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
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
     if(caractere == '1') {
       digitalWrite(led,HIGH);
       Serial.println("OK, led ligado.");
     }
     if (caractere == '0') {
       digitalWrite(led,LOW);
       Serial.println("OK, led desligado.");
     }
   }
   //temperatura = (float(analogRead(LM35))*5/(1023))/0.01;
   for(int i = 0;i<=7;i++){ // Loop que faz a leitura da temperatura 8 vezes
      samples[i] = ( 5.0 * analogRead(LM35) * 100.0) / 1024.0;
      //A cada leitura, incrementa o valor da variavel tempc
      tempc = tempc + samples[i]; 
     delay(10);
    }
    tempc = tempc/8.0; 
   Serial.print(tempc);
   Serial.print("~");
   delay(100);
}
