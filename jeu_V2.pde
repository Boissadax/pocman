PImage img;
PImage Blinky;
PImage Pinky;
PImage Inky;
PImage Clyde;
PImage Fond;

int posX = 0;//posXlacement
int posJ = 0;//posJ Saut
int posY = 0;//posY deplacement
int dep = 20;//Unité de deplacement
int jump = 20;//Unité de saut

boolean touch_Blinky; // Le personnage touche le cube
boolean touch_Pinky; // Le personnage touche le cube
boolean touch_Inky; // Le personnage touche le cube
boolean touch_Clyde; // Le personnage touche le cube

float score = 0; // Le score

int tempsGame = 0; //temps partie
int tempsBlinky = 0; // temps d'appartition
int tempsPinky = 0; // temps d'appartition
int tempsInky = 0; // temps d'appartition
int tempsClyde = 0; // temps d'appartition
int tempsRebours = 700; 

float Blinky_random_x = 500; //Position aléatoire X Blinky
float Blinky_random_y = 500; //Position aléatoire Y Blinky

float Pinky_random_x = 500; //Position aléatoire X Pinky
float Pinky_random_y = 500; //Position aléatoire Y Pinky

float Inky_random_x = 500; //Position aléatoire X Inky
float Inky_random_y = 500; //Position aléatoire Y Inky

float Clyde_random_x = 500; //Position aléatoire X Clyde
float Clyde_random_y = 500; //Position aléatoire Y Clyde

int touch_verif = 0;
//float couleur_random_1 = 255;
//float couleur_random_2 = 255;
//float couleur_random_3 = 255;

void setup() {
  size(1100,750);
  textSize(30);
  img = loadImage("pac-Man.png");
  Blinky = loadImage("Blinky.png");
  Pinky = loadImage("Pinky.png");
  Inky = loadImage("Inky.png");
  Clyde = loadImage("Clyde.png");
  Fond = loadImage("Fond.png");
  textAlign(CENTER);
}

void draw() {
 
  background (0,0,0);
  image(Fond,0, 0);
  fill(255,255,255);
    text("score :",50,100);
    text (score, 145, 100);
    text("Temps restant :",50,200);
    text(tempsRebours, 200, 200);
    //text (carre_random_x, 200, 200);
    //text (carre_random_y, 200, 300);
    //text (posX, 300, 200);
    //text (posY, 300, 300);
    //text (touch_verif, 600, 600);

  if ((tempsGame >= 0) && ( tempsGame <= 1000)){
    if (touch_Blinky == false) {
      drawBlinky();
    }
  }
  if ((tempsGame >= 1000) && ( tempsGame <= 2000) && ( score>50)){
    if (touch_Pinky == false) {
      drawPinky();
    }
  }
  if ((tempsGame >= 2000) && ( tempsGame <= 3000) && ( score>110)){
    if (touch_Inky == false) {
      drawInky();
    }
  }
   if ((tempsGame >= 3000) && ( tempsGame <= 4000) && ( score>170)){
    if (touch_Clyde == false) {
      drawClyde();
    }
  }
  

  fill(255,255,255);
   rectMode(CENTER);
   image(img, posX, posY, width/16, height/14);
   
   if (posX <= 1020) {
     if ((keyPressed == true) && (key == 'd')){
       posX = posX + dep;
     }
   }
  if (posX >= 10){
    if ((keyPressed == true) && (key == 'q')){
      posX = posX - dep;
    }
  }

  if (posY <= 680){
    if ((keyPressed == true) && (key == 's')){  
      posY = posY + dep;
    }
  }

  if(posY >= 10){
    if ((keyPressed == true) && (key == 'z')){ 
      posY = posY - dep;
    }
  }

  if ((keyPressed == true) && (key == 'v')){
    posJ = posJ - jump;
  }else{ 
    posJ = 0;
  }
  
  if ((tempsGame >= 0) && ( tempsGame <= 1000)){
    if ((posX < Blinky_random_x + 100) && (posX > Blinky_random_x - 76) && (posY < Blinky_random_y + 90) && (posY > Blinky_random_y - 76) && (touch_Blinky == false)){
      touch_Blinky = true;
      score = score + 0.1;
      //couleur_random_1 = random(255);
      //couleur_random_2 = random(255);
      //couleur_random_3 = random(255);
    }
  }
  
  if ((tempsGame >= 1000) && ( tempsGame <= 2000)){
    if ((posX < Pinky_random_x + 100) && (posX > Pinky_random_x - 76) && (posY < Pinky_random_y + 90) && (posY > Pinky_random_y - 76) && (touch_Pinky == false)){
      touch_Pinky = true;
      score = score + 0.3;
    }
  }
  
  if ((tempsGame >= 2000) && ( tempsGame <= 3000)){
     if ((posX < Inky_random_x + 100) && (posX > Inky_random_x - 76) && (posY < Inky_random_y + 90) && (posY > Inky_random_y - 76) && (touch_Inky == false)){
      touch_Inky = true;
      score = score + 0.6;
    }
  }
    if ((tempsGame >= 3000) && ( tempsGame <= 4000)){
     if ((posX < Clyde_random_x + 100) && (posX > Clyde_random_x - 76) && (posY < Clyde_random_y + 90) && (posY > Clyde_random_y - 76) && (touch_Clyde == false)){
      touch_Clyde = true;
      score = score + 0.9;
    }
  }

  //if (touch_Blinky == true){
  //  touch_verif = 1;
  //}else{
  //  touch_verif = 0; 
  //}
  
  touch_Blinky = false;
  touch_Pinky = false;
  touch_Inky = false;
  touch_Clyde = false;
  
  tempsGame = tempsGame + 1;
  tempsRebours = tempsRebours - 1; 
}

