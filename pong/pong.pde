// Have to pass the values because the other classes do not recognize the height and size of this variable
Paddle player1 = new Paddle(10,700);
Paddle player2 = new Paddle(1000-20,0);
Ball ball1 = new Ball(1000,700);
float r = random(-1.5,1.5);
boolean hasEnded = false;
PFont f;
int scoreCounter = 0;

void setup(){
   
  size(1000,700);
  background(0);
  ball1.setVelocity(6,6*r);
  f = createFont("Arial",16,true);  // Arial, point, Anti-aliasing on
}


void draw(){
  
  background(0);
  textFont(f,25); // set the size of the text here
  fill(255);
  text("Score: "+scoreCounter,width-150,35);
  
  // if game over, -10 to give us a margin of error
  if (ball1.getLocations().x < player1.getLocations().x-10){
    textFont(f,50);
    text("Game Over",width/2 - 50*3,height/2);
  }
  
  // logic for key pressed
  if (keyPressed){
    float y = 0;
    
    // set the velocity to be an increment if the key is pressed
    float yVel = player1.getVelocity().y + player1.getVelocity().y * 0.1;
    player1.setVelocity(yVel);
    
    // logic for the key presses
    if (key == CODED && keyCode == UP){
        y = player1.getLocations().y - player1.getVelocity().y;
        player1.setLocation(y); 
    }
    
    else if (key == CODED && keyCode == DOWN){
        y = player1.getLocations().y + player1.getVelocity().y;
        player1.setLocation(y); 
    }
  }
  
  
  fill(255);
  // creating the players
  rect(player1.getLocations().x, player1.getLocations().y,15,70);  // player1's paddle
  rect(player2.getLocations().x,player2.getLocations().y,25,height);
  checkPaddleScope();
  moveBall();
  
}

// called when any key is pressed on the keyboard
//void keyPressed(){
//  float y = 0;
  
//  // set the velocity to be an increment if the key is pressed
//  float yVel = player1.getVelocity().y + player1.getVelocity().y * 0.1;
//  player1.setVelocity(yVel);
  
//  // logic for the key presses
//  if (key == CODED && keyCode == UP){
//      y = player1.getLocations().y - player1.getVelocity().y;
//      player1.setLocation(y); 
//  }
  
//  else if (key == CODED && keyCode == DOWN){
//      y = player1.getLocations().y + player1.getVelocity().y;
//      player1.setLocation(y); 
//  }
  
//  println(player1.getVelocity().y);
//  // the new location of the paddle
  
//}

void keyReleased(){
  
  player1.setVelocity(5);  // reset the velocity
}

void moveBall(){
  
  // if ball hits player 2's paddle
  if ((ball1.getLocations().x > player2.getLocations().x)){ 
      ball1.getVelocity().x = ball1.getVelocity().x * -1;
  }
  
  // if ball hits paddle
  if (ball1.getLocations().y >= player1.getLocations().y && ball1.getLocations().y <= player1.getLocations().y +70){
    if (ball1.getLocations().x <= player1.getLocations().x && !hasEnded){
      println(ball1.getVelocity().x);
      ball1.getVelocity().x = ball1.getVelocity().x * -1;
      scoreCounter++;
      
      // incresing the speed of the ball for it to get profressively harder
      ball1.setVelocity(ball1.getVelocity().x*1.1, ball1.getVelocity().y*1.1);
    }
  }
  
  else if(ball1.getLocations().x <= player1.getLocations().x){
    hasEnded = true;
    println("GAME OVER");
  }
  // top of the screen
  if (ball1.getLocations().y < 0){
     ball1.getVelocity().y = ball1.getVelocity().y * -1;
  }
  
  // bottom of the screen
  if (ball1.getLocations().y > height){
     ball1.getVelocity().y = ball1.getVelocity().y * -1; 
  }
  
  
  ball1.getLocations().x = ball1.getLocations().x + ball1.getVelocity().x;
  ball1.getLocations().y = ball1.getLocations().y + ball1.getVelocity().y;
  
  ellipse(ball1.getLocations().x, ball1.getLocations().y,20,20);  
}

void checkPaddleScope(){
  
  // if paddle is at the top of the screen
  if (player1.getLocations().y <= 0){
     player1.setLocation(0); 
  }
  
  if (player1.getLocations().y+70 >= height){
     player1.setLocation(700-70); 
  }
}
