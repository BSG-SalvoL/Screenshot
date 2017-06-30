void MyFolderSelect()
{
  noLoop();
  selectFolder("Select a folder to process:", "folderSelected");
}

void MySave()
{
  if(screenshot == null) return;
  if(Selected == null) MyFolderSelect();
  else
  {
    screenshot.save(Selected.getAbsolutePath() + "\\ScreenShot" + contatore + ".jpg");
    contatore ++;
  }
}

void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    Selected = selection; 
  }
  loop();
  retn = true;
}