int rectX, rectY;      // Position of square button
int rectSize = 90;     // Diameter of rect
color rectColor, baseColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;

Telas telaAtual = Telas.INICIAL;

void setup() {
  size(800, 600); //Define a resolução da tela a ser instanciada.
  rectColor = color(0);
  rectHighlight = color(51);
  baseColor = color(102);
  currentColor = baseColor;
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;
  ellipseMode(CENTER);
}

void draw() {
  update(mouseX, mouseY);
  background(color(102));
  switch(telaAtual) {
    case INICIAL:
      telaInicial();
    break;
    case LED:
      telaLed();
    break;
    case SENSOR:
      telaSensor();
    break;
    case MOTOR:
      telaMotor();
    break;
  }
  
  //rect(10, 10, 100, 100);
  
  /*if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }*/
  stroke(255);
  //rect(rectX, rectY, rectSize, rectSize);
}

void telaInicial() {
  Tela inicial = new Tela(4);
  //text(inicial.getQntBotoes(), 10, 10);
  int j = 160;
  for(int i = 0; i < inicial.getQntBotoes(); i++) {
    inicial.newBotao(i, 300, j); //Referencia um novo botão no vetor
    rect(inicial.getBotaoPosX(i), inicial.getBotaoPosY(i), 200, 50); //Desenha o botão na tela
    fill(inicial.atualizar(i, mouseX, mouseY, width, height));
    j += 75;
  }
  textSize(32);
  fill(255, 255, 255); //Define cor dos textos
  text("LED",    inicial.getBotaoPosX(0) + 50, inicial.getBotaoPosY(0) + 40);
  text("Sensor", inicial.getBotaoPosX(1) + 50, inicial.getBotaoPosY(1) + 40);
  text("Motor",  inicial.getBotaoPosX(2) + 50, inicial.getBotaoPosY(2) + 40);
  text("Sair",   inicial.getBotaoPosX(3) + 50, inicial.getBotaoPosY(3) + 40);
  //text(inicial.imprimeBotoes(), 50, 50);
}

void telaLed() {

}

void telaSensor() {

}

void telaMotor() {

}

void update(int x, int y) {
  /*if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
  } else {
    rectOver = false;
  }*/
  
}

void mousePressed() {
  if (rectOver) {
    currentColor = rectColor;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
