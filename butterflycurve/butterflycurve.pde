float t = 0;
float a = 0;
float b = 0;


void setup(){
  size(720,720,P3D);
  frameRate(30);
}

void draw(){
  background(0);
  translate(width/2,height/2+50);
  rotateY((t%200)*PI/200);
  for(int i = 0; i< 20000; i++){
    strokeWeight(2);
    stroke(255,255,255);
    a= (float)x(t+.5*i);
    b= (float)y(t+.5*i);
    point(a,b);
  }

  for(int i = 0; i< 10000; i++){
    strokeWeight(3);
    stroke(155,55,155);
    a= (float)x(t+.5*i);
    b= (float)y(t+.5*i);
    point(a,b);
  }
    
    
  for(int i = 0; i< 1000; i++){
    strokeWeight(5);
    stroke(250,(150+(10*i)%20),175);
    a= (float)x(t+3*i);
    b= (float)y(t+3*i);
    point(a,b);
  }
  

  for(int i = 0; i< 1000; i++){
    strokeWeight(10);
    stroke(250,(200+(10*i)%20),255,70+(i%30));
    a= (float)x(t+5*i);
    b= (float)y(t+5*i);
    point(a,b);
  }
  
    for(int i = 0; i< 100; i++){
    strokeWeight(10);
    stroke(250,(250+(10*i)%5),255,90+(i%10));
    a= (float)x(t+7*i);
    b= (float)y(t+7*i);
    point(a,b);
  }
  t+=1;
}

double x(float t){
  return 80*sin(t)*(exp(cos(t))-2*cos(4*t)-Math.pow(sin(t/12),5));
}

double y(float t){
  return -80*cos(t)*(exp(cos(t))-2*cos(4*t)-Math.pow(sin(t/12),5));
}

void keyPressed() {
  if (key == 'q') {
   saveFrame("ButterflyCurve-######.png");
   exit();
  }
}
