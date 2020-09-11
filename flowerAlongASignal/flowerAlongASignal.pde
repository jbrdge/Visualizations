PImage flower;
float t=0;

void setup(){
  size(800,800);
  imageMode(CENTER);
  pixelDensity(2);
  flower = loadImage("./flower.png");
}

void draw(){
  translate(width/2,height/2);
  background(65,105,160);
  flower.resize(150,0);
  for(int i=0; i<600; i+=5){
    pushMatrix();
    translate(i*cos(i*PI/100)+30*cos(t+PI*i/39),i*sin(i*PI/100)+30*sin(t+PI*i/39));
    rotate(i*PI/100+t);
    image(flower,0,0);
    popMatrix();
  }
  t+=0.035;
  println(frameCount);
}

void keyPressed() {
    if (key == 'q') {
     saveFrame("flowerAlongASignal-######.png");
     exit();
  }
}
