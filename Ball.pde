class Ball{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float size;
  boolean gone = false;
  void first(){
  
  ellipse(320,460,size,size);
}  
void begin(){
if (mouseX<60){
  x=60;
  y=height-60;
  ellipse(x,y,size,size);
  }else if(mouseX>580){
    x=580;
  y=height-60;
  ellipse(x,y,size,size);
  }else{
  x=mouseX;
  y=height-60;
  ellipse(x,y,size,size);}
  }
  void move(){
    x+=xSpeed;
    y+=ySpeed;
    if (x<size/2 || x>width-size/2){
      xSpeed *= -1;
    }
    if (y<size/2){
      ySpeed *= -1;
    }

    float bottom = y+size/2;
    float bl = board.y - 10/2;
    float bLeft = board.x-board.len/2;
    float bRight = board.x+board.len/2;
    if (bottom >= bl && x>bLeft && x<bRight){
        ySpeed *= -1;
        y = bl;
    }

  }
  void display(){
    ellipse(x,y,size,size);
  }
  
  boolean isHit(
        float circleX,
        float circleY,
        float radius,
        float rectangleX,
        float rectangleY,
        float rectangleWidth,
        float rectangleHeight)
  {
      float circleDistanceX = abs(circleX - rectangleX);
      float circleDistanceY = abs(circleY - rectangleY);
   
      if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
      if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }
   
      if (circleDistanceX <= (rectangleWidth/2)) { return true; }
      if (circleDistanceY <= (rectangleHeight/2)) { return true; }
   
      float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                           pow(circleDistanceY - rectangleHeight/2, 2);
   
      return (cornerDistance_sq <= pow(radius,2));
  }

  Ball(float xSpeed, float ySpeed){
    x = board.x+board.len/2;
    y = board.y-10;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.size = 10;
  }
}
