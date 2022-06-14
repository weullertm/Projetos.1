Player p;
Oponente o;
int c0 = 5;
int c1 = -5;
int c2;
boolean perdeu = false;
boolean ganhou = false;
boolean voltando = false;
int [][] mapa;

void setup() {
  stroke(180, 100, 100);
  size(600, 500);
  criaMapa();
  p = new Player();
  o = new Oponente();
}

void draw() {
  background(80);
  mostraMapa();
  p.update();
  o.update();
}

void criaMapa() {
  mapa = new int [][] {
    {0, int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), 3, 0},
    {0, int(random(1, 3)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, int(random(1, 3)), 0},
    {0, int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), 0},
    {0, int(random(1, 3)), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
    {0, int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), 0},
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, int(random(1, 3)), 0},
    {0, 3, int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), int(random(1, 3)), 0},
    {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4},
  };
}

void mostraMapa() {
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 12; j++) {
      switch(mapa[i][j]) {
      case 0:
        fill(200);
        rect(j * 50, i * 50, 50, 50);
        break;
      case 1:
        fill(255);
        rect(j * 50, i * 50, 50, 50);
        break;
      case 2:
        fill(0);
        rect(j * 50, i * 50, 50, 50);
        break;
      case 3:
        fill(255, 0, 0);
        rect(j * 50, i * 50, 50, 50);
        break;
      case 4:
        fill(255);
        rect(j * 50, i * 50, 50, 50);
        fill(0);
        text(j + 1, j * 50 + 20, 480);
      }
    }
  }
}

class Player {
  float x, y, dx, dy, t, tamanho;
  Player() {
    this.x = 74;
    this.y = 425;
    this.t = 0;
    this.dx = 0;
    this.dy = 0;
    this.tamanho = 25;
  }

  void update() {
    this.x = constrain(this.x, 75, 525);

    if (this.t <= 1) {
      this.t = 0;
      this.dx = 0;
      this.dy = 0;
      voltando = false;
    } else {
      if (this.x > 525 && this.x < 75) {
        this.dy = 0;
        this.dx = 0;
      }

      if (this.y == 325 || this.y == 125) {
        if (voltando == false) {
          if (this.x > 75 && this.x < 525) {
            this.dx = -5;
            this.dy = 0;
          } else if (this.x == 75) {
            this.dx = 0;
            this.dy = -5;
          } else if (this.x == 525) {
            this.dx = -5;
            this.dy = 0;
          }
        } else {
          if (this.x > 75 && this.x < 525) {
            this.dx = 5;
            this.dy = 0;
          } else if (this.x == 75) {
            this.dx = 5;
            this.dy = 0;
          } else if (this.x == 525) {
            this.dx = 0;
            this.dy = 5;
          }
        }
      } else if (this.y == 425 || this.y == 225 || this.y == 25) {
        if (voltando == false) {
          if (this.x > 75 && this.x < 525) {
            this.dx = 5;
            this.dy = 0;
          } else if (this.x == 75) {
            this.dx = 5;
            this.dy = 0;
          } else if (this.x == 525) {
            this.dx = 0;
            this.dy = -5;
          }
        } else {
          if (this.x > 75 && this.x < 525) {
            this.dx = -5;
            this.dy = 0;
          } else if (this.x == 75) {
            this.dx = 0;
            this.dy = 5;
          } else if (this.x == 525) {
            this.dx = -5;
            this.dy = 0;
          }
        }
      } else if (this.x == 75) {
        if (voltando == false) {
          if ((this.y > 25 && this.y < 125) || (this.y > 225 && this.y < 325)) {
            this.dx = 0;
            this.dy = -5;
          } else if (this.y == 25 || this.y == 225) {
            this.dx = 5;
            this.dy = 0;
          } else if (this.y == 125 || this.y == 325) {
            this.dx = 0;
            this.dy = -5;
          }
        } else {
          if ((this.y > 25 && this.y < 125) || (this.y > 225 && this.y < 325)) {
            this.dx = 0;
            this.dy = 5;
          } else if (this.y == 25 || this.y == 225) {
            this.dx = 0;
            this.dy = -5;
          } else if (this.y == 125 || this.y == 325) {
            this.dx = 0;
            this.dy = 5;
          }
        }
      } else if (this.x == 525) {
        if (voltando == false) {
          if ((this.y > 125 && this.y < 225) || (this.y > 325 && this.y < 425)) {
            this.dx = 0;
            this.dy = -5;
          } else if (this.y == 125 || this.y == 325) {
            this.dx = -5;
            this.dy = 0;
          } else if (this.y == 225 || this.y == 425) {
            this.dx = 0;
            this.dy = -5;
          }
        } else {
          if ((this.y > 125 && this.y < 225) || (this.y > 325 && this.y < 425)) {
            this.dx = 0;
            this.dy = 5;
          } else if (this.y == 125 || this.y == 325) {
            this.dx = 0;
            this.dy = -5;
          } else if (this.y == 225 || this.y == 425) {
            this.dx = -5;
            this.dy = 0;
          }
        }
      }
    }

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 12; j++) {
        if (mapa[i][j] == 1) {
          if (this.t < 1 && this.x == j * 50 + 25 && this.y == i * 50 + 25) {
            voltando = true;
            if ((this.x <= 525 && this.x > 75) && (this.y == 425 || this.y == 225 || this.y == 25)) {
              p.mover(-c0, 0, c2);
            } else if (this.x == 525 && (this.y == 125 || this.y == 175 || this.y == 375 || this.y == 325)) {
              p.mover(0, -c1, c2);
            } else if ((this.x < 525 && this.x > 75) && (this.y == 125 || this.y == 175 || this.y == 375 || this.y == 325)) {
              p.mover(c0, 0, c2);
            } else if (this.x >= 75 && (this.y == 325 || this.y == 125)) {
              p.mover(c0, 0, c2);
            } else if (this.x == 75 && (this.y == 225 || this.y == 275 || this.y == 75 || this.y == 25)) {
              p.mover(0, -c1, c2);
            } else if ((this.x > 75 && this.x < 525) && (this.y == 225 || this.y == 275 || this.y == 75 || this.y == 25)) {
              p.mover(-c0, 0, c2);
            }
          }
        }

        if (mapa[i][j] == 2) {
          if (this.t < 1 && this.x == j * 50 + 25 && this.y == i * 50 + 25) {
            this.t = 0;
            this.dx = 0;
            this.dy = 0;
            voltando = false;
          }
        }
      }
    }

    this.t--;
    this.x += this.dx;
    this.y += this.dy;

    fill(0, 0, 250);
    ellipse(this.x, this.y, this.tamanho, this.tamanho);
    println(this.x, this.y, this.t, voltando);

    if (this.y <= 25 && this.x >= 500) {
      this.dx = 0;
      this.dy = 0;
      o.dy = 0;
      o.dx = 0;
      o.tamanho = 0;
      ganhou = true;
      background(220);
      fill(0);
      textSize(15);
      text("VOCÊ GANHOU! Pressione ENTER para jogar novamente!", 120, 250);
    }
  }

  void mover(int nx, int ny, int dt) {
    this.dx = nx;
    this.dy = ny;
    this.t = dt;
  }
}

