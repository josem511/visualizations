import java.util.Random;

int numOfRect = 300;
float size = width / numOfRect;
float array[] = new float [numOfRect];

//boolean sorted = false;
float temp = 0;
int i = 0;
//int goodIndex = 0;
Random rand = new Random();


void setup()
{
  size(640, 360);  // Size should be the first statement
  colorMode(HSB, height, height, height);
  noStroke();
  noLoop();
  
  for (int i = 0; i < numOfRect; i++)
    array[i] = rand.nextInt(100) + 1;
}

void draw()
{
  background(0);
  
  for (int i = 0; i < numOfRect-1; i++)
  {
    fill(array[i], height, height);
    rect(i*(width/numOfRect)+15, 20, width/numOfRect, array[i]);
  }
  
  if(array[i+1] < array[i]){
    
    temp = array[i+1];
    
    for (int j = (i+1); j >= 0; j--)
    {
        if(j == 0)
        {
            array[j] = temp; //place it in the beginning 
            break;
        }
        else if(array[j-1] > temp){ //shifts everything that does not belong to the right.
            array[j] = array[j-1];
        }
        else 
        {
            array[j] = temp; //finds new position for array[n]
            break;
        }
    }
  }
  
  
  i++;
  if(i == numOfRect - 1){
    noLoop();
    i = 0;
  }
  saveFrame("insertionFrames/insertion_####.png"); //save each frame in folder
            
  
  
}

void mousePressed() {
  loop();
}
