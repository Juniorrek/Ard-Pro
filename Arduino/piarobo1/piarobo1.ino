int motores[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
const int nmotores = 14;

void setup() {
  // put your setup code here, to run once:
  for(int x = 0; x < nmotores; x++) pinMode(motores[x], OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  for(int x = 0; x < nmotores; x++) digitalWrite(motores[x], HIGH);
  delay(1000);
  for(int x = 0; x < nmotores; x++) digitalWrite(motores[x], LOW);
  delay(1000);
}
