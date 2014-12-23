Ball ball;
Bar board;
Brick [] bricks;

//Game Status
final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_PAUSE   = 2;
final int GAME_WIN     = 3;
final int GAME_LOSE    = 4;
int status;              //Game Status

int life = 3;

void setup(){
  status = GAME_START;
  size(640,480);
  background(0, 0, 0);
  rectMode(CENTER);
  board = new Bar(100);
  ball = new Ball(5,-5);
  bricks = new Brick[50];
brickMaker();
 for (int i=0; i<bricks.length; i++){
    bricks[i].display();
  }
}

void draw(){
  background(50, 50, 50);
    background(0);
  noStroke();
  switch(status) {

  case GAME_START:
    /*---------Print Text-------------*/
        printText(1); // replace this with printText
         board.move();
    /*--------------------------------*/
    break;

  case GAME_PLAYING:
  background(0);
  statusCtrl();
  drawLife();
  ball.begin();
  if(mouseButton == RIGHT){
    ball.move();
  }
  ball.display();    
  board.move();
  board.display();
  
   for (int i=0; i<bricks.length; i++){

    bricks[i].display();
  }

  break;
  case GAME_WIN:

    printText(3);

    break;

  case GAME_LOSE:

    printText(4);

    break;
  }
}
void printText(int x){
  fill(95, 194, 226);
  textAlign(CENTER,CENTER);

  if(x == 1){
  textSize(60);
  text("PONG GAME",320,240);
  textSize(20);
  text("Press ENTER to Start", 320, 280);
}
  else if(x == 2){
 textSize(40);
 text("PAUSE",320,240);
 textSize(20);
 text("Press ENTER to Resume", 320, 280);
}
  else if(x == 3){
 textSize(40);
 text("WIN",320,300);
}
  else if(x == 4){
 textSize(40);
 text("BOOM",320,240);
 textSize(20);
 text("You are dead!!", 320, 280);
}

}




void keyPressed() {
  if (status == GAME_PLAYING && mouseButton == RIGHT) {
    ball.gone = true;
    ball.move(); 
  }
  statusCtrl();
}

void brickMaker() {
  bricks[0]= new Brick(0,10);
   for (int i=0; i < 50; ++i){
    
    int row = int (i / 10);
    int col = int (i % 10);
 
    int x = 5 + (50*col);
    int y = 10 + (30*row);
    
    bricks[i] = new Brick(x, y);
}
}
/*
void checkBrickHit() {
int a=0;
    for (int j=0; j<bricks.length-1; j++) {
      Brick bricks = bricks[j];
      if (bricks != null && ball != null && ball.gone && bricks.dispear
      && ball.x+10 <= bricks[j].bx && ball.x-10 >= bricks[j].by + bricks[j].brickWidth
      && ball.y + 10 <= bricks[j].bx && ball.y - 10 >= bricks[j].by + bricks[j].brickHeight) {
          
          bricks.dispear = true;
          a++;          
    }
    if(a>=50){
     life--; 
    }
   
  }
}
*/
void drawLife() {
  fill(230, 74, 96);
  text("LIFE:", 36, 455);

  if(life == 3) {
  for(int i=0;i < 3;i++){
  ellipse(78+25*i,459,15,15);
  }
  }else if (life == 2) {
  for(int i=0;i < 2;i++){
  ellipse(78+25*i,459,15,15);
  }   
  }else if (life == 1) {
      for(int i=0;i < 1;i++){
  ellipse(78+25*i,459,15,15);
  }
  }else if (life == 0) {
    status = GAME_LOSE;
  }
}


void statusCtrl() {
  if (key == ENTER) {
    switch(status) {

    case GAME_START:
      status = GAME_PLAYING;
       brickMaker();
      break;

/*    case GAME_PAUSE:
      status = GAME_PLAYING;
      break;
      
    case GAME_WIN:
      status = GAME_PLAYING;
      break;
    
    case GAME_LOSE:
      status = GAME_PLAYING;
      break;
  */  }
  }
}
