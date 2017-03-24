int greenH = 2;
int yellowH = 3;
int redH = 4;
int greenV = 6;
int yellowV = 8;
int redV = 10;
int longDelay = 2000;
int shortDelay = 1000;

void setup(){       
  pinMode(greenH, OUTPUT);
  pinMode(yellowH, OUTPUT);
  pinMode(redH, OUTPUT);
  pinMode(greenV, OUTPUT);
  pinMode(yellowV, OUTPUT);
  pinMode(redV, OUTPUT);
}

void loop(){
    digitalWrite(redH, LOW);
    digitalWrite(greenH, HIGH); 
    delay(longDelay);   
    digitalWrite(yellowH, HIGH); 
    digitalWrite(greenH, LOW); 
    delay(shortDelay);
    digitalWrite(yellowH, LOW);
    digitalWrite(redH, HIGH);    

    digitalWrite(redV, LOW);
    digitalWrite(greenV, HIGH); 
    delay(longDelay);   
    digitalWrite(yellowV, HIGH); 
    digitalWrite(greenV, LOW); 
    delay(shortDelay);
    digitalWrite(yellowV, LOW);
    digitalWrite(redV, HIGH);   
}
