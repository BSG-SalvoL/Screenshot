
public class IncInt {
  private Button inc;
  private Button dec;
  private IncIntHandler inhndl;
  private DecIntHandler dehndl;
  
  private int[] inval = {0};
  private int posX = 0, posY = 0;
  private int dim = 20;
  private int min, max;
  
  void inc() {
    inval[0]++;
    if(inval[0] > max) inval[0] = max;
    System.out.println(inval[0]);
  }
  
  void dec() {
    inval[0]--;
    if(inval[0] < min) inval[0] = min;
    System.out.println(inval[0]);
  }
  
  public IncInt(int x, int min, int max, int posX, int posY) {
    inval[0] = x;
    this.posX = posX;
    this.posY = posY;
    this.min = min;
    this.max = max;
    inhndl = new IncIntHandler(this);
    dehndl = new DecIntHandler(this);
    inc = new Button(posX+(dim*2)+2, posY, dim, dim, color(0, 255, 0), color(255), inhndl, "+");
    dec = new Button(posX+dim, posY, dim, dim, color(0, 255, 0), color(255), dehndl, "-");
  }
  
  public void draw() {
    String val = str(inval[0]);
    String stFill = "";
    if(val.length() < 4)
      stFill = StringRepeat(" ", 4 - val.length());
    val = stFill + val;
    fill(0, 255, 0);
    text(val, posX-5, posY+15);
    inc.run();
    dec.run();
  }
}
