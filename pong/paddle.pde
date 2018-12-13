class Paddle{
  
  private PVector locations;
  private PVector velocity;
  
  public Paddle(float x,float y){
    locations = new PVector(x,y/2);
    velocity = new PVector(0,5);
  }
  
  public PVector getLocations(){
    return locations;
  }
  
  public PVector getVelocity(){
    return velocity; 
  }
  
  public void setLocation(float y){
    locations.y = y;
  }
  
  public void setVelocity(float y){
    velocity.y = y; 
  }
  
  
  
}