void drawBlinky(){
  rectMode(CENTER);
  tempsBlinky = tempsBlinky + 1;
  if ((tempsGame >= 0) && ( tempsGame <= 1000)){
    if ( tempsBlinky > 100){
      Blinky_random_x = random(900);
      Blinky_random_y = random(600);
      image(Blinky,Blinky_random_x,Blinky_random_y, width/10, height/10);
      tempsBlinky = 0;
    }else{
      image(Blinky,Blinky_random_x,Blinky_random_y, width/10, height/10);
    }
  }
}

void drawPinky(){
  rectMode(CENTER);
  tempsPinky = tempsPinky + 1;
  if ((tempsGame >= 1000) && ( tempsGame <= 2000)){
    if ( tempsPinky > 90){
      Pinky_random_x = random(900);
      Pinky_random_y = random(600);
      image(Pinky,Pinky_random_x,Pinky_random_y, width/10, height/10);
      tempsPinky = 0;
    }else{
      image(Pinky,Pinky_random_x,Pinky_random_y, width/10, height/10);
    }
  }
}

void drawInky(){
  rectMode(CENTER);
  tempsInky = tempsInky + 1;
  if ((tempsGame >= 2000) && ( tempsGame <= 3000)){
    if ( tempsInky > 80){
      Inky_random_x = random(900);
      Inky_random_y = random(600);
      image(Inky,Inky_random_x,Inky_random_y, width/10, height/10);
      tempsInky = 0;
    }else{
      image(Inky,Inky_random_x,Inky_random_y, width/10, height/10);
    }
  }
}

void drawClyde(){
  rectMode(CENTER);
  tempsClyde = tempsClyde + 1;
  if ((tempsGame >= 3000) && ( tempsGame <= 4000)){
    if ( tempsClyde > 70){
      Clyde_random_x = random(900);
      Clyde_random_y = random(600);
      image(Clyde,Clyde_random_x,Clyde_random_y, width/10, height/10);
      tempsClyde = 0;
    }else{
      image(Clyde,Clyde_random_x,Clyde_random_y, width/10, height/10);
    }
  }
}
