public void save(String filename) { 
 java.awt.image.BufferedImage img=new java.awt.image.BufferedImage(displayWidth, displayHeight, 
 java.awt.image.BufferedImage.TYPE_INT_RGB); 
 loadPixels(); 
 img.setRGB(0, 0, displayWidth, displayHeight, g.pixels, 0, displayWidth); 
 
 String extn=filename.substring(filename.lastIndexOf('.')+1).toLowerCase(); 
 if (extn.equals("jpg")) {
 
   try{
     ByteArrayOutputStream out = new ByteArrayOutputStream();
     JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
     JPEGEncodeParam p = encoder.getDefaultJPEGEncodeParam(img);
     p.setQuality(0.99,true);
     encoder.setJPEGEncodeParam(p);
     encoder.encode(img);
     
     File file = new File(savePath(filename));
     FileOutputStream fo = new FileOutputStream(file);
     out.writeTo(fo);
     println("saved "+filename);
   }
   catch(FileNotFoundException e){
     System.out.println(e);
   }
   catch(IOException ioe){
     System.out.println(ioe);
   }
 
 } else if (extn.equals("png")) { // add here as needed 
 
   try { 
     javax.imageio.ImageIO.write(img, extn, new File(savePath(filename))); 
     println("saved "+filename); 
   } 
   catch(Exception e) { 
     System.err.println("error while saving as "+extn); 
     e.printStackTrace(); 
   } 
   
 } else { 
   super.save(filename); 
 } 
}