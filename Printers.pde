void printText()
{
  fill(255);
  textSize(15);
  text(com1 + com2 + com3 + com4 + com5, 20, height - height/4 + 20);
  text(c + c1 + c2, width + width/40 - ((width/4)*2), height - height/4 + 20);
  stroke(255);
  line(width + width/50 - ((width/4)*2), height - height/4, width + width/50 - ((width/4)*2), height);
}

void printStatus()
{
  fill(0);
  rect(0, height - height/4, width, height);
  printText();
  if(AutoSave == true)
  {
    fill(0, 170, 0);
    text("\n          ACTIVE", width + width/13 - ((width/4)*2), height - height/4 + 20);
  }
  else
  {
    fill(255, 0, 0);
    text("\n          DISABLED", width + width/13 - ((width/4)*2), height - height/4 + 20);
  }
  
  if(Selected != null)
  {
    fill(0, 170, 0);
    text("\n\n          "+Selected.getAbsolutePath(), width + width/13 - ((width/4)*2), height - height/4 + 20);
  }
  else
  {
    fill(255, 0, 0);
    text(noFolder, width + width/13 - ((width/4)*2), height - height/4 + 20);
    if(AutoSave) 
    text(warningautosave, width + width/40 - ((width/4)*2), height - height/4 + 20);
  }
  fill(255);
  text("\n\n\n          Index: "+ contatore, width + width/13 - ((width/4)*2), height - height/4 + 20);
}