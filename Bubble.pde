public class Bubble {
  
  private float xPos;
  private float yPos;
  private float radius;
  private float opacity;
  
  private float noiseX;
  private float noiseY;
  
  private int bornAtMs;
  private int lifeSpanMs;
  private boolean isAlive;
  
  public Bubble() {
    
    xPos = mouseX;
    yPos = mouseY;
    radius = random(50);
    opacity = random(150, 255);
    
    noiseX = random(100);
    noiseY = random(100);
    
    bornAtMs = millis();
    isAlive = true;
    lifeSpanMs = (int) random(30000, 60000);
    
    
    init();
  }
  
  
  public void update() {
    
    isAlive = (millis() - bornAtMs > lifeSpanMs) ? false : true;
    
    if(isAlive) {
      
      noiseX += 0.01;
      noiseY += 0.01;
      xPos += noise(noiseX - 0.5) * (radius / 15 + 0.8);
      yPos += noise(noiseY - 0.5) * (radius / 15 + 0.8);
      
      circle(xPos, yPos, radius);
    }
  }
  
  
  public boolean getIsAlive() {
    
    return isAlive;
  }
  
  private void init() {

    noStroke();
    fill(255, 100, 200, opacity);
    circle(xPos, yPos, radius);
  }
}
