//https://www.youtube.com/watch?v=IEHdnqyBqcE

int columnas = 16;
int filas = 14;          
int tamCeldaAncho = 30; 


// Arrays para controlar las posiciones acumuladas y el alto real de cada fila
float[] posicionesY = new float[filas];
float[] alturasY = new float[filas];

float factorDegradado;


boolean cambiarColor = false;
boolean girar = false;
float ruido = 0;
PImage trabajo;

void setup() {
  size(800, 400); 

  trabajo = loadImage("01.jpg");

  //esquema vertical: la primera fila mide 25px, las siguientes 29px reales
  float acumuladoY = 0;
  for (int j = 0; j < filas; j++) {
    if (j == 0) {
      alturasY[j] = 25;
    } else {
      alturasY[j] = 29;
    }
    posicionesY[j] = acumuladoY;
    acumuladoY += alturasY[j];
  }
}

void draw() {
  background(255);

  // 1. Imagen de referencia a la izquierda
  image(trabajo, 0, 0, 400, 400);

  // 2. Lado derecho con coordenadas exactas
  pushMatrix();
  translate(600, 200); // Uso de Translate para centrar el eje

  if (girar) {
    rotate(PI); // Uso de Rotate
  }

  translate(-200, -200);
  
  // CICLOS FOR ANIDADOS
  for (int fila = 0; fila < filas; fila++) {
    for (int col = 0; col < columnas; col++) {

      float posX = col * tamCeldaAncho;
      float posY = posicionesY[fila];
      
      float tX = tamCeldaAncho;
      float tY = alturasY[fila];

      // Función matemática: dist() con el mouse relativo al lienzo derecho
      float d = dist(posX, posY, mouseX - 400, mouseY);

      // Función matemática: map() para el brillo dinámico
      float brillo = map(d, 0, 300, 255, 60);
      brillo = constrain(brillo, 60, 255);

      // Mantiene la inversión del patrón solicitada
      boolean par = !esPar(fila, col);

      // Uso de la función sin retorno con parámetros
      dibujarCelda(posX, posY, tX, tY, brillo, par);
    }
  }
  popMatrix();
}

// FUNCIÓN PROPIA CON PARÁMETROS QUE NO RETORNA VALOR (void) personalizado
void dibujarCelda(float x, float y, float w, float h, float brillo, boolean par) {
  if(cambiarColor){
    stroke(0);
    fill(brillo, ruido, random(100, 255));
    rect(x, y, w, h);
  } else {
    noStroke();
    
    float pasoX = 2; // Ancho de cada franja del degradado
 
    // Dibujamos el degradado
    for (float i = 0; i < w; i += pasoX) {
       float colorPixel;
      
       if(filas == 0) {
         colorPixel = map(i, 0, w, 255, 30);
       } else {
         if(par) {
           // Degradado horizontal: de oscuro a claro
           colorPixel = map(i, 0, w, brillo * 0.2, brillo);
         } else {
           // Degradado horizontal inverso: de claro a oscuro
           colorPixel = map(i, 0, w, brillo, brillo * 0.2); 
         }
       }
     
       fill(colorPixel);
       rect(x + i, y, pasoX, h); // Dibuja la franja vertical en la posición horizontal correspondiente
    }
  }
}

// FUNCIÓN PROPIA CON PARÁMETROS QUE RETORNA UN VALOR (boolean)
boolean esPar(int a, int b) {
  if ((a + b) % 2 == 0) {
    return true;
  } else {
    return false;
  }
}

//  MOUSE: Modificación de variables al hacer click
void mousePressed() {
  cambiarColor = !cambiarColor;
  ruido = random(100);
}

// TECLADO: Modificación de variables por teclas
void keyPressed() {
  if (key == 'r' || key == 'R') {
    reiniciar(); 
  }
  if (key == 'g' || key == 'G') {
    girar = !girar;
  }
}

// REINICIAR EL PROGRAMA: Volver variables a su estado original
void reiniciar() {
  cambiarColor = false;
  girar = false;
  ruido = 0;
}
