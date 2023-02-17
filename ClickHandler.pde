

interface ClickHandler {
  public void clickEventHandler();
}

public class IncIntHandler implements ClickHandler {
  private IncInt x;
  
  public IncIntHandler(IncInt x) {this.x = x;}
  
  public void clickEventHandler() {
    x.inc();
  }
}

public class DecIntHandler implements ClickHandler {
  private IncInt x;
  
  public DecIntHandler(IncInt x) {this.x = x;}
  
  public void clickEventHandler() {
    x.dec();
  }
}
