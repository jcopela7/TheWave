import com.leapmotion.leap.processing.*;


import processing.serial.*;
import com.leapmotion.leap.*;
import java.awt.Dimension;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;

LeapMotion Leap;po
Serial myPort, myPort2;


void setup() {
  Leap = new LeapMotion(this);
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  background(0);
  Controller c = new Controller();
  Frame frame = c.frame();
  InteractionBox box = frame.interactionBox();
  for (Finger f:frame.fingers()) {
    if (f.type()==Finger.Type.TYPE_INDEX){
      Vector fingerPos = f.stabilizedTipPosition();
      Vector boxFingerPos = box.normalizePoint(fingerPos);
      myPort.write((int)(boxFingerPos.getY()*100));
      println((int)(boxFingerPos.getY()*100));
      
    }
  }
}