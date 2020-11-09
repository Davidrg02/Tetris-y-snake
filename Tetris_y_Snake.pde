void setup() {
  //tetris
  size(1250, 660);
  figura = new Figura();
  figura.esLibre = true;
  figuraSiguiente = new Figura();
  fondo = new Fondo();
  //snake
  snake = new Snake();
  food = new PVector();
  newFood();
}

void draw() {
  ////////////////////////////Tetris
  background(#14C298);
  if(gameover){
    textSize(60);
    //
    fill(0);
    text("Gameover :(", 147, 252);
    fill(#FFFFFF);
    text("Gameover :(", 150, 250);
    //
    fill(0);
    text("Tu Puntaje: "+fondo.puntaje*100, 147, 347);
    fill(#FFFFFF);
    text("Tu Puntaje: "+fondo.puntaje*100, 150, 345);
    //
    fill(0);
    text("Para reiniciar"+'\n'+"presiona R", 147, 450);
    fill(#FFFFFF);
    text("Para reiniciar"+'\n'+"presiona R", 150, 448);
  }else{
    translate(0,0);
    fondo.mostrar();
    cuadricula1();//Dibuja la cuadrícula
    dibujarFiguras();
  }
  strokeWeight(5);
  line(690,0,690,660);
  
  ///////////////////////Snake
  strokeWeight(1);
  fondo();
  fill(255);
  if (!dead) {
    if (frameCount % speed == 0) {
      snake.update();
    }
    translate(720,0);
    cuadricula2();//cuadricula del snake
    snake.show();
    snake.eat();
    fill(255, 0, 0);
    rect(food.x, food.y, grid, grid);
    textAlign(LEFT);
    fill(0);
    text("Score: " + snake.len, 50, 550);
    fill(#FFFFFF);
    text("Score: " + snake.len, 52, 548);
  } else {
    translate(300,0);
    text("Snake Game\nClick to start" + "\nHighscore: " + highscore, width/2, height/2);
  }
}



void keyPressed(){
  if(keyCode == RIGHT){
    //Tetris
    figura.moverFigura("RIGHT");
    //Snake
    if (snake.moveX != -1) {
      snake.vel.x = 1;
      snake.vel.y = 0;
    }
  }
  if(keyCode == LEFT){
    //Tetris
    figura.moverFigura("LEFT");  
    //Snake
    if (snake.moveX != 1) {
      snake.vel.x = -1;
      snake.vel.y = 0;
    }
  }
  if(keyCode == DOWN) {
    //Tetris
    figura.moverFigura("DOWN");  
    //Snake
    if (snake.moveY != -1) {
      snake.vel.y = 1;
      snake.vel.x = 0;
    }
  }
  if(keyCode == UP){
    //Tetris
    figura.rotar();
    figura.rotar();
    figura.rotCont++;
    //Snake
    if (snake.moveY != 1) {
      snake.vel.y = -1;
      snake.vel.x = 0;
    }
  }
  if(keyCode == SHIFT){
    gameover = true; 
  }
  if(keyCode == 'R'){//la tecla P para reiniciar el juego
    setup();
    gameover = false;
  }
}
