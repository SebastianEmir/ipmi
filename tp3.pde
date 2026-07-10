int tamCelda = 25;
boolean cambiarColor = false;
boolean girar = false;
float ruido = 0;
PImage trabajo;
void setup() {
  size(800, 400);

  trabajo = loadImage("01.jpg");
}

void draw() {
  background(255);

  // Imagen de referencia a la izquierda
  image(trabajo, 0, 0, 400, 400);

  pushMatrix();

  translate(600, 200);

  if (girar) {
    rotate(PI);
  }

  translate(-200, -200);

  // FOR anidados
  for (int fila = 0; fila < 16; fila++) {
    for (int col = 0; col < 16; col++) {

      float d = dist(col*tamCelda, fila*tamCelda, mouseX-400, mouseY);

      float brillo = map(d, 0, 300, 255, 60);
      brillo = constrain(brillo, 60, 255);

      boolean par = esPar(fila, col);

      dibujarCelda(col*tamCelda,
        fila*tamCelda,
        tamCelda,
        brillo,
        par);
    }
  }

  popMatrix();
}
// Función SIN retorno
void dibujarCelda(float x, float y, float t, float brillo, boolean par) {

  noStroke();

  for (int i=0; i<t; i++) {

    float c;

    if (par) {
      c = map(i, 0, t, brillo, 40);
    } else {
      c = map(i, 0, t, 40, brillo);
    }

    if (cambiarColor) {
      fill(c, c*0.5, random(180,255));
    } else {
      fill(c);
    }

    rect(x+i, y, 1, t);
  }
}
// Función CON retorno
boolean esPar(int a, int b) {

  if ((a+b)%2==0) {
    return true;
  } else {
    return false;
  }
}
// Mouse
void mousePressed() {

  cambiarColor = !cambiarColor;
  ruido = random(100);
}
// Teclado
void keyPressed() {

  if (key=='r' || key=='R') {
    reiniciar();
  }

  if (key=='g' || key=='G') {
    girar = !girar;
  }
}
// Reiniciar
void reiniciar() {

  cambiarColor = false;
  girar = false;
  ruido = 0;
}
