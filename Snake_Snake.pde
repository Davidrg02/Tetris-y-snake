class Snake {
  PVector pos;
  PVector vel;
  ArrayList<PVector> hist;
  int len;
  int moveX = 0;
  int moveY = 0;

  Snake() {
    pos = new PVector(0, 0);
    vel = new PVector();
    hist = new ArrayList<PVector>();
    len = 0;
  }

  void update() {//actualización de cada bloque de la snake
    hist.add(pos.copy());
    pos.x += vel.x*grid;
    pos.y += vel.y*grid;
    moveX = int(vel.x);
    moveY = int(vel.y);

    pos.x = (pos.x + 500) % 500;
    pos.y = (pos.y + 500) % 500;

    if (hist.size() > len) {
      hist.remove(0);
    }

    for (PVector p : hist) {//choque de la cabeza de la serpiente con el cuerpo del snake
      if (p.x == pos.x && p.y == pos.y) {
        dead = true;
        gameover = true;
        if (len > highscore) highscore = len;
      }
    }
  }

  void eat() {//aumento de longitud de la snake
    if (pos.x == food.x && pos.y == food.y) {
      len++;
      if (speed > 5) speed--;
      newFood();
    }
  }

  void show() {//pintar la snake
    noStroke();
    fill(20,225,0);
    rect(pos.x, pos.y, grid, grid);
    for (PVector p : hist) {
      rect(p.x, p.y, grid, grid);
    }
  }
}
