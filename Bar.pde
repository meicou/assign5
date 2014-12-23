class Bar{
  float x;
  float y;
  float len;
   void first(){
  rectMode(CENTER);
  rect(320,y,len,10);
 }
  void move(){
   if(mouseX>=60&&mouseX<=580){
    x = mouseX;
  }
  }
  void display(){
    rectMode(CENTER);
    rect(x,y,len,10);
  }
  
  Bar(float len){
    
    this.y = height-50;
    this.len = len;
  }


}
