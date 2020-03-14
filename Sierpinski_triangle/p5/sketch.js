function setup() {
	createCanvas(windowWidth, windowHeight);
	// createCanvas(720, 540);
	if(windowWidth<windowHeight)
		m = windowWidth;
	else
		m = windowHeight;

	//smallCircle = new Circle(50,50,50);
	circles = [];
	drawCircle(windowWidth/2, windowHeight/2, m/2, circles);
	j=0;
}

function draw() {
	background(255, 100, 100);
	//smallCircle.show();
	//console.log(smallCircle);
	//drawCircle(windowWidth/2, windowHeight/2, windowWidth/2, circles);
	drawAllCircles(circles,j);
	// console.log(circles.length);
	if(j<circles.length)
		j++;
}

function drawCircle(x, y, radius, c){
	//stroke(r);
	c.push(new Circle(x, y, radius));
	ellipse(x,y,radius,radius);
    if (radius > 2*windowWidth/128) {
      drawCircle(x + radius/2, y, radius/2, c); //right circle
      drawCircle(x - radius/2, y, radius/2, c); //left circle
      drawCircle(x , y - radius/2, radius/2, c);//top circle
    }
		
}

function drawAllCircles(c, j)
{
	//console.log(c.length);
	for(i = 0; i < j; i++){
		//console.log("DAC inside the if called");
		c[i].show();
	}
}

/*
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

*/