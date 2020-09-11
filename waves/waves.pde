float t=0;
void setup(){
  size(800,800, P3D);
  frameRate(30);
}

void draw(){
  translate(width/2, height/2);
  background(0);
  stroke(255);
  strokeWeight(5);
  rotateX(PI/3);
  for(int i=-width; i<width; i+=15){
    for(int j=-height; j<height/2+10; j+=15){
      point(i,j, 15*sin((j+t)*PI/200)+15*cos((i+t)*PI/200));
    }
  }
  t+=1;
  println(frameCount);
}

void keyPressed() {
  if (key == 'q') {
   exit();
  }
}
