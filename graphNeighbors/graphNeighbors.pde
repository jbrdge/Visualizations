ArrayList<Mover> movers = new ArrayList<Mover>();

void setup(){
  size(720,720);
  frameRate(30);
  colorMode(HSB,360,100,100);
  for(int i=0; i< 1500; i++){
    Mover m = new Mover();
    movers.add(m);
  }
}

void draw(){
  translate(width/2,height/2);
  background(250, 45,20);
  
  strokeWeight(2);
  for(int i=0; i< 1500; i++){
    movers.get(i).update();
    //movers.get(i).show();
    stroke(200,50,100);
    for(int j=0; j<i;j+=3){
      stroke(300-i/5,50+20*sin(i),100);
      if(dist(movers.get(i).location.x,movers.get(i).location.y,movers.get(j).location.x,movers.get(j).location.y)<35){
        line(movers.get(i).location.x,movers.get(i).location.y,movers.get(j).location.x,movers.get(j).location.y);
      }
    }
  }
  println(frameCount);
}

void keyPressed() {
  if (key == 'q') {
   exit();
  }
}
