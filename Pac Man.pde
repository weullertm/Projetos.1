int [][] M = new int[30][30];
int x1;
int y1;
String dir;
String texto;

void setup() {
  x1 = 1;
  y1 = 1;
  dir = "R";
  noStroke();
  size(630, 630);
  background(0);
  ellipseMode(CORNER);
  colorMode(HSB, 360, 100, 100);

  criar();
}

void draw() {
  desenhar();
  desenharPlayer();
  acabar();
}

void criar() {
  for (int i = 0; i <= 20; i++) {
    for (int j = 0; j <= 20; j++) {
      if ((j == 0 || j == 20) && i <= 20) {
        M[i][j] = 1;
      } else if ((i == 0 || i == 20) && j <= 20) {
        M[i][j] = 1;
      } else if ((i == 2 || i == 18) && j <= 16 && j >= 2) {
        M[i][j] = 1;
      } else if ((j == 2 || j == 18) && i <= 18 && i >= 2) {
        M[i][j] = 1;
      } else if ((i == 4 || i == 16) && j <= 16 && j >= 4) {
        M[i][j] = 1;
      } else if ((j == 4 || j == 16) && i <= 14 && i >= 4) {
        M[i][j] = 1;
      } else if ((i == 6 || i == 14) && j <= 12 && j >= 6) {
        M[i][j] = 1;
      } else if ((j == 6 || j == 14) && i <= 14 && i >= 6) {
        M[i][j] = 1;
      } else if ((j >= 9 && j <= 11) && i <= 11 && i >= 9) {
        M[i][j] = 1;
      } else {
        M[i][j] = 0;
      }
    }
  }
}

void desenhar() {
  int largura = 30;
  for (int i = 0; i <= 20; i++) {
    for (int j = 0; j <= 20; j++) {
      if (M[i][j] == 0) {
        fill(240, 100, 100);
        rect(i*30, j*30, largura, largura);
      } else {
        fill(49, 100, 100);
        rect(i*30, j*30, largura, largura);
      }
    }
  }
}

void desenharPlayer() {
  fill(49, 100, 0);
  switch(dir) {
  case "U":
    arc(x1*30, y1*30, 30, 30, 0-QUARTER_PI, PI+QUARTER_PI);
    break;
  case "D":
    arc(x1*30, y1*30, 30, 30, HALF_PI+QUARTER_PI, PI*2+QUARTER_PI);
    break;
  case "L":
    arc(x1*30, y1*30, 30, 30, PI+QUARTER_PI, PI*3-QUARTER_PI);
    break;
  case "R":
    arc(x1*30, y1*30, 30, 30, 0+QUARTER_PI, PI*2-QUARTER_PI);
    break;
  }
}

void keyPressed() {
  if (keyCode == RIGHT && M[x1+1][y1]==0) {
    x1 = x1 + 1;
    dir = "R";
  }
  if (keyCode == LEFT && M[x1-1][y1]==0) {
    x1 = x1 - 1;
    dir = "L";
  }
  if (keyCode == DOWN && M[x1][y1+1]==0) {
    y1 = y1 + 1;
    dir = "D";
  }
  if (keyCode == UP && M[x1][y1-1]==0) {
    y1 = y1 - 1;
    dir = "U";
  }
}

void acabar() {
  if ((x1*30 > 230 && x1*30 < 378) && (y1*30 > 230 && y1*30 < 378)) {
    fill(360);
    texto = "Fim de jogo!";
    text(texto, 280, 315);
  }
}
