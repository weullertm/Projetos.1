var p;
var inimigos;
var tiro;
var tiros;
var N = 8;
var t = 0;
var vidas = 4;
var pontos = 0;
var perdeu = false;
var ganhou = false;

function setup() {
  createCanvas(600, 500);
  noStroke();
   
  p = new Player();
  tiro = new Tiro();
  inimigos = [];
  tiros = [];
 
  for(var i = 0; i < N; i++) {
    inimigos.push(new Inimigos());
    tiros.push(new TirosInimigos());
  }
 
}

function draw() {
  background(220);
  t++;
  cenario();
  p.update();
  tiro.update();
  for(var i = 0; i < N; i++) {
    inimigos[i].update();
    tiros[i].update();
  }
}

function cenario() {
  fill(150);
  rect(0, 0, 30, height);
  rect(570, 0, 30, height);
  fill(100);
  rect(0, 400, width, 100);
  text("Vidas: " + vidas, 500, 15);
  text("Pontos: " + pontos, 500, 30);
}

class Player {
  constructor() {
    this.x = 300;
    this.y = 380;
    this.dx = 0;
  }
 
  update() {
    this.x += this.dx;
    this.x = constrain(this.x, 50, width - 50);
   
    for(var i = 0; i < N; i++) {
      var d = tiros[i].dist(this.x, this.y);
     
      //para quando encosta no tiro no chão
      if (d < 25) {
        this.dx = 0;
        this.x = this.x;
      }
    }
   
    fill(50);
    ellipse(this.x, this.y, 40, 40);
  }
 
  mover(dx) {
    this.dx = dx;
  }
   
  dist(x, y) {
    return dist(x, y, this.x, this.y);
  }
}

class Tiro {
  constructor() {
    this.x = 0;
    this.y = 0;
    this.dy = 0;
  }
 
  update() {
    this.y += this.dy;
   
    for(var i = 0; i < N; i++) {
      var d = inimigos[i].dist(this.x, this.y);
      var d2 = tiros[i].dist(this.x, this.y);
     
      //verifica o choque entre os tiros e os anula
      if (d2 < 10) {
        this.y = p.y;
        this.dy = p.dy;
        tiros[i].y = inimigos[i].y;
        tiros[i].dy = inimigos[i].dy;
      }
     
      //verifica o choque entre o tiro e os inimigos, conta ponto e anula inimigo atingido e seu respectivo tiro
      if (d < 17.5) {
        pontos++;
        this.y = p.y;
        this.dy = p.dy;
        inimigos[i].x = 0;
        inimigos[i].y = 0;
        inimigos[i].dy = 0;
        inimigos[i].tamanho = 0;
        tiros[i].x = 0;
        tiros[i].y = 0;
        tiros[i].dy = 0;
        tiros[i].tamanho = 0;
      }
    }
     
    fill(255, 255, 0);
    ellipse(this.x, this.y, 10, 10);
   
    if (pontos >= 8) {
      background(220);
      fill(0);
      textSize(15);
      text("VOCÊ GANHOU! Pressione ENTER para jogar novamente!", 120, 250);
      ganhou = true;
    }
  }
 
  atirar(nx, ny, delta) {
    this.x = nx;
    this.y = ny;
    this.dy = delta;
  }
}

class Inimigos {
  constructor() {
    this.x = 300;
    this.y = random(50, 200);
    this.dx = random(-5, 5);
    this.tamanho = 25;
  }
 
  update() {
    this.x += this.dx;
   
    //troca o sentido do movimento a cada 0.5 s
    if (t == 30 || t == 60 || t == 90 || t == 120 && this.x > 50 && this.x < 550) {
      this.dx = random(-5, 5);
    }
   
    //troca o sentido quando se aproxima das paredes
    if (this.x < 50 || this.x > 550) {
      this.dx = -this.dx;
    }
   
    fill(100);
    ellipse(this.x, this.y, this.tamanho, this.tamanho);
  }
 
  dist(x, y) {
    return dist(x, y, this.x, this.y);
  }
}

class TirosInimigos {
  constructor() {
    this.x = 0;
    this.y = 0;
    this.dy = 0;
    this.tamanho = 0;
  }
 
  update() {    
    if (t > 120) {
      for(var i = 0; i < N; i++) {
        //atira se o Player estiver na faixa de tiro
        if(inimigos[i].x > p.x - 150 && inimigos[i].x < p.x + 150) {  
          tiros[i].atirar(inimigos[i].x, inimigos[i].y, 5);
        } else {
          //não atira quando não estiver na faixa de tiro
          this.tamanho = 0;
          tiros[i].atirar(0, 0, 0)
        }
      }
     
      t = 0;
    }
   
    //tiros inimigos só na faixa de jogo
    if (this.x > 50) {
      this.tamanho = 10;
    } else {
      this.tamanho = 0;
    }
   
    //verifica o choque entre os tiros e o Player
    var d = p.dist(this.x, this.y);
   
    if (d < 25 && this.y < 400) {
      vidas--;
      this.y = inimigos.y;
    }
   
    this.y += this.dy;

    var t1 = 0;
    //mantém o tiro no chão
    if (this.y > 400) {
      this.y = 400;
      t1++;
    }
   
    //após 2 s o tiro desaparece do chão
    if (t1 > 120) {
      this.y = inimigos.y;
      t = 0;
    }
                 
    fill(255, 0, 0);
    ellipse(this.x, this.y, this.tamanho, this.tamanho);
   
    if (vidas <= 0) {
      background(220);
      fill(0);
      textSize(15);
      text("VOCÊ PERDEU! Pressione ENTER para recomeçar!", 150, 250);
      perdeu = true;
    }

  }

  atirar(nx, ny, delta) {
    this.x = nx;
    this.y = ny;
    this.dy = delta;
  }
 
  dist(x, y) {
    return dist(x, y, this.x, this.y);
  }
}

function keyPressed() {
  if (keyCode == LEFT_ARROW) {
    p.mover(-5);
  }
 
  if (keyCode == RIGHT_ARROW) {
    p.mover(5);
  }
 
  if (keyCode == UP_ARROW) {
    tiro.atirar(p.x, p.y, -10);
  }
 
  if (perdeu == true || ganhou == true) {
    if (keyCode == ENTER) {
        p = new Player();
        tiro = new Tiro();
        inimigos = [];
        tiros = [];
 
        for(var i = 0; i < N; i++) {
          inimigos.push(new Inimigos());
          tiros.push(new TirosInimigos());
        }
     
        vidas = 4;
        pontos = 0;
        perdeu = false;
        ganhou = false;
    }
  }
}

function keyReleased() {
  p.mover(0);
}
