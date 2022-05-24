final int MANHA = 0;
final int TARDE = 1;
final int NOITE = 2;
int tempoManha = 0;
int tempoTarde = 0;
int tempoNoite = 0;
int estadoTempo = MANHA;
float x, y;
float x1, y1, x2, y2, x3, y3;
float dx;
float cy = 5;
float dy;
boolean colidiu = false;

void setup() {
  size(600, 800);
  rectMode(CORNER);
  noStroke();
  colorMode(HSB, 360, 100, 100);
  x = 280;
  y = 700;
  x1 = random(150, 250);
  y1 = random(0, 50);
  x2 = random(250, 350);
  y2 = random(50, 100);
  x3 = random(350, 410);
  y3 = random(100, 150);
}

void draw() {
  background(0);
  cenario();
  carros();
  player();
  atualiza();
  colisoes();
  MEF();
  mostraTempo(estadoTempo);
}

void cenario() {
  fill(360);
  rect(150, 0, 300, 800);
}

void colisoes() {
  float distancia, distancia2, distancia3;
  distancia = dist(x, y, x1, y1);
  if (distancia < 40) {
    colidiu = true;
  }

  distancia2 = dist(x, y, x2, y2);
  if (distancia2 < 40) {
    colidiu = true;
  }

  distancia3 = dist(x, y, x3, y3);
  if (distancia3 < 40) {
    colidiu = true;
  }

  if (colidiu == true) {
    fill(0);
    textSize(20);
    text("CUIDADO!", 250, 400);
    colidiu = false;
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    dx -= 5;
  } else if (keyCode == RIGHT) {
    dx += 5;
  } else if (keyCode == UP) {
    dy -= 5;
    cy +=2;
  } else if (keyCode == DOWN) {
    dy += 5;
    cy -= 2;
  }
}

void MEF() {
  if (estadoTempo == MANHA) {
    tempoManha++;
  }

  if (estadoTempo == NOITE) {
    tempoNoite++;
  }

  if (estadoTempo == TARDE) {
    tempoTarde++;
  }

  if (tempoTarde >= 300) {
    tempoTarde = 0;
    estadoTempo = NOITE;
  }

  if (tempoNoite >= 300) {
    tempoNoite = 0;
    estadoTempo = MANHA;
  }

  if (tempoManha >= 300) {
    tempoManha = 0;
    estadoTempo = TARDE;
  }
}

void mostraTempo(int estado) {
  if (estado == MANHA) {
    fill(100, 100, 100);
    rect(0, 0, 150, 800);
    rect(450, 0, 150, 800);
  } else if (estado == TARDE) {
    fill(200, 100, 100);
    rect(0, 0, 150, 800);
    rect(450, 0, 150, 800);
  } else if (estado == NOITE) {
    fill(300, 100, 100);
    rect(0, 0, 150, 800);
    rect(450, 0, 150, 800);
  }
}

void player() {
  fill(0);
  rect(x, y, 40, 60);

  if (x < 150) {
    x = 150;
  }

  if (x > 410) {
    x = 410;
  }

  if (y < 0) {
    y = 0;
  }

  if (y > 740) {
    y = 740;
  }
}

void carros() {
  fill(120, 100, 100);
  rect(x1, y1, 40, 60);
  fill(240, 100, 100);
  rect(x2, y2, 40, 60);
  fill(350, 100, 100);
  rect(x3, y3, 40, 60);

  if (y1 > height) {
    x1 = random(150, 250);
    y1 = random(0, 50);
  }

  if (y2 > height) {
    x2 = random(250, 350);
    y2 = random(50, 100);
  }

  if (y3 > height) {
    x3 = random(350, 410);
    y3 = random(100, 150);
  }
}

void atualiza() {
  x += dx;
  y += dy;
  y1 += cy;
  y2 += cy;
  y3 += cy;
}

void keyReleased() {
  dx = 0;
  dy = 0;
}
