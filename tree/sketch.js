var slider;
var angle; //angle
var c; //color
var w;
var offset = 0.10
function setup() {
  createCanvas(640, 480);
  stroke(255);
  slider = createSlider(0, PI*(3/4), 0, 0.01);
}

function draw() {
  if(!mouseIsPressed)
  {
    background(51);
    angle = slider.value();
    // angle = map(sin(frameCount*0.03), -1, 1, 0, PI);
    
    c = map(angle, 0, PI/2.5, 0, 200);
    fill(c, c, 0);
    translate(width/2, height);
    branch(100);
  }
  else
    frameCount--;

  
}

function branch(len)
{
  w = map(len, 0, 100, 0, 8);
  strokeWeight(w);
  if((angle > (PI / 4) - offset) && (angle < (PI / 4) + offset))
    stroke(0,c,c)
  else 
    stroke(c, c, 0);
  line(0, 0, 0, -len);
  if(len > 10){
    push();
    translate(0, -len);
    rotate(angle);
    branch(len*0.67)
    pop();
    push();
    translate(0, -len);
    rotate(-angle);
    branch(len*0.67);
    pop();
  }
}

