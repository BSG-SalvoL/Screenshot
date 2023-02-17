
Boolean mouseInRect(int x, int y, int dimX, int dimY) {
  if((mouseX < x + dimX) && (mouseX > x) && (mouseY < y + dimY) && (mouseY > y))
    return true;
   return false;
}

color complementary(color c) {
  color res = color(255-red(c), 255-green(c), 255-blue(c));
  return res;
}

String StringRepeat(String x, int times) {
  String res = "";
  for(int i = 0; i < times; i++) 
    res += x;
  return res;
}
