byte ledPin[] = {11, 12, 13};
int potPin = 0;
int potValue = 0;

void setup() {
  // put your setup code here, to run once:
  for(int x = 0; x < 3; x++) pinMode(ledPin[x], OUTPUT);

  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  potValue = analogRead(potPin);
  Serial.println(potValue);
  
  for(int x = 0; x < 3; x++) digitalWrite(ledPin[x], LOW);

  if(potValue < 10) for(int x = 0; x < 3; x++) digitalWrite(ledPin[x], LOW);
  else if(potValue <= 100) digitalWrite(ledPin[0], HIGH);
  else if(potValue <= 200) for(int x = 0; x < 2; x++) digitalWrite(ledPin[x], HIGH);
  else for(int x = 0; x < 3; x++) digitalWrite(ledPin[x], HIGH);

  /*if(potValue == 0) for(int x = 0; x < 9; x++) digitalWrite(ledPin[x], LOW);
  else if(potValue <= 113) digitalWrite(ledPin[0], HIGH);
  else if(potValue <= 226) for(int x = 0; x < 2; x++) digitalWrite(ledPin[x], HIGH);
  else if(potValue <= 339) for(int x = 0; x < 3; x++) digitalWrite(ledPin[x], HIGH);
  else if(potValue <= 452) for(int x = 0; x < 4; x++) digitalWrite(ledPin[x], HIGH);
  else if(potValue <= 565) for(int x = 0; x < 5; x++) digitalWrite(ledPin[x], HIGH);
  else if(potValue <= 678) for(int x = 0; x < 6; x++) digitalWrite(ledPin[x], HIGH);
  else if(potValue <= 791) for(int x = 0; x < 7; x++) digitalWrite(ledPin[x], HIGH);
  else if(potValue <= 904) for(int x = 0; x < 8; x++) digitalWrite(ledPin[x], HIGH);
  else if(potValue <= 1023) for(int x = 0; x < 9; x++) digitalWrite(ledPin[x], HIGH);*/
}
