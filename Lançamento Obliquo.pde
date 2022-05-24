float tAtual = 0;
float v0 = 100;
float ang;
float dAtual;
float hAtual;
float g = - 9.8;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(1200, 600);
  stroke(255);
  background(0);
}

void draw() {
  mostraMundo();
  for (ang = 0; ang < 91; ang = ang + 15) {
    dAtual = MRU(v0, tAtual / 60.0, ang);
    hAtual = MRUV(v0, g, tAtual / 60.0, ang);
    fill(300 - ang * 3, 100, 100);
    noStroke();
    ellipse(840, ang * 2 + 25, 10, 10);
    ellipse(dAtual, 600 - hAtual, 10, 10);
    fill(255);
    textSize(15);
    text("Ângulo = " + ang + " °", 850, ang * 2 + 30);
    println(tAtual, dAtual, hAtual);
  }
  tAtual++;
  if (hAtual < 0) {
    background(0);
    recomecar();
    mostraMundo();
  }
}

void mostraMundo() {
  for (int i = 0; i < 24; i++) {
    line(i * 50, 0, i * 50, 1200);
    line(0, i * 50, 1200, i * 50);
  }
}

void recomecar() {
  tAtual = 0;
  dAtual = 0;
  hAtual = 0;
}

float MRU(float v, float t, float a) {
  float d;
  d = v * cos(radians(a)) * t;
  return(d);
}

float MRUV(float v, float g, float t, float a) {
  float h;
  h = v * sin(radians(a)) * t + g * t * t / 2.0;
  return(h);
}
