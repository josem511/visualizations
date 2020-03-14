int maxRadius = width*4;
void setup() {
  size(720, 540);
  background(0);
  noLoop();
}

void draw() {
  background(frameCount, frameCount, 0, frameCount); //RGB(red+green = yellow) and Hue(increases & will stop at 255). 
  drawCircle(width/2, width/2, width/2); //x,y(center),radius(half of width)
  if (frameCount < 255)
    maxRadius = (int)map(frameCount, 0, 255, width, width/64);
  else
    noLoop();
  //if (maxRadius > 3)
  //  maxRadius /= 2;
  //saveFrame("tiangleFrames/triangle_####.png"); //save each frame in folder
}

void drawCircle(float x, float y, float radius) {
  // Scale the radius value from 0 to half of the width(radius of 1st Gen) to a range between 0 and 175
  float c = map(radius, 0, width/2, 0, 175);

  // Scale the radius value from 0 to 1/8 of the width(radius of 3rd Gen) to a range between 0 and 255
  float d = map(radius, 0, width/8, 175, 255);

  if (radius > width/8)
    fill(0, 0, c);
  else
    fill(d,0, 0);
  ellipse(x, y, radius, radius);
    if (radius > maxRadius) {
      drawCircle(x + radius/2, y, radius/2); //right circle
      drawCircle(x - radius/2, y, radius/2); //left circle
      drawCircle(x , y - radius/2, radius/2);//top circle
    }
}

void mousePressed()
{
  loop();
}
