/* Face-tracking painting app
 * Sam Gruber <grubermensch@gmail.com>
 * IACD S2013
 */

import oscP5.*;

OscP5 oscP5;
Face face = new Face();
float defaultEyebrowHeight;

void setup() {
  size(640, 480);
  frameRate(30);
  background(255);
  noStroke();
  
  oscP5 = new OscP5(this, 8338);
}

void draw() {
  if (face.found > 0) {
    pushMatrix();
    translate(face.posePosition.x, face.posePosition.y);
    scale(face.poseScale);
    fill(face.poseOrientation.x*255, face.poseOrientation.y*255, face.poseOrientation.z*255);
    ellipse(0,0,face.mouthWidth, face.mouthHeight*5);
    popMatrix();
    
    print(face.toString());
  }
}

void oscEvent(OscMessage m) {
  face.parseOSC(m);
}
