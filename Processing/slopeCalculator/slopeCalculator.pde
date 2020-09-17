float scale = 20; 

void setup(){
  size(360,360);
  frameRate(30);
}

void draw(){
  translate(width/2,height/2);
  background(255);
  //draw cartesian lines
  stroke(200);
  strokeWeight(1);
  for(int i=-10; i<10;i++){
    line(i*width/(scale), -height/2, i*width/(scale), height/2);
    line(-width/2, i*height/(scale), width/2, i*height/(scale));
  }
  stroke(100);
  strokeWeight(2);
  line(0, -height/2, 0, height/2);
  line(-width/2, 0, width/2, 0);
  stroke(0);
  strokeWeight(3);
  for(int i=-width/2; i<width/2; i++){ 
    line(i,-1*scale*1.8*sin(i*PI/36),i+1,-1*scale*1.8*sin((i+1)*PI/36));
  }
  stroke(255,0,0);
  line(slope(frameCount%width-width/2)[0],slope(frameCount%width-width/2)[1],slope(frameCount%width-width/2)[2],slope(frameCount%width-width/2)[3]);
  if(slope(frameCount%width-width/2)[1]==slope(frameCount%width-width/2)[3]){
    noLoop();
  }
}

float[] slope(float x){
  float h = 0.1;
  float[] tanLine = new float[4];
  float m = ((-1*scale*1.8*sin((x+h)*PI/36))-(-1*scale*1.8*sin((x)*PI/36)))/h;
  float b = -1*m*x+-1*scale*1.8*sin((x)*PI/36);
  tanLine[0] = x-10;
  tanLine[1] = m*(x-10)+b;
  tanLine[2] = x+10;
  tanLine[3] = m*(x+10)+b;
  return(tanLine);
}

void keyPressed() {
  if (key == 'q') {
   saveFrame("slopeCalculator-######.png");
   exit();
  }
}
