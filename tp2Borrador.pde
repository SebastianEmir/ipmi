int pantalla = 0;
float ussMenu = 255;
boolean transicionActiva = false;
PFont fuenteMK1;

PImage estrellas,logo,meteoritos,meter,enter,nave,p1,p2,explo,tripu,viajes;

float alphaP1 = 255; //opacidad
boolean finalizado = false;

float meteoritoX1 = 0;
float velMeteoritoX1 = 4;

float meteoritos1 = 0;
float velMeteoritos1 = 3;

float enter2 = 0;
float velEnter2 = 6;

int posX = 300;
int posY = 250;
int ancho = 80;
int alto = 50;
color colorBoton = color(200);
color colorFondo = color(300);

float yAnim = 500;
int cronometro = 0;
int personaje = 1;

int cuadroX = 50;
int cuadroY = 320;
int cuadroW = 540;
int cuadroH = 120;

void setup(){
  size(640,480);
   //fondo de inicio
   estrellas = loadImage("Starsinthesky.jpg");
   
   //fuente del texto
   fuenteMK1 = loadFont("DejaVuSans-BoldOblique-20.vlw");
   textFont(fuenteMK1);

}

void draw(){
    
    background(0);
    image(estrellas,0,0);
    
    p1 = loadImage("personaje1.jpg");
    logo = loadImage("star_trek_logo.png");
    
    enter = loadImage("enterprise.png");
    p2 = loadImage("personaje2.jpg");
    tripu = loadImage("tripulacion.jpg");
    explo = loadImage ("exploracion1.jpg");
    viajes = loadImage("viajes.jpg");
    meter = loadImage("meteorito.png");
    
    nave = loadImage("enterprise2.png");{ //nave enterprise en movimiento
    
    image(nave,enter2,enter2,80,80);
    enter2 += velEnter2;
    if(enter2 > width){
     enter2 = -300;
    }
  }
    
    meter = loadImage("meteorito.png");{ //roca espacial
    
    image(meter,meteoritoX1,400,80,80);
    meteoritoX1 += velMeteoritoX1;
    if(meteoritoX1 > width){
     meteoritoX1 = -250;
    }
  }
   
    //condicional de pantalla
    if (pantalla == 0) {
      tint(255,ussMenu); //logica del menu
      image(logo,75,55,485,210);
    //apariencia del boton
    if (mouseX > 220 && mouseX < 420 && mouseY > 370 && mouseY < 430) {
      fill(255, 255, 0, ussMenu); 
      textSize(36); 
    } else {
      fill(255, ussMenu); 
      textSize(32);
    }
  textAlign(CENTER,CENTER);
  text("Iniciar viaje",320,400);
  noTint();
  
  //logica de transicion (cambio de variable alpha)
   if (transicionActiva){
     ussMenu -= 7;
     if (ussMenu <= 0){
       pantalla = 1; //cambio de estado
     }
   }
    } 
    ///PANTALLA 1 //
  else if (pantalla == 1){
    tint(255,alphaP1);
    //logica para personajes
    image(enter,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("Enterprise",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Su misión principal, asignada por la Federación Unida de Planetas y capitaneada por James T. Kirk,\n es realizar una misión de exploración de cinco años", 70,yAnim + 45,500,70);
 
     cronometro++;
     if (cronometro > 100) {
       finalizado = true;
     }
     if (finalizado){
       alphaP1 -= 7;
       if (alphaP1 <= 0){
         ///reincio y aparece otra pantalla
         pantalla = 2;
         cronometro = 0;
         finalizado = false;
         alphaP1 = 255;
         yAnim = 500;
       }
     }
     noTint();
    }  
    ///pantala de personaje 1///
    else if (pantalla == 2){ 
    tint(255,alphaP1);
    image(p1,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("capitan James T. kirk",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("comanda la nave estelar USS Enterprise. Su función principal es liderar a su tripulación en una misión\n de exploración de cinco años para descubrir nuevos mundos, buscar vida inteligente y mediar en conflictos espaciales.", 70,yAnim + 45,500,70);
    
     cronometro++;
     if (cronometro > 100)
       finalizado = true;
     if (finalizado){
       alphaP1 -= 7;
       if (alphaP1 <= 0){
         pantalla = 3;
         cronometro = 0;
         finalizado = false;
         alphaP1 = 255;
         yAnim = 500;
     }
     }
     
     noTint();
  }   
  /////Pantalla personaje 2///
  else if (pantalla == 3){ 
    tint(255,alphaP1);
    image(p2,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("spock (mitad vulcano y mitad humano)",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Spock es el oficial científico y primer oficial (segundo al mando) de la nave estelar USS Enterprise. Su labor principal es asesorar al Capitán Kirk, analizar fenómenos desconocidos", 70,yAnim + 45,500,70);
    
     cronometro++;
     if (cronometro > 100) 
       finalizado = true;
     if (finalizado){
       alphaP1 -= 7;
       if (alphaP1 <= 0){
         pantalla = 4;
          cronometro = 0;
         finalizado = false;
         alphaP1 = 255;
         yAnim = 500;
       }
  }
       noTint();
     }
     //////Pantalla la tripulacion////
  else if (pantalla == 4){ 
    tint(255,alphaP1);
    image(tripu,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120);    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(16);
    text("miembros de la tripulacion",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("la tripulación de la nave estelar USS Enterprise se dedica a una misión de exploración espacial de cinco años. Su objetivo es buscar nueva vida y civilizaciones, hacer descubrimientos científicos y mediar en conflictos,", 70,yAnim + 45,500,70);
    
     cronometro++;
     if (cronometro > 100) 
       finalizado = true;
     if (finalizado){
       alphaP1 -= 7;
       if (alphaP1 <= 0){
         pantalla = 5;
          cronometro = 0;
         finalizado = false;
         alphaP1 = 255;
         yAnim = 500;
       }
     }  
noTint();
  }
   //////Pantalla exploracion///
  else if (pantalla == 5){ 
    tint(255,alphaP1);
    image(explo,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("nuevas civilizaciones",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("afrontan el encuentro con nuevas civilizaciones lidiando principalmente con el choque cultural, dilemas morales sobre la no-interferencia y la necesidad de mantener la empatía.", 70,yAnim + 45,500,70);
    
     cronometro++;
     if (cronometro > 100) 
       finalizado = true;
     if (finalizado){
       alphaP1 -= 7;
       if (alphaP1 <= 0){
         pantalla = 6;
          cronometro = 0;
         finalizado = false;
         alphaP1 = 255;
         yAnim = 500;
       }
     noTint();
     }
  }
   ////pantalla final/////
      else if (pantalla == 6){ 
    tint(255,alphaP1);
    image(viajes,0,0,width,height); 
    
    if (yAnim > 250) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(22);
    text("los viajes continuan",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(12);
    text("representan una legendaria misión de exploración de 5 años por el siglo XXIII. Bajo el mando del capitán James T. Kirk, la tripulación se adentra en lo desconocido para cartografiar sectores y contactar nuevas civilizaciones.", 75,yAnim + 45,500,90);
    noTint();
    
    tint(255,ussMenu);
    if (mouseX > 220 && mouseX < 420 && mouseY > 370 && mouseY < 430) {
      fill(255, 255, 0, ussMenu); 
      textSize(36); 
    } else {
      fill(255); 
      textSize(32);
    }
  textAlign(CENTER,CENTER);
  text("Retornar viaje",320,400);
  noTint();
 }    
}

void mousePressed(){ //condicional para activar el boton
 if (pantalla == 0 && mouseX > 220 && mouseX < 420 && mouseY > 370 && mouseY < 430) {
  transicionActiva = true;
 }
if (pantalla == 6 && mouseX > 220 && mouseX < 420 && mouseY > 370 && mouseY < 430)
 // se regresa con hacer en la ultima pantalla en el boton
 if (pantalla == 6){
   reiniciar();

 }
}

void reiniciar(){
   pantalla = 0;
   ussMenu = 255;
   transicionActiva = false;
   finalizado = false;
   cronometro = 0;
   yAnim = 500;
   alphaP1 = 255;
}
