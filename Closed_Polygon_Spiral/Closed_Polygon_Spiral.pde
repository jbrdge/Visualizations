import com.hamoid.*;
VideoExport videoExport;


float t=0;
float a=100;
int n=3;

void setup(){
  size(1000,1000,P3D);
  frameRate(30);
  videoExport = new VideoExport(this);
  videoExport.startMovie();
}

void draw(){
  translate(width/2-150, height/2-100);
  background(0);
  
  for(int p =1;p<2;p++){
    translate(175*cos(p*PI/5),175*sin(p*PI/5));
    pushMatrix();
    //rotateZ(t*p*PI/40);
    for(int k=1;k<400;k+=4){
        //rotateX(sin(t*p*PI*k/100)*PI/100);
      for(int j=0;j<100;j++){
        stroke(25-(j/5)%300+100*sin(t*j/1000),160-80*sin(j/675*PI), 200);
        strokeWeight(3+2*sin(j/675*PI));
        point(k*x(2*a,PI*k/150+t+PI*j/150,n),k*y(2*a,PI*k/150+t+PI*j/150,n));
      }
    }
    popMatrix();
  }
  t+=0.1;
  if(frameCount>=900){
   videoExport.endMovie();
   exit();
  }
  videoExport.saveFrame();
  println(frameCount);
}

float x(float _a, float _t, int _n){
  return cos(PI/_n)*cos((PI/_n)*(2*floor(_t)+1))-(2*_t-2*floor(_t)-1)*sin(PI/_n)*sin((PI/_n)*(2*floor(_t)+1));
}

float y(float _a, float _t, int _n){
  return cos(PI/_n)*sin((PI/_n)*(2*floor(_t)+1))+(2*_t-2*floor(_t)-1)*sin(PI/_n)*cos((PI/_n)*(2*floor(_t)+1));
}

void keyPressed() {
  if (key == 'q') {
  videoExport.endMovie();
   exit();
  }
}
