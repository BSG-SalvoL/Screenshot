PImage screenshot;
boolean AutoSave = false, retn = false, timing = false;
File Selected = null;
int active[] = {0, 0, displayWidth, displayHeight, 0};
int activeidx = 0;

IncInt incintTest = new IncInt(active[0], 0, displayWidth, 1000, 600);

void setup() {
  background(0);
  active[2] = displayWidth;
  active[3] = displayHeight;
}

void settings()
{
  //size((int)(displayWidth/1.5), (int)(displayHeight/1.5) + 150);
  size(1280, 720);
}

void draw() {
  noStroke();
  fill(0);
  rect(0, 0, width, height - height/4);
  if (screenshot != null) image(screenshot, 0, 0, width, height - height/4);
  printStatus();
  if(mouseX < width && mouseY < height - height/4) {
    color c = get(mouseX, mouseY);
    c = complementary(c);
    fill(c);
    if(mouseX < 1200)
      text((mouseX*((float)displayWidth/width)) + " , " + (mouseY*((float)displayHeight/(height-height/4))), pmouseX, pmouseY);
    else
      text((mouseX*((float)displayWidth/width)) + " , " + (mouseY*((float)displayHeight/(height-height/4))), pmouseX-100, pmouseY);
  }
  incintTest.draw();
  
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
  if(key == 'G' || key == 'g')
    this.frame.setExtendedState(JFrame.ICONIFIED);
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
