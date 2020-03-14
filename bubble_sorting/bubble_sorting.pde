import java.util.Random;
int numOfRect = 300;
float size = width / numOfRect;
float array[] = new float [numOfRect];
boolean sorted = false;
float temp = 0;
Random rand = new Random();
 
void setup() {
  size(640, 360);  // Size should be the first statement
  colorMode(HSB, height, height, height);
  noStroke();
  noLoop();
  
  for (int i = 0; i < numOfRect; i++) //fill array with random numebers from 1 - 100
    array[i] = rand.nextInt(100) + 1;
}

void draw() { 
  background(0);   // Set the background to black
  
  for (int i = 0; i < numOfRect; i++)
  {
    fill(array[i], height, height);
    rect(i*(width/numOfRect)+15, 20, width/numOfRect, array[i]);
  }
  
  sorted = true;
  for(int i = 0; i < numOfRect-1; i++)
  {
      if (array[i+1] < array[i])
      {
          temp = array[i+1];
          array[i+1] = array[i];
          array[i] = temp;
          sorted = false;
      }
  }
  if(sorted)
    noLoop();
  fill(0, height, height);
  text("bubble sort", width/2 - 15, 15);
  saveFrame("bubbleMovie/bubble_####.png"); //save each frame in folder
} 

void mousePressed() {
  loop();
}
