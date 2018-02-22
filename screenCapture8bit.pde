 
import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.awt.Rectangle;

import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;

import processing.core.*;
import java.util.*;

DeviceRegistry registry;
TestObserver testObserver;

//int   brightness = -110;
int   brightness = 0;
//float contrast   = 1.25;
float contrast   = 2.0;

BrightnessContrastController bc;
 
Robot robot;
 
void setup() {
  size(512, 512, P2D);
  registry = new DeviceRegistry();
  testObserver = new TestObserver();
  registry.addObserver(testObserver);
  
  bc = new BrightnessContrastController();
  
  try {
    robot = new Robot();
  } 
  catch (Exception e) {
    println(e.getMessage());
  }
}
 
void draw() {
  background(0);
  // Rectangle r = new Rectangle(0, 30, 320, 320);
  Rectangle r = new Rectangle(584, 148, 512, 512);
  BufferedImage img1 = robot.createScreenCapture(r);
  PImage img2 = new PImage(img1);
  translate(0, 512);
  rotate(radians(-90));
  tint(85); 
  image(bc.nondestructiveShift(img2, brightness, contrast), 0, 0);
  // bc.destructiveShift(img2, brightness, contrast);
  // image(img2, 0, 0);
  // filter(ERODE);
  
  scrape();
}
