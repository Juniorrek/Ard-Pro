PImage imagem;

void setup() {
  size(1280, 720);
  imagem = loadImage("arvore.png");

}

void draw() {
  //image(car, 185, 90);
  background(bg);
  if(x < 200) x += 4;
  if(y < 100) y += 2;
  image(car, x, y);
  delay(10);
}
