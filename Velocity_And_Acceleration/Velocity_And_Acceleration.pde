import com.hamoid.*;
VideoExport videoExport;

ArrayList<Mover> ms = new ArrayList<Mover>();
Mover m;
Mover n;
Mover o;
float t;

void setup() {
  size(800, 800);
  Mover j;
  //m = new Mover();
  //n = new Mover();
  //o = new Mover();
  for(int i=0; i<5000; i++){
    j = new Mover(i*20,0);
    ms.add(j);
  }
  videoExport = new VideoExport(this);
  videoExport.startMovie();
}

void draw() {
  translate(width/2, height/2);
  colorMode(HSB);
  background(250,100,200);
  noStroke();
  fill(150,100,100, 100);
  for(int i=0; i<5000; i++){
    ms.get(i).update(t*i/100);
    ms.get(i).edges();
    ms.get(i).display();
  }
  videoExport.saveFrame();
  println(frameCount);
  t+=0.0005;
}

void keyPressed() {
  if (key == 'q') {
  videoExport.endMovie();
   exit();
  }
}
