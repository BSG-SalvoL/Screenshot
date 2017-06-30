PImage screenshot;
boolean AutoSave = false, retn = false;
File Selected = null;
int contatore = 0;

void setup() {
  background(0);
  
}

void settings()
{
  size(displayWidth/2, displayHeight/2);
}

void draw() {
  if (screenshot != null) image(screenshot, 0, 0, width, height - height/4);
  printStatus();
}

void keyPressed()
{
  if(key == 'P' || key == 'p') screenshot();
  if(key == 'E' || key == 'e') exit();
  if(key == 'F' || key == 'f') MyFolderSelect();
  if(key == 'A' || key == 'a') activateAutoSave();
  if(key == 'S' || key == 's') MySave();
  if(key == '+') contatore++;
  if(key == '-') 
  {
    if(contatore > 0)
      contatore--;
  }
}

void activateAutoSave()
{
  AutoSave = !AutoSave;
  if(Selected == null)
    MyFolderSelect();
}


void screenshot() {
  try {
    this.surface.setVisible(false);
    delay(250);
    screenshot = new PImage(new Robot().createScreenCapture(new Rectangle(0, 0, displayWidth, displayHeight)));
    if(AutoSave && Selected != null) MySave();
    this.surface.setVisible(true);
  } catch (AWTException e) {this.surface.setVisible(true); }
}