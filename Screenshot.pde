PImage screenshot;
boolean AutoSave = false, retn = false, timing = false;
File Selected = null;

int active[] = {0, 0, displayWidth, displayHeight, 0};
int activeidx = 0;

void setup() {
  background(0);
  active[2] = displayWidth;
  active[3] = displayHeight;
}

void settings()
{
  size((int)(displayWidth/1.5), (int)(displayHeight/1.5) + 150);
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
  if(key == 'H' || key == 'h') SwitchDim();
  if(key == '+') active[activeidx]++;
  if(key == '-') 
  {
    if(active[activeidx] > 0)
      active[activeidx]--;
  }
  
}

void SwitchDim() {
  activeidx++;
  if(activeidx > 4)
    activeidx = 0;
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
    screenshot = new PImage(new Robot().createScreenCapture(new Rectangle(active[0], active[1], active[2], active[3])));
    if(AutoSave && Selected != null) MySave();
    this.surface.setVisible(true);
  } catch (AWTException e) {this.surface.setVisible(true); }
}
