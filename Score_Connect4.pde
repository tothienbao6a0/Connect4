class Score {//initialize Score Class
  int[][]score;
  Score() {
    score = new int[6][7];
  }
  void scoreReset() {//reset the matrix values to all 0
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 7; j++) {
        score[i][j] = 0;
      }
    }
  }

  int whereBottom() {//method to make the balls fall to the bottom and check if the one at the bototm is empty
    for (int y=5; y>=0; y--) 
    {
      if (score[y][mouseX/167]==0) return y;
    }

    return -1;//else its full
  }
  void replace(int x, int y) {//see if the value is =0, if yes then draw X or O

    if (whereBottom()>=0&&mouseX<=1167&&mouseY<=1002&&score[whereBottom()][mouseX/167]==0)
    {
      //if score[6,7] use variable long to check if it can fall down the array --> check if the one underneath is 0 or not
      player++;//only when the mouse clicked within the 900x900 grid do you increase player
      if (player%2==0) {
        score[whereBottom()][mouseX/167]=5;
        strokeWeight(20);
        fill(200, 200, 0);
        circle(x+83.3, (whereBottom()+1)*167+83.3, 50);
      } else {

        score[whereBottom()][mouseX/167]=1;
        strokeWeight(20);
        fill(30, 20, 120);
        circle(x+83.3, (whereBottom()+1)*167+83.3, 50);
      }
    }
  }
  void printOut() {
    for (int row= 0; row < score.length; row++)//goes through rows
    {
      for (int col = 0; col < score[row].length; col++)//goes through columns
      {
        System.out.print("  "+score[row][col]); //print out array
      }
      System.out.println(); //Makes a new row
    }
  }

  void check() {
    //horizontal check
    for (int i=0; i<=5; i++) {
      int count=0;
      for (int j=0; j<=3; j++) {
        for (int k=0; k<=3; k++) {
          count+=score[i][j+k];
          //count+=score[i][j]+score[i][j+1]+score[i][j+2]+score[i][j+3];
        }
        if (count==20||count==4)winner();
        else count=0;//for each loop, each if the 4 values add up to 20 or 4
      }
    }
    //vertical check
    for (int j=0; j<=6; j++) {
      int count=0;
      for (int i=3; i<=5; i++) {
        for (int k=0; k<=3; k++) {
          count+=score[i-k][j];
          //count+=score[i][j]+score[i-1][j]+score[i-2][j]+score[i-3][j];
        }
        if (count==20||count==4)winner();

        else count=0;//callwinner
      }
    }
    //right diagonal check
    for (int i=0; i<=3; i++) {
      int count=0;
      for (int j=0; j<=2; j++) {
        for (int k=0; k<=3; k++) {
          count+=score[j+k][i+k];

          // if ((score[j][i]+score[j+1][i+1]+score[j+2][i+2]+score[j+3][i+3]==20)||(score[j][i]+score[j+1][i+1]+score[j+2][i+2]+score[j+3][i+3]==4))
          //winner();
        }
        if ((count==20)||(count==4))winner();
        else count=0;
      }
    }
    //left diagonal check
    for (int i=0; i<=3; i++) {
      int count=0;
      for (int j=0; j<=2; j++) {
        for (int k=0; k<=3; k++) {
          count+=score[j+k][i+(3-k)];

          // if ((score[j][i+3]+score[j+1][i+2]+score[j+2][i+1]+score[j+3][i]==20)||(score[j][i+3]+score[j+1][i+2]+score[j+2][i+1]+score[j+3][i]==4))
          // winner();
        }
        if ((count==20)||(count==4))winner();
        else count=0;
      }
    }
  }

  void winner() {
    System.out.print("winner");
    if (player%2==0)
    {
      text("yellow won", 1200, 400);// if the value is 20 or 4 and the player is even, yellow wins
      points1++;
      thereisWinner=true;
    }

    if (player%2==1)
    {
      text("blue won", 1200, 400);// else blue wins
      points2++;
      thereisWinner=true;
    }
  }
  void tie() {// if the two tie then its a tie. 
    if (player>=42&&thereisWinner==false)
    {
      text("It's a tie", 1200, 400);
      itsaTie=true;
    }
  }
}
