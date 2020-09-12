float t = 30;
float p = 7;
float q = 5;
float r = 15;
float n = 2;
float x;
float y;
float z;
float xrate = .00005;
float yrate = .00005;
float zrate = 0;
float k = 1;
boolean T=true;
float delta_t=0.0001;

void setup(){
  size(720,720,P3D); 
  frameRate(30);
}

void draw(){
   blendMode(ADD);
   background(0);
   translate(-40,30);
   for(int i=1;i<5; i++){
     for(int j=1;j<12; j+=3){
       pushMatrix();
       translate(i*160, j*180/3);
       rotate(t*PI/4);
       drawCircle(p+i, q+j, r, n, PI*t, k);
       popMatrix();
     }
   }
   //if(t<=-0.5){T=true;}
   //if(t>=0.5){T=false;}
   //if(T){delta_t+=0.0001;}
   //else{delta_t-=0.0001;}
   //t+=delta_t;
    t+=0.01;
}

float x(float p, float q, float r, float n, float t){
  return r*cos(q*t*PI)*(n+cos(p*t*PI));
}

float y(float p, float q, float r, float n, float t){
  return r*sin(q*t*PI)*(n+cos(-p*t*PI));
}

float z(float p, float t){
  return -r*sin(p*t*PI);
}

void drawCircle(float p, float q, float r, float n, float t, float k){

   strokeWeight(1);
   noFill();
   stroke(255,40);
   for(int i=1; i<30000; i++){
     strokeWeight(2);
     stroke(170+40*sin(i*PI/500),120+30*sin(i*PI/500),250+40*sin(i*PI/500), 20);
     pushMatrix();
     point(x(p,q,r+8*cos(i*t/1000),n,t+i*xrate),y(p,q,r+8*sin(i*t/1000),n,t+i*yrate),0.5*z(q,0));  
     popMatrix();  
 }
}


void keyPressed() {
  if (key == 'q') {
   saveFrame("torusIterations-######.png");
   exit();
  }
}
