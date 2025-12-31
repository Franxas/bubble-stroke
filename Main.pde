/*
TODO:
-> npw working on diferent app modes. <<<<<<

>>>>>> 'F' - bubbles move freely
>>>>>> 'G' - bubbles get magnetized to mouse when not drawing
>>>>>> 'P' - bubbles get frozen. not moving

-> maybe for when in another mode than freely bubbles could freeze thei life span count.
should create a proj manager class to deal with all this. ------ this half done

--> magnetized mode is very sloppy still. can get much better

-> arrumar o codigo!!!!

-> 

*/
void setup() {
  
  size(700, 700);
}
BubbleStore bubbleStore = new BubbleStore();

void draw() {
  
  background(0);
  
  stroke(255, 100);
  strokeWeight(2);
  line(0, height * 0.8, width, height * 0.8);
  
  if (mousePressed){
    bubbleStore.add();
  }
  
  bubbleStore.update();
}
