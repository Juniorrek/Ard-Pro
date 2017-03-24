import processing.serial.*; /* biblioteca para comunicação serial */
import java.awt.event.KeyEvent; /*biblioteca para leitura de dados na porta serial. */
import java.io.IOException;
import ddf.minim.*;
 
Serial myPort; /* Define objeto serial */
 
String distances="";
String verde="";
String vermelho="";
int iVerde;
int iVermelho;
int index1=0;
PFont f;
//int i = 10;
PImage bg;
PImage car;

void setup() {
  size (1280, 720); //Resolução
  myPort = new Serial(this, Serial.list()[0], 9600); /* inicia comunicação serial. */
  myPort.bufferUntil('^'); /* Lê os dados atravéz da porta serial (distância) */
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  textFont(f,36);
  bg = loadImage("parking.png");
  car = loadImage("car.png");
  background(bg);
}

void draw() {
    background(bg);
    if(iVerde < 20) image(car, 180, 70);
    if(iVermelho < 20) image(car, 660, 70);
}

void serialEvent (Serial myPort) { /* começa a ler os dados apartir da porta serial. */
  /* lê os dados na porta serial (caractere) e armazena em uma string de dados. */
  distances = myPort.readStringUntil('^');
  distances = distances.substring(0, distances.length()-1);
  index1 = distances.indexOf("~");
  verde = distances.substring(0, index1);
  vermelho = distances.substring(index1+1, distances.length());
  iVerde = int(verde);
  iVermelho = int(vermelho);
  /*text(distances, 10, i);
  text(verde,300,i);
  text(vermelho, 600, i);
  i = i + 25;*/
}
