class Button
{
  int x, y, w, h;
  String text;
  boolean mouseOver = false;
  
  color fill = 255;
  color hoverFill = 200;
  color stroke = 0;
  color textFill = 0;
  int alpha = 255;
  
  public Button(int x, int y, int w, int h, String text)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
  }
  
  public Button(int x, int y, int w, int h, String text, color fill, color hoverFill)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.fill = fill;
    this.hoverFill = hoverFill;
  }
  
  void show()
  {
    rectMode(CENTER);
    
    if(mouseOver())
      fill(hoverFill, alpha);
    else
      fill(fill, alpha);
    stroke(0, alpha);
    strokeWeight(4);
    
    rect(x, y, w, h);
    
    textSize(h / 2);
    textAlign(CENTER, CENTER);
    fill(textFill, alpha);
    
    text(text, x, y - h / 10);
  }
  
  boolean mouseOver()
  {
    return mouseX > x - w / 2 && mouseX < x + w / 2 && mouseY > y - h / 2 && mouseY < y + h / 2;
  }
}
