//import com.hamoid.*;
//VideoExport videoExport;

float t = 0;
float p = 2;
float q = 3;
float r = 30;
float rrate = 0.055;
float n = 5;
float x;
float y;
float z;
float xrate = .502;
float yrate = .502;
float zrate = 0.4;
float trate = 0.01;
float dtime = 10000;
int length = 300;
void setup(){
  size(800,800,P3D); 
  frameRate(30);
  
  //videoExport = new VideoExport(this);
  //videoExport.startMovie();

}

void draw(){
   background(0);
   translate(width/2,height/2);
   strokeWeight(2);
   stroke(255);
  for(int i=0; i<length; i++){
     strokeWeight(10.5*noise(i+t));
     stroke(175,220,220,80);
     point(x(p,q,r,n,xrate*i),y(p,q,r,n,yrate*i),z(.4*q,zrate*i));
   }
   for(int i=0; i<20000; i++){
     strokeWeight(2);
     stroke(175,220,220,95);
     point(x(p,q,r,n,t-i),y(p,q,r,n,t-i),z(.3*q,t+zrate*i));
   }
   t+=trate;
}

float x(float p, float q, float r, float n, float t){
  return r*cos(q*t)*(n+cos(p*t))+r*cos(q*t);
}

float y(float p, float q, float r, float n, float t){
  return r*sin(q*t)*(-n+cos(p*t))+r*sin(p*t)*cos(q*t);
}

float z(float p, float t){
  return r*n*sin(n+p*t);
}

void keyPressed() {
  if (key == 'q') {
   //videoExport.endMovie();
   exit();
  }
}
