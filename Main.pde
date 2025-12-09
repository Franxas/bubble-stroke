/*
TODO:
App is working as it is. Now trying to go from -> using as many lists as the number of 
variants every single bubble has -> to one single list of bubbles. That means working 
with a new bubble class storing all those variants as properties. then filling one single
list with new instances of bubbles. 
Also want a life span has one of these variants. bubbles would then self destruct ----
---- garbage collector takes care of this?
*/
void setup() {
  
  size(700, 700);
}
CircleStore circleStore = new CircleStore();

void draw() {
  
  background(0);
  
  if (mousePressed){ // mouse is not pressed. draw circles saves from last stroke
    circleStore.add();
  }
  
  circleStore.update();
}
