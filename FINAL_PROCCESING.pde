////LeapMotion library
import com.leapmotion.leap.processing.*;
import processing.serial.*;
import com.leapmotion.leap.*;
import java.awt.Dimension;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;

LeapMotion Leap;
Serial myPort, myPort2;


void setup() {
  //instansiate leap motion
  Leap = new LeapMotion(this);
  println(Serial.list());
  //start serial port
  myPort = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  background(0);
  Controller c = new Controller();
  Frame frame = c.frame();
  InteractionBox box = frame.interactionBox();
  //while there is a finger in the field of vision
  for (Finger f:frame.fingers()) {
    if (f.type()==Finger.Type.TYPE_INDEX){
      Vector fingerPos = f.stabilizedTipPosition();
      Vector boxFingerPos = box.normalizePoint(fingerPos);//takes position of finger and stores in vector
      myPort.write((int)(boxFingerPos.getY()*100)); //takes y compnent of position vecotor and transmites information via serial port to Arduino
      println((int)(boxFingerPos.getY()*100));//print y position of finger
      
    }
  }
}