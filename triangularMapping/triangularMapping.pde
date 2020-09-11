float t=0;
void setup(){
  size(600,600);
  pixelDensity(2);
}

void draw(){
  translate(width/2, height/2);
  randomSeed(1010);
  background(0);
  fill(255);
  beginShape(TRIANGLE_STRIP);
  vertex(200*noise(t/3)*cos(0),100*noise(t/3)*sin(0)); 
  for(int i=0; i<400; i++){ 
    fill(255*random(1)+100);
     vertex(300*noise((t+i)/3)*cos(i*PI/20),300*noise(i/3)*sin(i*PI/20)); 
    vertex(200*noise((t+i)/3)*cos(i*PI/20),200*noise((t+i)/3)*sin(i*PI/20)); 
  }
  vertex(300*noise((t)/3)*cos(0),300*noise((t)/3)*sin(0)); 
  endShape();
  t+=0.05;
}
