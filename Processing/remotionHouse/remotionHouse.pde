import processing.serial.*; /* biblioteca para comunicação serial */
import java.awt.event.KeyEvent; /*biblioteca para leitura de dados na porta serial. */
import java.io.IOException;
import ddf.minim.*;

Serial myPort; /* Define objeto serial */

enumTelas telaAtual = enumTelas.INICIAL;
float temperaturas[] = new float[100];

void setup() {
  size(800, 600); //Define a resolução da tela a ser instanciada.
  myPort = new Serial(this, Serial.list()[0], 9600); /* inicia comunicação serial. */
  myPort.bufferUntil('~');
  for(int i = 0; i < temperaturas.length; i++) {
    temperaturas[i] = 0;
  }
}

boolean prim = false;
boolean iniClick = false;

void draw() {
  switch(telaAtual) {
    case INICIAL:
      prim = false;
      background(color(102));
      telaInicial();
      break;
    case LED:
      prim = false;
      background(color(102));
      telaLed();
      break;
    case MOTOR:
      prim = false;
      background(color(102));
      telaMotor();
      break;
    case SENSOR:
      if (!prim) {
        background(color(102));
        prim = true;
      }
      telaSensor();
      break;
  }
}

Botao botoes1[] = new Botao[4];
void telaInicial() {
  int j = 160;
  for(int i = 0; i < botoes1.length; i++) {
    botoes1[i] = new Botao(300, j, 200, 50, 0, 255);
    botoes1[i].atualizar(mouseX, mouseY);
    fill(botoes1[i].getCorFundo());
    stroke(botoes1[i].getCorBorda());
    rect(botoes1[i].getPosX(), botoes1[i].getPosY(), botoes1[i].getLargura(), botoes1[i].getAltura());
    j += 75;
    textSize(32);
    fill(botoes1[i].getCorBorda());
    if(i == 0) text("LED", botoes1[i].getPosX() + 55, botoes1[i].getPosY() + 35);
    else if (i == 1) text("Sensor", botoes1[i].getPosX() + 55, botoes1[i].getPosY() + 35);
    else if (i == 2) text("Motor", botoes1[i].getPosX() + 55, botoes1[i].getPosY() + 35);
    else text("Sair", botoes1[i].getPosX() + 55, botoes1[i].getPosY() + 35);
    //text(botoes[i].getPosX() + "," + botoes[i].getPosY() + "," + botoes[i].getLargura() + "," + botoes[i].getAltura() + "\n", 10, (i + 1) * 100);
  }
}

Botao botoes2[] = new Botao[3];
void telaLed() {
  int j = 200;
  for(int i = 0; i < botoes2.length; i++) {
    if(i != 2) botoes2[i] = new Botao(j, 200, 200, 50, 0, 255);
    else botoes2[i] = new Botao(300, 300, 200, 50, 0, 255);
    botoes2[i].atualizar(mouseX, mouseY);
    fill(botoes2[i].getCorFundo());
    stroke(botoes2[i].getCorBorda());
    rect(botoes2[i].getPosX(), botoes2[i].getPosY(), botoes2[i].getLargura(), botoes2[i].getAltura());
    j += 225;
    fill(255);
    text("LED:", botoes2[0].getPosX() - 75, botoes2[0].getPosY() + 35);
    textSize(32);
    fill(botoes2[i].getCorBorda());
    if(i == 0) text("ON", botoes2[i].getPosX() + 55, botoes2[i].getPosY() + 35);
    else if (i == 1) text("OFF", botoes2[i].getPosX() + 55, botoes2[i].getPosY() + 35);
    else text("Voltar", botoes2[i].getPosX() + 55, botoes2[i].getPosY() + 35);
  }
}

