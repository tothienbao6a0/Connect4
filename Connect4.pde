//Bao To
//Advanced CompSci
//CONNECT4 PROJECT
PFont f;
int player;
Score score;
int points1;
int points2;
boolean thereisWinner=false;
boolean itsaTie=false;
void reset(){//redraw and reset everything when new game starts or space is pressed
  score.scoreReset();
  fill(255);
  strokeWeight(5);
  rect(0,0,1400,1167);
  rect(0,0,1167,1200);
  rect(0,0,1167,1000);
   fill(0);
    for(int x=0; x<1167; x+=1167/7){
     line(0,x,1167,x);
  }
  for (int y=0;y<1000;y+=1000/6){
     line(y,0,y,1000);
    }
  fill(0);
  player=0;
  strokeWeight(5);
  
  fill(255);
  rect(1180, 110, 200, 100);
  rect(1180, 500, 200, 100);
  fill(0);
  text(points1, 1300,175);
  text(points2, 1300,565);
  
  thereisWinner=false;
  itsaTie=false;
  text("player 1", 1230, 250);
  text("player 2", 1230, 650);
  text("space to restart",1180,770);
}

void setup(){
  size(1400,1167);
  strokeWeight(10);
  f=createFont("Arial", 100, true);
  textFont(f, 30);


 

  
 // newShape=new DrawShape();
 score = new Score();
 score.scoreReset();
  reset();
  score.printOut();
}

void draw(){
  
}
void mouseClicked() {//void mouseClicked
  if (thereisWinner ==false&&itsaTie==false){
  score.replace(mouseX/167*167,mouseY/167*167);
  score.printOut();
  score.check();
  score.tie();
}}
void keyPressed() {// if space bar is pressed, reset the game
  if (key==' ')reset();
}
