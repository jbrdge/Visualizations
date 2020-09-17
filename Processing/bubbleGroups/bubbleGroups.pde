ArrayList<Bubble> bubs = new ArrayList<Bubble>();
float t=0;
float r=0;
float probability=0.09;
void setup(){
  size(800,800);
  colorMode(HSB,360,100,100);
}

void draw(){
  background(360);
  r = random(1);
  if (r>1-probability){
    addBubb();
  }
  if(!(bubs.isEmpty())){
    for (Bubble temp : bubs) {
      if(temp.getLocation().y<-100){
        temp.kill();
      }
      else{
        temp.showBubs();
      }
    }
  }
  for (int n=0;n<bubs.size();n++) {
    if(!bubs.get(n).isAlive()){
      bubs.remove(bubs.get(n));
    }
  }
  t+=0.1;
}

void mousePressed(){
  Bubble b = new Bubble(bubs);
  bubs.add(b);
}

void addBubb(){
  Bubble b = new Bubble(bubs, random(0,800),random(0,900));
  bubs.add(b);
  }
  
void keyPressed() {
  if (key == 'q') {
   saveFrame("bubbleGroups-######.png");
   exit();
  }
}
  
  
