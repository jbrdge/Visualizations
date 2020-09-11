float t=0;
float r1=0.25;
float r2;
float n1;
float n2;
color begin = color(100,150,250);
color middle3 = color(90,150,190);
color middle2 = color(200,250,250);
color middle1 = color(250,50,250);
color end = color(50,200, 100);
color[] lerp_array = new color[800];
int counter=0;
void setup(){
  size(800,800,P3D);
  frameRate(15);
  for(int k=0; k<100; k++){
    lerp_array[k]= lerpColor(begin, middle1,.01*k);
    lerp_array[k+100]= lerpColor(middle1, middle2,.01*k);
    lerp_array[k+200]= lerpColor(middle2, middle3,.01*k);
    lerp_array[k+300]= lerpColor(middle3, end,.01*k);
    lerp_array[k+400]= lerpColor(end, middle3,.01*k);
    lerp_array[k+500]= lerpColor(middle3, middle2,.01*k);
    lerp_array[k+600]= lerpColor(middle2, middle1,.01*k);
    lerp_array[k+700]= lerpColor(middle1, begin,.01*k);
  }
}

void draw(){
  background(50);
  blendMode(LIGHTEST);
  
  stroke(255);
  strokeWeight(1);
  for(int m=0; m<4;m++){ 
    for(int n=0; n<4; n++){
      pushMatrix();
      translate(n*180+150,m*180+125);
      for(int i=0;i<401;i+=1){
        rotateX((1+m+n)*PI/(4000*(m*n+1)));
        rotateZ((1+m+n)*PI/(4000*(m*n+1)));
        stroke(lerp_array[(m*16+n*4+i+counter)%800], 1);
        line((r1*0)*x(1, t+PI*(i)/314, 4+n),r1*0*y(1, t+PI*(i)/314, 4+m),r1*100*x(1, t+PI*(i)/314, 4+n),r1*100*y(1, t+PI*(i)/314, 4+m));
        line((r1*100)*x(1, -t-PI*(i)/314, 4+n),r1*100*y(1, -t-PI*(i)/314, 4+m),r1*200*x(1, -t-PI*(i)/314, 4+n),r1*200*y(1, -t-PI*(i)/314, 4+m));
        line((r1*200)*x(1, t+PI*(i)/314, 4+n),r1*200*y(1, t+PI*(i)/314, 4+m),r1*300*x(1, t+PI*(i)/314, 4+n),r1*300*y(1, t+PI*(i)/314, 4+m));
        line((r1*100)*x(1, -t-PI*(i)/314, 4+n),r1*100*y(1, -t-PI*(i)/314, 4+m),r1*200*x(1, -t-PI*(i)/314, 4+n),r1*200*y(1, -t-PI*(i)/314, 4+m));
      }
      popMatrix();
    }
  }
  /*
  for(int i=0; i<400; i++){
    stroke(lerp_array[i]);
    strokeWeight(4);
    line((20+i*.6)*cos((i+t)*PI/45),(20+i*.6)*sin((i+t)*PI/45), (20+i*.7)*cos((i+t)*PI/45), (20+i*.7)*sin((i+t)*PI/45));
  }
  */
  counter+=5;
  t+=.05;
  println(frameCount);
}

void keyPressed() {
  if (key == 'q') {
   exit();
  }
}

float x(float _a, float _t, int _n){
  return cos(PI/_n)*cos((_a*PI/_n)*(2*floor(_t)+1))-(2*_t-2*floor(_t)-1)*sin(PI/_n)*sin((_a*PI/_n)*(2*floor(_t)+1));
}

float y(float _a, float _t, int _n){
  return cos(PI/_n)*sin((_a*PI/_n)*(2*floor(_t)+1))+(2*_t-2*floor(_t)-1)*sin(PI/_n)*cos((_a*PI/_n)*(2*floor(_t)+1));
}
