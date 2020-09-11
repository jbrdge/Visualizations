ArrayList<PVector> hexagon = new ArrayList<PVector>();
ArrayList<PVector> rect = new ArrayList<PVector>();
ArrayList<PVector> tween = new ArrayList<PVector>();
float t;
float time;

void setup(){
  
  size(800,800);
  pixelDensity(2);
  colorMode(HSB,360,100,100);
  frameRate(30);
  t=0;
  time=0;
  
  for(int i=0; i< 6; i++){
      rect.add(new PVector(0,0));
      tween.add(new PVector(0,0));
      hexagon.add(new PVector(52*cos(-PI*i/3),52*sin(-PI*i/3)));
      if(i==0 || i== 1||i==5){rect.get(i).x = 15;}
      else{rect.get(i).x = -15;}
      if(i==0 || i== 3){rect.get(i).y = 0;}  
      else if(i==1 || i== 2){rect.get(i).y = -50;} 
      else{rect.get(i).y = 50;} 
  }
}

void draw(){
  noiseSeed(1080);
  translate(100,100);
  time=1.5*sin(t)+0.5;
  //translate(width, 0);
  rotate(PI/3);
  println(frameCount);
  background(0);
  stroke(0);
  noFill();
  strokeWeight(2);
  if(time>0 &&time<1){
    for(int i=0; i<6; i++){
      tween.get(i).x = lerp(rect.get(i).x,hexagon.get(i).x, time);
      tween.get(i).y = lerp(rect.get(i).y,hexagon.get(i).y, time);
    }
    t+=0.03;
  }
  else{t+=0.09;}
  pushMatrix();
  for(int k=-35; k<35; k++){
    pushMatrix();
    if(time>0 && time<1){
      translate(0,k*100-k*lerp(0,14,time));
    }
    else if(time<0){
      translate(0,k*100);
    }
    else{
      translate(0,k*86);
    }
    for(int j=-35; j<35; j++){
    fill(360*noise(j*500+time/2,k*100+time/2)+50,50,30+100*noise(j*500+time/2,k*100));
    pushMatrix();
    if(time>0 && time<1){
      translate(j*30+j*lerp(0,45,time),j*50-j*lerp(0,7,time));
      beginShape();
      for(int i=0; i<= 6; i++){
      vertex(tween.get(i%6).x,tween.get(i%6).y);
      }
      endShape();
    }
    else if(time<0){
      translate(j*30,j*50);
      beginShape();
      for(int i=0; i<= 6; i++){
      vertex(rect.get(i%6).x,rect.get(i%6).y);
      }
      endShape();
    }
    else{
      translate(j*75,j*43);
      beginShape();
      for(int i=0; i<= 6; i++){
      vertex(hexagon.get(i%6).x,hexagon.get(i%6).y);
      }
      endShape();
    }
    popMatrix();
    }
    popMatrix();
  }
  popMatrix();
}

void keyPressed() {
  if (key == 'q') {
   saveFrame("hexToRect-######.png");
   exit();
  }
}
