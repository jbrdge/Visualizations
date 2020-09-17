ArrayList<Mover> ms = new ArrayList<Mover>();
float t;

void setup() {
  size(800, 800,P3D);
  Mover j;
  for(int i=0; i<200; i++){
    j = new Mover(random(-width/2,width/2),random(-height,height/2));
    ms.add(j);
  }
  frameRate(30);
}

void draw() {
  translate(width/2, height/2);
   rotateX(-t*PI/600);
  colorMode(HSB,360,100,100);
  background(0);
  noFill();
  stroke(255,100,100,360);
  for(int i=0; i<200; i++){
    ms.get(i).update(t*i/100);
    ms.get(i).edges();
    ms.get(i).display(color(10, 68,86, 50));
  }
  t+=0.02;
}

void keyPressed() {
  if (key == 'q') {
    saveFrame("artificialWinds-######.png");
    exit();
  }
}
