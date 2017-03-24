public class Tela {
  private Botao botoes[];
  
  public Tela(int nBotoes) {
    botoes = new Botao[nBotoes];
  }
  public int atualizar(int i, int mouseX, int mouseY, int width, int height) {
    if(botoes[i].emCima(mouseX, mouseY, width, height)) {
      return 51;
    } else {
      return 0;
    }
  }
  public int getQntBotoes() {
    int i;
    for(i = 1; i < botoes.length; i++);
    return i;
  }
  public void newBotao(int indice, int posX, int posY) {
    botoes[indice] = new Botao(posX, posY);
  }
  public int getBotaoPosX(int indice) {
    return botoes[indice].getPosX();
  }
  public int getBotaoPosY(int indice) {
    return botoes[indice].getPosY();
  }
  public String imprimeBotoes() {
    String retorno = "";
    for(int i = 0; i < this.getQntBotoes(); i++) {
      retorno += ("PosX: " + botoes[i].getPosX() + ", PosY: " + botoes[i].getPosY() + "\n");
    }
    return retorno;
  }
}

/*
void update(int x, int y) {
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
  } else {
    rectOver = false;
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
*/
