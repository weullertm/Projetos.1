float yRaquetes; 
float xBola;
float yBola;
int pontos;
boolean parado;
float dx;
float dy;
float distancia;
float distancia2;
String mensagem;

void setup() {
  parado = true;
  background(0);
  size(600, 600);
  noStroke();
  ellipseMode(CENTER);
  rectMode(CENTER);
  mensagem = "Pressione ENTER para iniciar!";
  text(mensagem, 220, 300);
}

void draw() {
  if (parado == false) { //jogo parado na tela inicial
    conteudos(); //só chama quando aperta o enter
  }
}

void conteudos() {
  background(0);
  rect(20, yRaquetes, 20, 80); //raquete esquerda
  rect(580, yRaquetes, 20, 80); //raquete direita
  ellipse(xBola, yBola, 20, 20); //bola
  text("Pontos: " + pontos, 280, 20); //pontuação
  xBola += dx; //incremento em x
  yBola += dy; //incremento em y
  distancia = dist(30, yRaquetes, xBola, yBola); //verificação do choque com a raquete esquerda
  distancia2 = dist(570, yRaquetes, xBola, yBola); //verificação do choque com a raquete direita

  if (xBola < 0 || xBola > 600) { //perda de ponto se todas as paredes
    xBola = 300; //reinicia do centro
    yBola = 300;
    pontos -= 1;
  }

  if (yBola < 0 || yBola > 600) { //muda o sentido conforme toda o piso ou o teto
    dy = -dy;
  }

  if ((xBola < 30 && distancia < 80) || (xBola > 570 && distancia2 < 80)) { //choques com as raquetes inverte o sentido
    dx = -dx;
  }

  if (pontos == 0) { //finaliza o jogo e retorna à tela inicial
    background(0);
    parado = true;
    xBola = 300;
    yBola = 300;
    dx = 0;
    dy = 0;
    mensagem = "VOCÊ PERDEU! Pressione ENTER para recomeçar!";
    text(mensagem, 180, 300);
  }
}

void keyPressed() {
  if (keyCode == ENTER && parado == true) { //comando para dar início ou reinício ao jogo
    xBola = 300;
    yBola = 300;
    dx = random(1, 5);
    dy = random(1, 5);
    yRaquetes = 300;
    parado = false;
    pontos = 5;
  }

  if (keyCode == DOWN && yRaquetes < 560) { //movimentação das raquetes para baixo
    yRaquetes += 20;
  }

  if (keyCode == UP && yRaquetes > 40) { //movimentação das raquetes para cima
    yRaquetes -= 20;
  }
}
