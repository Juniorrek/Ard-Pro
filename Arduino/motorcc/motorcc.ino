const int pinTransistor = 9;
int velocidade = 0;

void setup() {
  // put your setup code here, to run once:
  pinMode (pinTransistor, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  for(velocidade = 0; velocidade < 255; velocidade += 5){
    analogWrite (pinTransistor, velocidade);
    delay(400);
  }
  for(velocidade = 255; velocidade > 0; velocidade -= 5){
    analogWrite (pinTransistor, velocidade);
    delay(400);
  }
}
