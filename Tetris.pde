Figura figura;
Figura figuraSiguiente;
Fondo fondo;
int nivel = 1;
boolean gameover;

void dibujarFiguras() {//función para que el draw() dibuje las figuras y sus métodos en el sketch
  figuraSiguiente.otros();
  figura.mostrarFigura();
  if(figura.verificarFondo(fondo)){
    figura.bajar(nivel);
  }else {
    figura.esLibre = false;
  }
  if(!figura.esLibre){
    fondo.impregnarFigura(figura); 
    figura = figuraSiguiente;
    figura.esLibre = true;
    figuraSiguiente = new Figura();
  }
}

void cuadricula1() {//Malla en el tablero
  //Tetris
  stroke(#C4C4C4);
  for(int i=0; i<=12; i++){//líneas horizontales
    line(i*30, 0, i*30, 660);
    strokeWeight(1);
  }
  for(int j=0; j<=22; j++){//líneas verticales
    line(0, j*30, 360, j*30);
    strokeWeight(1);
  }
}
