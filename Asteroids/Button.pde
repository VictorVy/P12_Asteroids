class Button
{
  int x, y, w, h;
  String text;
  
  color textFill = 255;
  color textHoverFill = 0;
  color bgFill = 255;
  
  public Button(int x, int y, int w, int h, String text)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
  }
  
  void show()
  {
    noStroke();
    textFont(font);
    textSize(h / 1.5);
    
    boolean mouseOver = mouseOver();

    fill(bgFill, mouseOver ? alphaUI / 2 : 0);
    rect(x, y, w, h);
    
    fill(mouseOver() ? textHoverFill : textFill, alphaUI);
    text(text, x, y - h / 7);
  }
  
  boolean mouseOver()
  {
    return alphaUI != 0 && mouseX > x - w / 2 && mouseX < x + w / 2 && mouseY > y - h / 2 && mouseY < y + h / 2;
  }
}
