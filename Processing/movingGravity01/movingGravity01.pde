ArrayList<Mover> ms = new ArrayList<Mover>();

float t=0;

void setup() {
  size(800, 800);
  Mover j;
  for(int i=0; i<2000; i++){
    j = new Mover(random(-width/2,width/2),random(-height/2,height/2));
    ms.add(j);
  }
}

void draw() {
  translate(width/2, height/2);
  colorMode(HSB);
  background(250,100,200);
  noStroke();
  fill(150,100,100, 200);
  for(int i=0; i<2000; i++){
    ms.get(i).update(t*i/20);
    ms.get(i).edges();
    ms.get(i).display();
  }
  println(frameCount);
  t+=0.001;
}

void keyPressed() {
  if (key == 'q') {
   saveFrame("Knot-######.png");
   exit();
  }
}
