
//video   https://youtu.be/5GjmqrQBiu0?si=QzfRsjPhS4CZc-at

PImage trabajo;
boolean invertidoVertical = false;
void setup(){
  size(800,400);
  
  trabajo = loadImage("01.jpg"); //foto del trabajo
}

void draw(){
  background(255);
  
  image(trabajo,0,0,400,400);
  
  pushMatrix();
  if(invertidoVertical){
  translate(0,height);
  scale(1,-1);
  }
  
  translate(600,200);   //mueve el punto de giro al centro de la parte derecha donde empieza el codigo
  rotate(PI);        //gira la imagen a 180 grados
  translate(-600,-200);    //vuelve a la pocision original

  int tamHorizontal = 25; //divide el esquema de la derecha es decir que 400/25 da un total de 16 celdas
  for(int fila = 0; fila <= height/tamHorizontal; fila++){
   int Y = fila*tamHorizontal;
   line(400,Y,800,Y);
  }
  int tamVertical = 50; //el 400/50 no se divide ya que da como resultado 8 en este caso 8 celdas
  stroke(0);
  for(int x = 400; x <= width; x += tamVertical){
    line(x,0,x,height);
  }
  
  int tamFila1A = 25;
  
  for(int x = 415; x < width; x += tamFila1A*2){
    float c = map(x,415,width,140,140);
    fill(c);
    rectDegradado(x,0,tamFila1A);
   
  }
  int tamFila1 = 25;
  
  for(int x = 425; x < width; x += tamFila1*2){
   float c = map(x,425,width,50,50);
    fill(c);
    rectDegradado(x,0,tamFila1);
  }              //se divide en 2 partes para dar el efecto de opacidad azul
  
  int tamFila2 = 25;

for(int x = 400; x < width; x += tamFila2*2){
float c = map(x,400,width,50,50);
fill(c);
rectDegradado(x,25,tamFila2);
}                          //segunda fila de columnas

int tamFila3A = 25;

for(int x = 415; x < width; x += tamFila3A*2){
float c = map(x,415,width,140,140);
fill(c);
rectDegradado(x,50,tamFila3A);
}
int tamFila3 = 25;

for(int x = 425; x < width; x += tamFila3*2){
float c = map(x,425,width,50,50);
fill(c);
rectDegradado(x,50,tamFila3);
}                    //tercera fila de columnas

int tamFila4B = 25;

for(int x = 415; x < width; x += tamFila4B*2){
float c = map(x,415,width,140,140);
fill(c);
rectDegradado(x,75,tamFila4B);
}

int tamFila4 = 25;

for(int x = 400; x < width; x += tamFila4*2){
float c = map(x,400,width,50,50);
fill(c);
rectDegradado(x,75,tamFila4);
}                    //cuarta fila de columnas

int tamFila5A = 25;

for(int x = 415; x < width; x += tamFila5A*2){
float c = map(x,415,width,140,140);
fill(c);
rectDegradado(x,100,tamFila5A);
}
int tamFila5 = 25;

for(int x = 425; x < width; x += tamFila5*2){
float c = map(x,425,width,50,50);
fill(c);
rectDegradado(x,100,tamFila5);
}              //quinta fila de columnas
  
  int tamFila6A = 25;

for(int x = 415; x < width; x += tamFila6A*2){
float c = map(x,415,width,140,140);
fill(c);
rectDegradado(x,150,tamFila6A);
}
int tamFila6 = 25;

for(int x = 425; x < width; x += tamFila6*2){
float c = map(x,425,width,50,50);
fill(c);
rectDegradado(x,150,tamFila6);
}                 //sexta fila de columnas

int tamFila7A = 25;

for(int x = 415; x < width; x += tamFila7A*2){
float c = map(x,415,width,140,140);
fill(c);
rectDegradado(x,200,tamFila7A);
}
int tamFila7 = 25;

for(int x = 425; x < width; x += tamFila3*2){
float c = map(x,425,width,50,50);
fill(c);
rectDegradado(x,200,tamFila7);
}                               //septima fila

int tamFila8A = 25;

for(int x = 415; x < width; x += tamFila8A*2){
float c = map(x,415,width,140,140);
fill(c);
rectDegradado(x,250,tamFila3A);
}
int tamFila8 = 25;

for(int x = 425; x < width; x += tamFila8*2){
float c = map(x,425,width,50,50);
fill(c);
rectDegradado(x,250,tamFila8);
}                              //octava fila
  
  int tamFila9A = 25;
  
  for(int x = 415; x < width; x += tamFila9A*2){
    float c = map(x,415,width,140,140);
    fill(c);
    rectDegradado(x,300,tamFila9A);
  }
  int tamFila9 = 25;
  
  for(int x = 425; x < width; x += tamFila9*2){
    float c = map(x,425,width,50,50);
    fill(c);
    rectDegradado(x,300,tamFila9);
  }                               //novena fila
  
    int tamFila10A = 25;
  
  for(int x = 415; x < width; x += tamFila10A*2){
    float c = map(x,415,width,140,140);
    fill(c);
    rectDegradado(x,350,tamFila10A);
  }
  int tamFila10 = 25;
  
  for(int x = 425; x < width; x += tamFila10*2){
    float c = map(x,425,width,50,50);
    fill(c);
    rectDegradado(x,350,tamFila10);
  }                               //decima fila
  
    int tamFila11A = 25;
  
  for(int x = 415; x < width; x += tamFila11A*2){
    float c = map(x,415,width,140,140);
    fill(c);
    rectDegradado(x,400,tamFila11A);
  }
  int tamFila11 = 25;
  
  for(int x = 425; x < width; x += tamFila11*2){
    float c = map(x,425,width,50,50);
    fill(c);
    rectDegradado(x,400,tamFila11);
  }                                //fila numero 11
  
  int tamFila12B = 25;
  
  for(int x = 415; x < width; x += tamFila12B*2){
    float c = map(x,415,width,140,140);
    fill(c);
    rectDegradado(x,125,tamFila12B);
  }
  
  
  int tamFila12 = 25;
  
  for(int x = 400; x < width; x += tamFila12*2){
    float c = map(x,400,width,50,50);
    fill(c);
    rectDegradado(x,125,tamFila12);
  }                                  //fila numero 12
  
  int tamFila13B = 25;
  
  for(int x = 415; x < width; x += tamFila13B*2){
    float c = map(x,415,width,140,140);
    fill(c);
    rectDegradado(x,175,tamFila13B);
  }
  
  
  int tamFila13 = 25;
  
  for(int x = 400; x < width; x += tamFila13*2){
    float c = map(x,400,width,50,50);
    fill(c);
    rectDegradado(x,175,tamFila13);
  }                                   //fila numero 13
  
  int tamFila14B = 25;
  
  for(int x = 415; x < width; x += tamFila14B*2){
    float c = map(x,415,width,140,140);
    fill(c);
    rectDegradado(x,225,tamFila14B);
  }
  
  
  int tamFila14 = 25;
  
  for(int x = 400; x < width; x += tamFila14*2){
    float c = map(x,400,width,50,50);
    fill(c);
    rectDegradado(x,225,tamFila14);
  }                                  //fila numero 14
  
  int tamFila15B = 25;
  
  for(int x = 415; x < width; x += tamFila15B*2){
    float c = map(x,415,width,140,140);
    fill(c);
    rectDegradado(x,275,tamFila15B);
  }
  
  
  int tamFila15 = 25;
  
  for(int x = 400; x < width; x += tamFila15*2){
    float c = map(x,400,width,50,50);
    fill(c);
    rectDegradado(x,275,tamFila15);
  }                                   //fila numero 15
  
  int tamFila16B = 25;
  
  for(int x = 415; x < width; x += tamFila16B*2){
    float c = map(x,415,width,140,140);
    fill(c);
    rectDegradado(x,325,tamFila16B);
  }
  
  
  int tamFila16 = 25;
  
  for(int x = 400; x < width; x += tamFila16*2){
    float c = map(x,400,width,50,50);
    fill(c);
    rectDegradado(x,325,tamFila16);
  }                                  //fila numero 16
  
  int tamFila17B = 25;
  
  for(int x = 415; x < width; x += tamFila17B*2){
    float c = map(x,415,width,140,140);
    fill(c);
    rectDegradado(x,375,tamFila17B);
  }
  
  
  int tamFila17 = 25;
  
  for(int x = 400; x < width; x += tamFila17*2){
    float c = map(x,400,width,50,50);
    fill(c);
    rectDegradado(x,375,tamFila17);
  }                                     //fila numero 17
  popMatrix();
}

void mousePressed(){
  invertidoVertical = !invertidoVertical;
}

void rectDegradado(int x, int y, int tam) {

  for (int i = 0; i < tam; i++) {

    float c = map(i, 0, tam, 220, 40);

    stroke(c);
    line(x + i, y, x + i, y + tam);
  }
}
