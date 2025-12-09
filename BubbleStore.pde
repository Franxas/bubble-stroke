public class CircleStore {
  
  private ArrayList<Bubble> bubbleStorage;
  
  public CircleStore() {
    
    bubbleStorage = new ArrayList<>();
  }
  
  public void add() {
    
    bubbleStorage.add(new Bubble());
  }
  
  public void update() {
    
    IntList signalToRemove = new IntList();
    
    for (int i = 0; i < bubbleStorage.size(); i++) {
     
      if (bubbleStorage.get(i) != null) {
        if (bubbleStorage.get(i).isAlive()) {
          bubbleStorage.get(i).update();
        } else {
          signalToRemove.append(i);
        }
      }
    }
    
    for (int i = 0; i < signalToRemove.size(); i++) { // concurency issues. list is being resized when item is removed
      bubbleStorage.set(signalToRemove.get(i), null);
    }
  }
}
