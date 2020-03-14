import java.util.Random;

int numOfRect = 300;
float size = width / numOfRect;
float array[] = new float [numOfRect];

//boolean sorted = false;
float temp = 0;
int smallest = 0;
Random rand = new Random();

int goodIndex = 0;

void setup()
{
  size(640, 360);  // Size should be the first statement
  colorMode(HSB, height, height, height);
  noStroke();
  noLoop();
  
  for (int i = 0; i < numOfRect; i++)
  {
    array[i] = rand.nextInt(100);
  }
}

void draw()
{
  background(0);
  
  for (int i = 0; i < numOfRect; i++)
  {
    fill(array[i], height, height);
    rect(i*(width/numOfRect)+15, 20, width/numOfRect, array[i]);
  }
  
  smallest = goodIndex;
  for (int i = goodIndex; i < numOfRect; i++)
  {
    if(array[i] < array[smallest])
      smallest = i;
  }
  if(array[smallest] < array[goodIndex]){
    temp = array[smallest];
    array[smallest] = array[goodIndex];
    array[goodIndex] = temp;
  }
  goodIndex++;
  fill(0, height, height);
  if (goodIndex == numOfRect){
    noLoop();
    smallest = 0;
    goodIndex = 0;
  }
  fill(0, height, height);
  text("selection sort", width/2 - 15, 15);
  
  saveFrame("selectionFrames/selection_####.png"); //save each frame in folder

  }
  
void mousePressed() {
  loop();
}
