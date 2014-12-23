class Brick{
int bx;
int by;
  int brickWidth;
int brickHeight;
boolean dispear = false;

void move(){
}

void display(){

    fill(28,213,128);
  rect(bx+100,by+100,brickWidth, brickHeight);  
}

Brick(int x, int y){
  bx = x;
  by = y;
  brickWidth = 40;
  brickHeight = 20;

  fill(128,64,0);
}
}
