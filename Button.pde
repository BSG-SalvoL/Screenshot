
public class Button {
  private int x, y, dimX, dimY;
  private color cborder, cfill;
  private ClickHandler handler;
  private String label;
  private Boolean exPressed = false;
  public Button(int x, int y, int dimX, int dimY, color cborder, color cfill, ClickHandler hndl, String label) {
    this.x = x;
    this.y = y;
    this.dimX = dimX;
    this.dimY = dimY;
    this.cborder = cborder;
    this.cfill = cfill; 
    this.handler = hndl;
    this.label = label;
  }
  
  private void draw() {
    stroke(cborder);
    fill(cfill);
    rect(x, y, dimX, dimY);
    if(!mouseInRect(x, y, dimX, dimY))
      fill(complementary(cfill));
    else
      fill(cborder);
    text(label, x+(float)dimX/2 - 5*label.length(), y+(float)(dimY/2)+5);
  }
  
  private Boolean pressed() {
    if(mouseInRect(x, y, dimX, dimY) && mousePressed && mouseButton == LEFT && exPressed == false) {
      exPressed = true;
      return true;
    }
    if(!mousePressed) exPressed = false;
    return false;
  }
  
  public void run() {
     draw();
     if(pressed())
       handler.clickEventHandler();
  }
};
