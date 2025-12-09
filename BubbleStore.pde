public class CircleStore {
  
  private FloatList xPosList;
  private FloatList yPosList;
  private FloatList radiusList;
  private FloatList noiseXList;
  private FloatList noiseYList;
  private FloatList opacityList;
  
  public CircleStore() {
   
    xPosList = new FloatList();
    yPosList = new FloatList();
    radiusList = new FloatList();
    noiseXList = new FloatList();
    noiseYList = new FloatList();
    opacityList = new FloatList();
  }
  
  public void add(float xPos, float yPos, float radius, float opp) {
   
    xPosList.append(xPos);
    yPosList.append(yPos);
    radiusList.append(radius);
    opacityList.append(opp);
    noiseXList.append(random(100));
    noiseYList.append(random(100));
  }
  
  public void draw() {
    
    if (xPosList.size() > 0) {
      for(int i = 0; i < xPosList.size(); i++) {
        noStroke();
        fill(255, 100, 200, opacityList.get(i));
        
        noiseXList.add(i, 0.01);
        noiseYList.add(i, 0.01);
        xPosList.add(i, (noise(noiseXList.get(i)) - 0.5) * (radiusList.get(i) / 15 + 0.8));
        yPosList.add(i, (noise(noiseYList.get(i)) - 0.5) * (radiusList.get(i) / 15 + 0.8));
        
        circle(xPosList.get(i), yPosList.get(i), radiusList.get(i));
        
      }
    }
  }
  
  public void resetTranslate() {
    
  }
}
