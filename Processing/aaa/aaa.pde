import processing.serial.*; /* biblioteca para comunicação serial */
import java.awt.event.KeyEvent; /*biblioteca para leitura de dados na porta serial. */
import java.io.IOException;
import ddf.minim.*;
 
Serial myPort; /* Define objeto serial */
 
String distancias="";
String distanciaString[] = new String[2];
int distanciaInt[] = new int[2];
int index1=0;
PImage bg;
PImage car;

void setup() {
  size (1280, 720); //Resolução
  myPort = new Serial(this, Serial.list()[0], 9600); /* inicia comunicação serial. */
  myPort.bufferUntil('^'); /* Lê os dados atravéz da porta serial (distância) */
  bg = loadImage("parking.png");
  car = loadImage("car.png");
  background(bg);
}

void draw() {
    background(bg);
    if(distanciaInt[0] < 15) image(car, 180, 70);
    if(distanciaInt[1] < 15) image(car, 660, 70);
}

void serialEvent (Serial myPort) { /* começa a ler os dados apartir da porta serial. */
  /* lê os dados na porta serial (caractere) e armazena em uma string de dados. */
  distancias = myPort.readStringUntil('^');
  distancias = distancias.substring(0, distancias.length()-1);
  index1 = distancias.indexOf("~");
  distanciaString[0] = distancias.substring(0, index1);
  distanciaString[1] = distancias.substring(index1+1, distancias.length());
  distanciaInt[0] = int(distanciaString[0]);
  distanciaInt[1] = int(distanciaString[1]);
}
