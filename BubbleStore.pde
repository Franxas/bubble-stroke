public class BubbleStore {
  
  private ArrayList<Bubble> bubbleStorage;
  private Modes mode;
  
  public BubbleStore() {
    
    bubbleStorage = new ArrayList<>();
    mode = Modes.FREE;
  }
  
  public void add() {
    
    //for (int i = 0; i < bubbleStorage.size(); i++) {
    //  if (bubbleStorage.get(i) != null) {
    //    bubbleStorage.get(i).setFree();
    //  }
    //}
    Bubble newBubble = new Bubble();
    newBubble.setMode(mode);
    bubbleStorage.add(newBubble);
    println(bubbleStorage.size());
  }
  
  public void update() {
    
     setMode();
    for (int i = 0; i < bubbleStorage.size(); i++) {
     
      if (bubbleStorage.get(i) != null) {
        
        if (bubbleStorage.get(i).isAlive()) {
          
          bubbleStorage.get(i).update();
        } else {
          
          bubbleStorage.set(i, null);
        }
      }
    }
    
  }
  
  private void setMode() {
   
    if(keyPressed) {
      if(key == 'f' || key == 'F') {
        
        mode = Modes.FREE;
      } else if (key == 'g' || key == 'G') {
        
        mode = Modes.MAGNET;
      } else if (key == 'p' || key == 'P') {
        
        mode = Modes.FREEZE;
      }
    }
  }
}
