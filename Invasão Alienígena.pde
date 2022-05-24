boolean parado = true;
int pontos = 0;
int tiros = 10;
String mensagem = " ";
void setup() {
  size(400, 700);
  colorMode(HSB, 360, 100, 100, 100);
  ellipseMode(CENTER);
  noStroke();
}
float w, h; //variáveis para manter a proporção
int b1y, b2y, b3y, b4y; //variáveis para a movimentação das bombas no eixo y
void draw() {
  background(60, 38, 94, 100);
  w = width/400.0;
  h = height/700.0;
  //pontuação e municões
  fill(0);
  text("Pontos: "+pontos, 10*w, 10*h);
  text("Tiros: "+tiros, 340*w, 10*h);
  text(mensagem, 150*w, 350*h);
  //água
  fill(172, 38, 94, 100);
  rect(0*w, 500*h, 400*w, 150*h);
  //cidade
  fill(0);
  rect(0*w, 649*h, 400*w, 50*h);
  rect(50*w, 580*h, 40*w, 70*h);
  rect(110*w, 550*h, 50*w, 100*h);
  rect(190*w, 600*h, 60*w, 50*h);
  rect(300*w, 560*h, 80*w, 90*h);
  //escudo
  fill(18, 0, 94, 100);
  rect(0*w, 450*h, 400*w, 50*h);
  //nave
  fill(268, 38, 94, 100);
  rect(50*w, 50*h, 300*w, 51*h);
  rect(50*w, 100*h, 50*w, 50*h);
  rect(150*w, 100*h, 50*w, 50*h);
  rect(200*w, 100*h, 50*w, 50*h);
  rect(300*w, 100*h, 50*w, 50*h);
  arc(200*w, 50*h, 300*w, 80*h, 180, 360);
  //bombas na posição inicial
  fill(18, 38, 94, 100);
  ellipse(75*w, 150*h + b1y*h, 20*w, 20*h);
  ellipse(175*w, 150*h + b2y*h, 20*w, 20*h);
  ellipse(225*w, 150*h + b3y*h, 20*w, 20*h);
  ellipse(325*w, 150*h + b4y*h, 20*w, 20*h);

  if (!parado) {//incrementar os valores de y das bombas
    mensagem = " ";
    b1y = b1y + (int)random(5);
    b2y = b2y + (int)random(5);
    b3y = b3y + (int)random(5);
    b4y = b4y + (int)random(5);
  }

  if (b1y >= 500*h || b2y >= 500*h || b3y >= 500*h || b4y >= 500*h) { //verificar se as bombas tocaram a cidade
    mensagem = "VOCÊ PERDEU!";
    parado = true;
    b1y = 0;
    b2y = 0;
    b3y = 0;
    b4y = 0;
    pontos = 0;
  }
}
void mousePressed() {
  if (mouseX>=0 && mouseX<=400 && mouseY>=450*h && mouseY<=500*h) { //destruir as bombas, marcar pontuações e municões
    if (b1y >= 300*h && b1y <= 350*h) {
      b1y = 0;
      tiros = tiros - 1;
      pontos = pontos + 1;
    }
    if (b2y >= 300*h && b1y <= 350*h) {
      b2y = 0;
      tiros = tiros - 1;
      pontos = pontos + 1;
    }
    if (b3y >= 300*h && b1y <= 350*h) {
      b3y = 0;
      tiros = tiros - 1;
      pontos = pontos + 1;
    }
    if (b4y >= 300*h && b1y <= 350*h) {
      b4y = 0;
      tiros = tiros - 1;
      pontos = pontos + 1;
    }
  } else {
    tiros = 10; //recarregar
  }
}
void keyPressed() {
  if (keyCode == ENTER) parado = false; //iniciar o jogo
}
