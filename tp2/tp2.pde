int pantalla = 0;
float alphaMenu = 255;
boolean transicionActiva = false;
PFont fuenteCGB;

PImage estrellas, logo , meterorito, cumulo, enter, enterprise, per1, per2, expo1;

float alphaP1 = 255; // Opacidad de personajes
boolean finalizado = false;

float nX1 = 0, nX2 = -200, nX3 = -400;
float vN1 = 1.5, vN2 = 1.9, vN3 = 0.8;

float yAnim = 500;
int cronometro = 0;
int personaje = 1;

int cuadroX = 50;
int cuadroY = 320;
int cuadroW = 540;
int cuadroH = 120;

void setup(){
    size(640,480);
    estrellas = loadImage("Starsinthesky.jpg"); 
    logo = loadImage("star_trek_logo.png");    
    meterorito = loadImage("meterorito.png");
    cumulo = loadImage("cumulo.png");
    enter = loadImage("enterprise2.png");    
    enterprise = loadImage("enterprise.png");
    per1 = loadImage("personaje1.jpg");
    per2 = loadImage("personaje2.jpg");
    P4 = loadImage("gemelos.png");
    P5 = loadImage("patapez_y_albondiga.png");
    EF = loadImage("httyd_2.jpg");
    
    fuenteCGB = loadFont("CopperplateGothic-Bold-32.vlw");
    textFont(fuenteCGB);    
}

