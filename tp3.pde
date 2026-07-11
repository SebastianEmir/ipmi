int columnas = 16;
int filas = 14;          // Ajustado a 14 para que las celdas de abajo no se aplasten
int tamCeldaAncho = 25;  // Columnas fijas de 25px (16 * 25 = 400)

// Arrays para controlar las posiciones acumuladas y el alto real de cada fila
float[] posicionesY = new float[filas];
float[] alturasY = new float[filas];

boolean cambiarColor = false;
boolean girar = false;
float ruido = 0;
PImage trabajo;

void setup() {
  size(800, 400); // Resolución fija obligatoria de la consigna

  trabajo = loadImage("01.jpg");

  // Generamos el esquema vertical: la primera fila mide 25px, las siguientes 29px reales
  float acumuladoY = 0;
  for (int j = 0; j < filas; j++) {
    if (j == 0) {
      alturasY[j] = 25;
    } else {
      alturasY[j] = 29; // Altura real de 29px a partir de la segunda fila
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

      // Uso de la función con retorno (aquí se genera la inversión del patrón)
      boolean par = esPar(fila, col);

      // Uso de la función sin retorno con parámetros
      dibujarCelda(posX, posY, tX, tY, brillo, par);
    }
  }
  popMatrix();
}

// FUNCIÓN PROPIA CON PARÁMETROS QUE NO RETORNA VALOR (void)
void dibujarCelda(float x, float y, float w, float h, float brillo, boolean par) {
  noStroke();

  // Dibujamos las líneas de fondo (degradado/brillo)
  for (int i = 0; i < ceil(w); i++) {
    float c = par ? 40 : brillo;
    
    if (cambiarColor) {
      fill(c, c * 0.5, random(180, 255)); // Función matemática: random()
    } else {
      fill(c);
    }
    rect(x + i, y, 1, ceil(h));
  }
  
  // El rectángulo interno oscuro arranca pegado a la izquierda (x)
  if (par) {
    // 1. Bloque gris sólido base original
    fill(80);
    rect(x, y, w * 0.65, h); 
    
    // 2. AGREGADO: Degradado suave al final del rectángulo oscuro para difuminarlo
    float inicioDegradado = x + (w * 0.65);
    int anchoDegradado = 6; // Ancho en píxeles de la transición
    
    for (int i = 0; i < anchoDegradado; i++) {
      // Va disminuyendo la opacidad (alfa) de 255 (sólido) a 0 (invisible)
      float alfa = map(i, 0, anchoDegradado, 255, 0);
      fill(80, alfa);
      rect(inicioDegradado + i, y, 1, ceil(h));
    }
  }
}

// FUNCIÓN PROPIA CON PARÁMETROS QUE RETORNA UN VALOR (boolean)
boolean esPar(int a, int b) {
  if ((a + b) % 2 != 0) {
    return true;
  } else {
    return false;
  }
}

// EVENTO DE MOUSE: Modificación de variables al hacer click
void mousePressed() {
  cambiarColor = !cambiarColor;
  ruido = random(100);
}

// EVENTO DE TECLADO: Modificación de variables por teclas
void keyPressed() {
  if (key == 'r' || key == 'R') {
    reiniciar(); // Volver variables a su estado original
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
