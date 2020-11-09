int grid = 20; //How big each grid square will be
PVector food;
int speed = 10;
boolean dead = true;
int highscore = 0;
Snake snake;

void newFood() {// Comida de la serpiente, aparece en unas coordenadas aleatorias
  food.x = floor(random(500));
  food.y = floor(random(500));
  food.x = floor(food.x/grid) * grid;
  food.y = floor(food.y/grid) * grid;
}

void mousePressed() {//se inicia el juego
  if (dead) {
    snake = new Snake();
    newFood();
    speed = 10;
    dead = false;
  }
}

void cuadricula2() {
    //Snake
  stroke(#C4C4C4);
  for(int i=0; i<=25; i++){//líneas horizontales
    line(i*20, 0, i*20, 500);
    strokeWeight(1);
  }
  for(int j=0; j<=25; j++){//líneas verticales
    line(0, j*20, 500, j*20);
    strokeWeight(1);
  } 
}

void fondo(){//cuadrado negro debajo del juego de snake
  fill(0);
  rect(720,0,500,500); 
}
