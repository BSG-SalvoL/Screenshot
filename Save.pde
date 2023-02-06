public void save(String filename) { 
 java.awt.image.BufferedImage img=new java.awt.image.BufferedImage(displayWidth, displayHeight, 
 java.awt.image.BufferedImage.TYPE_INT_RGB); 
 loadPixels(); 
 img.setRGB(0, 0, displayWidth, displayHeight, g.pixels, 0, displayWidth); 
 
 String extn=filename.substring(filename.lastIndexOf('.')+1).toLowerCase(); 
 try { 
   javax.imageio.ImageIO.write(img, extn, new File(savePath(filename))); 
   println("saved "+filename); 
 } 
 catch(Exception e) { 
   System.err.println("error while saving as "+extn); 
   e.printStackTrace(); 
 } 
}
