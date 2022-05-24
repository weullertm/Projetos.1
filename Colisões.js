var circleRadius = 10; // tamanho da bolas de acordo com o raio
var vetor; //cria um vetor

function setup() {
  createCanvas(300, 300);

  vetor = []; //atribui vazios

  for (var i = 0; i < 20; i++) {
    var b = new bola(random(0, width), random(0, height), circleRadius); //cria posições aleatórias e raio de 10
    vetor.push(b); //atribui aos vazios os valores aleatórios x e y e o r de 20 bolas
    console.log(vetor[i]); //imprime no console os valores
  }
}

function draw() {
  background(64);
  stroke(255);
  fill(255, 0, 0);

  for (var i = 0; i < vetor.length; i++) { //chama a função atualiza em todos as bolas
    vetor[i].atualiza();
  }
}

class bola {
  constructor(nx, ny, nraio) { //constrói todas as bolas
    this.x = nx; //posições iniciais aleatórias
    this.y = ny;
    this.dx = random(-1, 1); //atribui a primeira direção das bolas
    this.dy = random(-1, 1);
    this.raio = nraio; //raios
    this.cor = color(255, 0, 0); //cor vermelha
  }
  
  bater(outra) { //verifica os choques a partir das posições e raios de bola e bola com todas as outras
    var bateu = dist(this.x, this.y, outra.x, outra.y) < this.raio + outra.raio;
    return bateu; //retorna um boolean true
  }
  
  mostra() {
    fill(this.cor); //dá cor à elipse
    ellipse(this.x, this.y, this.raio * 2, this.raio * 2); //cria a elipse
  }

  atualiza() { //mudar direções e cores das bolas de acordo com choques entre bolas e bolas e bolas paredes
    this.x += this.dx; //mover as bolas adicionando os dx e dy
    this.y += this.dy;

    if (this.x + this.raio > width) { //parede direita
      this.dx = -abs(this.dx);
    }
    if (this.x - this.raio < 0) { //parede esquerda
      this.dx = abs(this.dx);
    }

    if (this.y + this.raio > height) { //piso
      this.dy = -abs(this.dy);
    }
    if (this.y - this.raio < 0) { //teto
      this.dy = abs(this.dy);
    }

    this.cor = color(255, 0, 0); //atribui o vermelho
    for (var i = 0; i < vetor.length; i++) { //varre o vetor
      if (this != vetor[i]) { //se as bolas forem diferentes
        if (vetor[i].bater(this)) { //verificar os choques entre todos
          this.cor = color(0, 255, 0); //mudar para verde
        }
      }
    }

    this.mostra(); //mostrar as atualizações
  }
}
