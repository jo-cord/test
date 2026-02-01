
Bal b;
balvang v;

int score = 0;
float snelheid = 3;
float maxSnelheid = 12;

void setup() {
  size(600, 400);
  redoo();
}

void draw() {
  background(30, 30, 50);

  fill(255);
  textSize(20);
  text("Score: " + score, 10, 25);

  v.update();
  v.teken();

  b.update();
  b.teken();


  if (raak(b, v)) {
    score++;
    snelheid = min(3 + score * 0.5, maxSnelheid);
    b = newbal(snelheid);
  }

  if (b.y - b.r > height) {
    redoo();
  }
}

void keyPressed() {
  if (keyCode == LEFT) v.links = true;
  if (keyCode == RIGHT) v.rechts = true;
}

void keyReleased() {
  if (keyCode == LEFT) v.links = false;
  if (keyCode == RIGHT) v.rechts = false;
}

void redoo() {
  score = 0;
  snelheid = 3;
  b = newbal(snelheid);
  v = new balvang(width/2 - 50, height - 40);
}

Bal newbal(float s) {
  return new Bal(random(20, width - 20), -20, s);
}

boolean raak(Bal bal, balvang balvang) {
  float balboven = bal.y - bal.r + bal.snelheid;
  float balonder = bal.y + bal.r + bal.snelheid;
  boolean checkX = 
      bal.x + bal.r > balvang.x && 
      bal.x - bal.r < balvang.x + balvang.b;
  boolean checkY = 
      balonder > balvang.y && 
      balboven < balvang.y + balvang.h;

  return checkX && checkY;
}

class Bal {
  float x, y;
  float snelheid;
  float r = 20;

  Bal(float x, float y, float snelheid) {
    this.x = x;
    this.y = y;
    this.snelheid = snelheid;
  }

  void update() {
    y += snelheid;
  }

  void teken() {
    noStroke();
    fill(255, 200, 0);
    ellipse(x, y, r*2, r*2);
  }
}

class balvang {
  float x, y;
  float b = 100;
  float h = 20;
  float s = 7;

  boolean links = false;
  boolean rechts = false;

  balvang(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    if (links) x -= s;
    if (rechts) x += s;

    if (x < 0) x = 0;
    if (x + b > width) x = width - b;
  }

  void teken() {
    noStroke();
    fill(0, 200, 255);
    rect(x, y, b, h);
  }
}
