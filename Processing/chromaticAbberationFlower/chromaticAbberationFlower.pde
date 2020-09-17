float t=0;

void setup(){
  size(800, 800, P3D);
  pixelDensity(2);
  strokeJoin(ROUND);
  smooth(8);
  
  blendMode(ADD);
}

void draw(){
  strokeWeight(4);
  background(0);
  translate(width/2, height/2);
  for(int j=10; j>0;j--){
    for(int i=0; i<200;i++){
      strokeWeight(.075*zG(PI*i/200));
      stroke(255,0,0,150+1.2*zR(PI*i/100));
      point((.1*j)*xR(PI*i/100+t),(.1*j)*yR(PI*i/100+t),zR(PI*i/100));
      stroke(0,255,0,150+1.2*zG(PI*i/100));
      point((.1*j)*xG(PI*i/100+t),(.1*j)*yG(PI*i/100+t),zG(PI*i/100));  
      stroke(0,0,255,150+1.2*zB(PI*i/100));
      point((.1*j)*xB(PI*i/100+t),(.1*j)*yB(PI*i/100+t),zB(PI*i/100));
    }
  }
  t+=0.005;
}

float xR(float t){
  return 200*cos(t)+5*cos(t*20+0.5*sin(t*2));
}

float yR(float t){
  return 200*sin(t)+5*sin(t*20+0.5*sin(t*2));
}

float zR(float t){
  return 100*sin(t*5);
}

float xB(float t){
  return 200*cos(t)+5*cos(t*20+0.5*sin(t));
}

float yB(float t){
  return 200*sin(t)+5*sin(t*20+0.5*sin(t));
}

float zB(float t){
  return 100*sin(t*5);
}

float xG(float t){
  return 200*cos(t)+5*cos(t*20+0.25*sin(t));
}

float yG(float t){
  return 200*sin(t)+5*sin(t*20+0.25*sin(t));
}

float zG(float t){
  return 100*sin(t*5);
}

void keyPressed() {
  if (key == 'q') {
   saveFrame("chromaticAbberationFlower-######.png");
   exit();
  }
}
