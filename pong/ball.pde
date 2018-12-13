class Ball{
 
  private PVector location;
  private PVector velocity;
  
  public Ball(float x, float y){
    println(x,y);
    location = new PVector(x/2.0, y/2.0);
    velocity = new PVector(1.5,2.1);
  }
  
  public PVector getLocations(){
    return location; 
  }
  
  public PVector getVelocity(){
    return velocity; 
  }
  
  public void setLocation(float x, float y){
    location.x = x;
    location.y = y;
  }
  
  public void setVelocity(float xVel, float yVel){
   
    velocity.x = xVel;
    velocity.y = yVel;
  } 
  
}
