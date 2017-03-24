int ledPin1 = 0;
int ledPin2 = 1;
int ledPin3 = 2;
int ledPin4 = 3;
int ledPin5 = 4;
int ledPin6 = 5;
int ledPin7 = 8;
int ledPin8 = 6;
int ledPin9 = 7;
int delayTime = 10;
int currentLed = 0;
int direction = 1;

void setup() {
  // put your setup code here, to run once:
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin4, OUTPUT);
  pinMode(ledPin5, OUTPUT);
  pinMode(ledPin6, OUTPUT);
  pinMode(ledPin7, OUTPUT);
  pinMode(ledPin8, OUTPUT);
  pinMode(ledPin9, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(ledPin1, LOW);
  digitalWrite(ledPin2, LOW);
  digitalWrite(ledPin3, LOW);
  digitalWrite(ledPin4, LOW);
  digitalWrite(ledPin5, LOW);
  digitalWrite(ledPin6, LOW);
  digitalWrite(ledPin7, LOW);
  digitalWrite(ledPin8, LOW);
  digitalWrite(ledPin9, LOW);

  if(currentLed == 0) digitalWrite(ledPin1, HIGH);
  delay(delayTime);
  if(currentLed == 1) digitalWrite(ledPin2, HIGH);
  delay(delayTime);
  if(currentLed == 2) digitalWrite(ledPin3, HIGH);
  delay(delayTime);
  if(currentLed == 3) digitalWrite(ledPin4, HIGH);
  delay(delayTime);
  if(currentLed == 4) digitalWrite(ledPin5, HIGH);
  delay(delayTime);
  if(currentLed == 5) digitalWrite(ledPin6, HIGH);
  delay(delayTime);
  if(currentLed == 6) digitalWrite(ledPin7, HIGH);
  delay(delayTime);
  if(currentLed == 7) digitalWrite(ledPin8, HIGH);
  delay(delayTime);
  if(currentLed == 8) digitalWrite(ledPin9, HIGH);
  delay(delayTime);

  currentLed = currentLed + direction;

  if(currentLed == 8) direction = -1;
  if(currentLed == 0) direction = 1;
}
