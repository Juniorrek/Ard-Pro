PImage bg, car;
int x, y;

void setup() {
  size(1280, 720);
  bg = loadImage("parking.png");
  car = loadImage("car.png");
  x = y = 0;
  background(bg);
}

void draw() {
  //image(car, 185, 90);
  background(bg);
  if(x < 200) x += 4;
  if(y < 100) y += 2;
  image(car, x, y);
  delay(10);
}
