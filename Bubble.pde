public class Bubble {
  
  private float xPos;
  private float yPos;
  private float radius;
  private float opacity;
  
  private float noiseX;
  private float noiseY;
  
  private int bornAtMs;
  private int lifeSpanMs;
  
  public Bubble() {
    
    xPos = mouseX;
    yPos = mouseY;
    radius = random(50);
    opacity = random(150, 255);
    
    noiseX = random(100);
    noiseY = random(100);
    
    bornAtMs = millis();
    lifeSpanMs = (int) random(5000, 20000);
       
    init();
  }
  
  public void update() {
      
    noiseX += 0.01;
    noiseY += 0.01;
    xPos += (noise(noiseX) - 0.5) * (radius / 15 + 0.8);
    yPos += (noise(noiseY) - 0.5) * (radius / 15 + 0.8);
      
    fill(255, 100, 200, opacity);
    noStroke();
    circle(xPos, yPos, radius);
  }
  
  /*
  checks if the the life span of the object has been reached by 
  comparing it with how lomg the project been ru8nning less 
  the object's time of creation
  */
  
  public boolean isAlive() {
    
    return (millis() - bornAtMs > lifeSpanMs) ? false : true;
  }
  
  private void init() {

    noStroke();
    fill(255, 100, 200, opacity);
    circle(xPos, yPos, radius);
  }
}
