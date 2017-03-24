public class Botao {
  private int posX;
  private int posY;
  private int largura;
  private int altura;
  
  public Botao(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
    largura = 200;
    altura = 50;
  }
  public int getPosX() {
    return posX;
  }
  public int getPosY() {
    return posY;
  }
  public boolean emCima(int mouseX, int mouseY, int width, int height) {
    if(mouseX >= posX && mouseY >= posY && mouseX <= posX + width && mouseY <= posY + height){
      return true;
    }
    return false;
  }
}
