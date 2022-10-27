/**
 *  ContactRemove
 *
 *  by Ricard Marxer
 *
 *  This example shows how to use the contact events in order to remove bodies.
 */

import fisica.*;

FWorld world;
// IMPORT THE SPOUT LIBRARY
import spout.*;
// DECLARE A SPOUT OBJECT
Spout spout;

void setup() {
  size(400, 400, P3D);
  smooth();

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 100);
  world.setEdges();
  
  
   // CREATE A NEW SPOUT OBJECT
  spout = new Spout(this);
  
  // CREATE A NAMED SENDER
  // A sender can be created now with any name.
  // Otherwise a sender is created the first time
  // "sendTexture" is called and the sketch
  // folder name is used.  
  spout.createSender("Spout Processing");
  
}

void draw() {
  background(255);

  if (frameCount % 50 == 0) {
    float sz = random(30, 60);
    FCircle b = new FCircle(sz);
    b.setPosition(random(0+30, width-30), 50);
    b.setVelocity(0, 100);
    b.setRestitution(0.7);
    b.setDamping(0.01);
    b.setNoStroke();
    b.setFill(200, 30, 90);
    world.add(b);
  }

  world.draw();
  world.step();
  
      spout.sendTexture();

}

void contactEnded(FContact c) {  
  if (!c.getBody1().isStatic()) {
    FCircle b = (FCircle)c.getBody1();
    if (b.getSize()>5) {
      b.setSize(b.getSize()*0.9);
    }
  } 

  if (!c.getBody2().isStatic()) {
    FCircle b = (FCircle)c.getBody2();
    if (b.getSize()>5) {
      b.setSize(b.getSize()*0.9);
    }
  }
}

void keyPressed() {
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }
}