Botao botoes3[] = new Botao[3];
int ySensor = 50;
int xSensor = 50;
String temperatura;
int abc = 0;
boolean prime = false;
int pri = 0;
void telaSensor() {
    int x = 175;
    for(int i = 0; i < botoes3.length; i++) {
      if( i < 2) botoes3[i] = new Botao(x, 425, 200, 50, 0, 255);
      else botoes3[i] = new Botao(300, 500, 200, 50, 0, 255);
      x += 250;
      botoes3[i].atualizar(mouseX, mouseY);
      fill(botoes3[i].getCorFundo());
      stroke(botoes3[i].getCorBorda());
      rect(botoes3[i].getPosX(), botoes3[i].getPosY(), botoes3[i].getLargura(), botoes3[i].getAltura());
      textSize(32);
      fill(botoes3[i].getCorBorda());
      if(i == 0) text("Iniciar", botoes3[i].getPosX() + 55, botoes3[i].getPosY() + 35);
      else if (i == 1) text("Parar", botoes3[i].getPosX() + 55, botoes3[i].getPosY() + 35);
      else text("Voltar", botoes3[i].getPosX() + 55, botoes3[i].getPosY() + 35);
    }
    abc++;
      if(abc > 100){
        abc = 0;
        if(iniClick){
          delay(500);
          if(myPort.available() > 0) {
            //temperatura = myPort.read();
            temperatura = myPort.readStringUntil('~');
            temperatura = temperatura.substring(0, temperatura.length()-1);
            text(temperatura, xSensor, ySensor);
            ySensor += 50;
            if(ySensor == 450) {
              ySensor = 50;
              xSensor += 100;
            }
          }
          //text("clicado", 100, ySensor);
            //ySensor += 1;
        }
      }
}

Botao botoes4[] = new Botao[5];
void telaMotor() {
  int j = 200;
  for (int i = 0; i < botoes4.length; i++) {
    if (i < 2) botoes4[i] = new Botao(j, 200, 200, 50, 0, 255);
    else if (i < 4) botoes4[i] = new Botao(j, 300, 200, 50, 0, 255);
    else botoes4[i] = new Botao(300, 400, 200, 50, 0, 255);
    botoes4[i].atualizar(mouseX, mouseY);
    fill(botoes4[i].getCorFundo());
    stroke(botoes4[i].getCorBorda());
    rect(botoes4[i].getPosX(), botoes4[i].getPosY(), botoes4[i].getLargura(), botoes4[i].getAltura());
    j += 225;
    if(i == 1)
      j = 200;
    fill(255);
    if (i == 4) 
      text("Motor:", botoes4[4].getPosX() + 55, botoes4[4].getPosY() - 250);
    textSize(32);
    fill(botoes4[i].getCorBorda());
    if (i == 0) text("Desligado", botoes4[i].getPosX() + 25, botoes4[i].getPosY() + 35);
    else if (i == 1) text("Nivel 1", botoes4[i].getPosX() + 55, botoes4[i].getPosY() + 35);
    else if (i == 2) text("Nivel 2", botoes4[i].getPosX() + 55, botoes4[i].getPosY() + 35);
    else if (i == 3) text("Nivel 3", botoes4[i].getPosX() + 55, botoes4[i].getPosY() + 35);
    else text("Voltar", botoes4[i].getPosX() + 55, botoes4[i].getPosY() + 35);
  }
}

void mousePressed() {
  if (telaAtual == telaAtual.INICIAL) {
    if (botoes1[0].emCima())
      telaAtual = telaAtual.LED;
    else if (botoes1[1].emCima())
      telaAtual = telaAtual.SENSOR;
    else if (botoes1[2].emCima())
      telaAtual = telaAtual.MOTOR;
    else if (botoes1[3].emCima())
      exit();
  } else if (telaAtual == telaAtual.LED) {
    if (botoes2[0].emCima())
      myPort.write("1");
    else if (botoes2[1].emCima())
      myPort.write("0");
    else if (botoes2[2].emCima())
      telaAtual = telaAtual.INICIAL;
  } else if (telaAtual == telaAtual.SENSOR) {
    if (botoes3[0].emCima()){
      myPort.write("2");
      iniClick = true;
    }else if (botoes3[1].emCima()){
      myPort.write("3");
      iniClick = false;
    }else if (botoes3[2].emCima()){
      telaAtual = telaAtual.INICIAL;
      ySensor = 50;
      xSensor = 50;
    }
  } else if (telaAtual == telaAtual.MOTOR) {
    if (botoes4[0].emCima())
      myPort.write("4");
    else if (botoes4[1].emCima())
      myPort.write("5");
    else if (botoes4[2].emCima())
      myPort.write("6");
    else if (botoes4[3].emCima())
      myPort.write("7");
    else if (botoes4[4].emCima())
      telaAtual = telaAtual.INICIAL;
  }
}
