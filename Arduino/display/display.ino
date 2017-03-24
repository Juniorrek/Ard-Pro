#include <LiquidCrystal.h>

LiquidCrystal lcd(9, 8, 5, 4, 3, 2);

void setup() {
  lcd.begin(16, 2);
}

void loop() {
  lcd.clear();
  lcd.setCursor(6, 0);
  lcd.print("UFPR");
  delay(2000);
  lcd.clear();
  lcd.print(" Universidade ");
  lcd.setCursor(3, 1);
  lcd.print("Federal");
  delay(2300);
}

/* 
for (int posicao = 0; posicao < 3; posicao++) {
  lcd.scrollDisplayLeft();
  delay(300);
}

for (int posicao = 0; posicao < 6; posicao++) {
  lcd.scrollDisplayRight();
  delay(300);
}
*/
