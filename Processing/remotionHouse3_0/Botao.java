public class Botao {
  private int posX;
  private int posY;
  private int largura;
  private int altura;
  private int corFundo;
  private int corBorda;
  private boolean emCima;
  
  public Botao(int posX, int posY, int largura, int altura, int corFundo, int corBorda) {
    this.posX = posX;
    this.posY = posY;
    this.largura = largura;
    this.altura = altura;
    this.corFundo = corFundo;
    this.corBorda = corBorda;
  }
  public void atualizar(int mouseX, int mouseY) {
    int aux;
    if(mouseX >= posX && mouseX <= posX + largura &&
       mouseY >= posY && mouseY <= posY + altura) {
      aux = corFundo;
      corFundo = corBorda;
      corBorda = aux;
      emCima = true;
    } else emCima = false;
  }
  public int getPosX() {
    return posX;
  }
  public int getPosY() {
    return posY;
  }
  public int getAltura() {
    return altura;
  }
  public int getLargura() {
    return largura;
  }
  public int getCorFundo() {
    return corFundo;
  }
  public int getCorBorda() {
    return corBorda;
  }
  public boolean emCima() {
    return emCima;
  }
}