class Oponente {
  float x, y, dx, dy, tamanho;
  Oponente() {
    this.x = 74;
    this.y = 425;
    this.dx = 1.5;
    this.dy = 0;
    this.tamanho = 25;
  }

  void update() {
    if (this.y >= 425 && this.x >= 525) {
      this.dx = 0;
      this.dy = -1.5;
    }

    if (this.y <= 325 && this.x >= 525) {
      this.dx = -1.5;
      this.dy = 0;
    }

    if (this.y <= 325 && this.x <= 75) {
      this.dx = 0;
      this.dy = -1.5;
    }

    if (this.y <= 225 && this.x <= 75) {
      this.dx = 1.5;
      this.dy = 0;
    }

    if (this.y <= 225 && this.x >= 525) {
      this.dx = 0;
      this.dy = -1.5;
    }

    if (this.y <= 125 && this.x >= 525) {
      this.dx = -1.5;
      this.dy = 0;
    }

    if (this.y <= 125 && this.x <= 75) {
      this.dx = 0;
      this.dy = -1.5;
    }

    if (this.y <= 25 && this.x <= 75) {
      this.dx = 1.5;
      this.dy = 0;
    }

    this.x += this.dx;
    this.y += this.dy;

    fill(255, 255, 0);
    ellipse(this.x, this.y, this.tamanho, this.tamanho);

    if (this.y <= 25 && this.x >= 500) {
      this.dx = 0;
      this.dy = 0;
      perdeu = true;
      background(220);
      fill(0);
      textSize(15);
      text("VOCÊ PERDEU! Pressione ENTER para recomeçar!", 150, 250);
    }
  }
}

void mousePressed() {
  if (p.t < 1) {
    if (mouseY > 450) {
      for (int i = 0; i < 12; i++) {
        if (mouseX >= i * 50) {
          c2 = i * 10 + 11;
          p.mover(c0, c1, c2);
        }
      }
    }
  }
}

void keyPressed() {
  if (perdeu == true || ganhou == true) {
    if (keyCode == ENTER) {
      p = new Player();
      o = new Oponente();
      criaMapa();
      mostraMapa();
      perdeu = false;
      ganhou = false;
    }
  }
}