void draw(){
    background(0);
    image(berk,0,0,width,height);
    image(n1,nX1,340,300,250);
    image(n2,nX2,340,280,250);    
    image(n3,nX3,340,250,250);
    
    nX1 += vN1;
    nX2 += vN2;
    nX3 += vN3;
    
    if (nX1 > width) nX1 = -300;
    if (nX2 > width) nX2 = -250;
    if (nX3 > width) nX3 = -350;
    
    //condicional de pantalla
    if (pantalla == 0) {
      tint(255,alphaMenu); //logica del menu
      image(logo,75,55,485,210);
    //apariencia del boton
    if (mouseX > 220 && mouseX < 420 && mouseY > 370 && mouseY < 430) {
      fill(255, 255, 0, alphaMenu); 
      textSize(36); 
    } else {
      fill(255, alphaMenu); 
      textSize(32);
    }
  textAlign(CENTER,CENTER);
  text("Comenzar",320,400);
  noTint();
  
  //logica de transicion (cambio de variable alpha)
   if (transicionActiva){
     alphaMenu -= 7;
     if (alphaMenu <= 0){
       pantalla = 1; //cambio de estado
     }
   }
    } 
    ///PANTALLA de Hipo //
  else if (pantalla == 1){
    tint(255,alphaP1);
    //logica para personajes
    image(P1,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);//el ultimo 10 redondea las esquinas del rect 330
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("Hipo y Chimuelo",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Hipo (de 20 años) y su dragón furia nocturna llamada Chimuelo se dedican a explorar territorios desconocidos para evitar las presiones de convertirse en el nuevo líder de Berk. Tras descubrir a un malvado conquistador que busca crear un ejército de dragones, el vínculo entre ambos se pone a prueba, obligándolos a luchar juntos por la paz de su territorio, el pueblo de Berk", 70,yAnim + 45,500,70);
 
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
    ///pantala de Astrid///////////////////////////////////////////
    else if (pantalla == 2){ 
    tint(255,alphaP1);
    image(P2,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("Astrid y Tormenta",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Astrid tiene 20 años y es una guerrera consumada, la principal confidente de Hipo y su apoyo moral. Tormenta, su dragona de raza Nader Mortífero, mantiene sus habilidades únicas, como lanzar espinas venenosas con gran precisión. Juntas lideran las carreras de dragones en Berk y demuestran su valentía cuando el pueblo enfrenta nuevas amenazas", 70,yAnim + 45,500,70);
    
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
  /////Pantalla de PATAN////////////////////////
  else if (pantalla == 3){ 
    tint(255,alphaP1);
    image(P3,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("Patan y Colmillo",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Patán y Colmillo son un equipo cómico donde el dragón suele burlarse de la arrogancia de su jinete. En la secuela, Patán busca impresionar a Brutilda mientras Colmillo demuestra su gran poder de fuego. Ambos impulsan la creación de las carreras de dragones en Berk usando tácticas competitivas y algo tramposas para ganar.", 70,yAnim + 45,500,70);
    
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
     //////Pantalla de Gemelos////
  else if (pantalla == 4){ 
    tint(255,alphaP1);
    image(P4,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(16);
    text("Los gemelos Brutacio y brutilda y \nsu dragon Eructo y Guácara",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Brutacio y Brutilda son hermanos gemelos (mellizos) de 19 años pertenecientes a los jinetes de Berk. Se caracterizan por su actitud caótica, impulsiva y un tanto torpe, disfrutando al máximo del peligro y la destrucción.", 70,yAnim + 45,500,70);
    
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
   //////Pantalla de Patapez/////////////////////////
  else if (pantalla == 5){ 
    tint(255,alphaP1);
    image(P5,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("Patapez y albondiga",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Patapez es un vikingo inteligente, sensible y experto en estadísticas de dragones, que actúa como el cerebro del grupo. Albóndiga (su dragona) es una Gronckle hembra de complexión robusta, terca pero muy cariñosa.", 70,yAnim + 45,500,70);
    
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
     //////////////////////////////pantalla final//////////////////////////////
      else if (pantalla == 6){ 
    tint(255,alphaP1);
    image(EF,0,0,width,height); 
    
    if (yAnim > 250) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(22);
    text("fin de la aventura",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(16);
    text("Has conocido a todos los jinetes de Berk.\nHaz clic en cualquier parte para REINICIAR.", 70,yAnim + 45,500,70);
    noTint();
     }
 }
      
void mousePressed(){ //condicional para activar el boton
 if (pantalla == 0 && mouseX > 220 && mouseX < 420 && mouseY > 370 && mouseY < 430) {
  transicionActiva = true;
 }
 if(pantalla == 6){
   pantalla = 0;
   alphaMenu = 255;
   transicionActiva = false;
   finalizado = false;
   cronometro = 0;
   yAnim = 500;
 }
 }


int pantalla = 0;
float alphaMenu = 255;
boolean transicionActiva = false;
PFont fuenteCGB;

PImage berk, logo, n1, n2, n3, P1, P2, P3, P4, P5, EF;

float alphaP1 = 255; // Opacidad de personajes
boolean finalizado = false;

float nX1 = 0, nX2 = -200, nX3 = -400;
float vN1 = 1.5, vN2 = 1.9, vN3 = 0.8;

float yAnim = 500;
int cronometro = 0;
int personaje = 1;

int cuadroX = 50;
int cuadroY = 320;
int cuadroW = 540;
int cuadroH = 120;

void setup(){
    size(640,480);
    berk = loadImage("islaberk.jpg"); 
    logo = loadImage("logo_berk.png");    
    n1 = loadImage("nube1.png");
    n2 = loadImage("nube2.png");
    n3 = loadImage("nube3.png");    
    P1 = loadImage("chimichi.png");
    P2 = loadImage("astrid_y_tormenta.png");
    P3 = loadImage("patan_y_colmillo.png");
    P4 = loadImage("gemelos.png");
    P5 = loadImage("patapez_y_albondiga.png");
    EF = loadImage("httyd_2.jpg");
    
    fuenteCGB = loadFont("CopperplateGothic-Bold-32.vlw");
    textFont(fuenteCGB);    
}

void draw(){
    background(0);
    image(berk,0,0,width,height);
    image(n1,nX1,340,300,250);
    image(n2,nX2,340,280,250);    
    image(n3,nX3,340,250,250);
    
    nX1 += vN1;
    nX2 += vN2;
    nX3 += vN3;
    
    if (nX1 > width) nX1 = -300;
    if (nX2 > width) nX2 = -250;
    if (nX3 > width) nX3 = -350;
    
    //condicional de pantalla
    if (pantalla == 0) {
      tint(255,alphaMenu); //logica del menu
      image(logo,75,55,485,210);
    //apariencia del boton
    if (mouseX > 220 && mouseX < 420 && mouseY > 370 && mouseY < 430) {
      fill(255, 255, 0, alphaMenu); 
      textSize(36); 
    } else {
      fill(255, alphaMenu); 
      textSize(32);
    }
  textAlign(CENTER,CENTER);
  text("Comenzar",320,400);
  noTint();
  
  //logica de transicion (cambio de variable alpha)
   if (transicionActiva){
     alphaMenu -= 7;
     if (alphaMenu <= 0){
       pantalla = 1; //cambio de estado
     }
   }
    } 
    ///PANTALLA de Hipo //
  else if (pantalla == 1){
    tint(255,alphaP1);
    //logica para personajes
    image(P1,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);//el ultimo 10 redondea las esquinas del rect 330
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("Hipo y Chimuelo",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Hipo (de 20 años) y su dragón furia nocturna llamada Chimuelo se dedican a explorar territorios desconocidos para evitar las presiones de convertirse en el nuevo líder de Berk. Tras descubrir a un malvado conquistador que busca crear un ejército de dragones, el vínculo entre ambos se pone a prueba, obligándolos a luchar juntos por la paz de su territorio, el pueblo de Berk", 70,yAnim + 45,500,70);
 
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
    ///pantala de Astrid///////////////////////////////////////////
    else if (pantalla == 2){ 
    tint(255,alphaP1);
    image(P2,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("Astrid y Tormenta",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Astrid tiene 20 años y es una guerrera consumada, la principal confidente de Hipo y su apoyo moral. Tormenta, su dragona de raza Nader Mortífero, mantiene sus habilidades únicas, como lanzar espinas venenosas con gran precisión. Juntas lideran las carreras de dragones en Berk y demuestran su valentía cuando el pueblo enfrenta nuevas amenazas", 70,yAnim + 45,500,70);
    
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
  /////Pantalla de PATAN////////////////////////
  else if (pantalla == 3){ 
    tint(255,alphaP1);
    image(P3,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("Patan y Colmillo",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Patán y Colmillo son un equipo cómico donde el dragón suele burlarse de la arrogancia de su jinete. En la secuela, Patán busca impresionar a Brutilda mientras Colmillo demuestra su gran poder de fuego. Ambos impulsan la creación de las carreras de dragones en Berk usando tácticas competitivas y algo tramposas para ganar.", 70,yAnim + 45,500,70);
    
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
     //////Pantalla de Gemelos////
  else if (pantalla == 4){ 
    tint(255,alphaP1);
    image(P4,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(16);
    text("Los gemelos Brutacio y brutilda y \nsu dragon Eructo y Guácara",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Brutacio y Brutilda son hermanos gemelos (mellizos) de 19 años pertenecientes a los jinetes de Berk. Se caracterizan por su actitud caótica, impulsiva y un tanto torpe, disfrutando al máximo del peligro y la destrucción.", 70,yAnim + 45,500,70);
    
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
   //////Pantalla de Patapez/////////////////////////
  else if (pantalla == 5){ 
    tint(255,alphaP1);
    image(P5,170,40,300,300); 
    
    if (yAnim > 330) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(20);
    text("Patapez y albondiga",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(14);
    text("Patapez es un vikingo inteligente, sensible y experto en estadísticas de dragones, que actúa como el cerebro del grupo. Albóndiga (su dragona) es una Gronckle hembra de complexión robusta, terca pero muy cariñosa.", 70,yAnim + 45,500,70);
    
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
     //////////////////////////////pantalla final//////////////////////////////
      else if (pantalla == 6){ 
    tint(255,alphaP1);
    image(EF,0,0,width,height); 
    
    if (yAnim > 250) {
      yAnim -= 5;
  }
    
    fill(0,0,0,180);
    stroke(255,alphaP1);
    rect(50,yAnim,540,120,10);
    
    noStroke();
    textAlign(LEFT,TOP);
    
    fill(255,255,0,alphaP1);
    textSize(22);
    text("fin de la aventura",70,yAnim + 15);
    
    fill(255,alphaP1);
    textSize(16);
    text("Has conocido a todos los jinetes de Berk.\nHaz clic en cualquier parte para REINICIAR.", 70,yAnim + 45,500,70);
    noTint();
     }
 }
      
void mousePressed(){ //condicional para activar el boton
 if (pantalla == 0 && mouseX > 220 && mouseX < 420 && mouseY > 370 && mouseY < 430) {
  transicionActiva = true;
 }
 if(pantalla == 6){
   pantalla = 0;
   alphaMenu = 255;
   transicionActiva = false;
   finalizado = false;
   cronometro = 0;
   yAnim = 500;
 }
 }
