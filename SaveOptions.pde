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
    screenshot.save(Selected.getAbsolutePath() + "\\ScreenShot" + active[4] + ".jpg");
    active[4]++;
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
