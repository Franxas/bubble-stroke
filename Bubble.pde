public class Bubble {
  
  private Modes mode;
  
  private float xPos;
  private float yPos;
  private float radius;
  private float opacity;
  
  private float noiseX;
  private float noiseY;
  
  
  private int bornAtMs;
  private int lifeSpanMs;
  
  private boolean isDead;
  
  public Bubble() {
    
    mode = Modes.FREE;
    
    xPos = mouseX;
    yPos = mouseY;
    radius = random(50);
    opacity = random(150, 255);
    
    noiseX = random(100);
    noiseY = random(100);
    
    bornAtMs = millis();
    lifeSpanMs = (int) random(5000, 20000);
    
    isDead = false;
       
    init();
  }
  
  public void update() {
    
    setMode();
    
    switch(mode) {
      
      case FREE:
        moveFreely();
        break;
      case MAGNET:
        mouseMagnet();
        break;
      case FREEZE:
        break;
      case SPREAD:
        moveFreely();
    }
      
    fill(255, 100, 200, opacity);
    noStroke();
    circle(xPos, yPos, radius);
  }
 
  private void moveFreely() {
    
    noiseX += 0.01;
    noiseY += 0.01;
    xPos += (noise(noiseX) - 0.5) * (radius / 15 + 0.8);
    yPos += (noise(noiseY) - 0.5) * (radius / 15 + 0.8);
    
  }
  
  private void mouseMagnet() {
    
    
    
    float force = 0.8;
    
    //if (mouseX != xPos) {
      xPos = (mouseX < xPos) ? xPos - force : xPos + force;
    //}
    //if (mouseY != yPos) {
      yPos = (mouseY < yPos) ? yPos - force : yPos + force;
    //}
    
    moveFreely();
    
        
  }
  
  /*
  checks if the the life span of the object has been reached by 
  comparing it with how lomg the project been ru8nning less 
  the object's time of creation
  */
  
  private boolean isAlive() {
    
    if (mode == Modes.FREEZE) {
       lifeSpanMs += 1000 / 57;
    }
    
    if (isDead) {
      return false;
    } else {
      return (millis() - bornAtMs > lifeSpanMs) ? false : true;
    }
  }
 

  // set to free mode from outside
  public void setFree() {
    
     
     mode = Modes.FREE;
  }
  
  private void setMode() {
   
    if(keyPressed) {
      if(key == 'f' || key == 'F') {
        
        setFree();
      } else if (key == 'g' || key == 'G') {
        
        mode = Modes.MAGNET;
      } else if (key == 'p' || key == 'P') {
        
        mode = Modes.FREEZE;
      }
    }
  }
  
  private void setMode(Modes mode) {
    
    this.mode = mode;
    
  }
  
  
  private void init() {

    noStroke();
    fill(255, 100, 200, opacity);
    circle(xPos, yPos, radius);
  }
}
