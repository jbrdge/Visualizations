Planet hole;

void setup(){
  size(800,800);
  hole = new Planet(40, 0, true);
  hole.spawnMoons(700);
}

void draw(){
  translate(width/2, height/2);
  background(0);
  hole.show();
  for (int i=0; i<hole.planets.length;i++){
    hole.planets[i].update_angle();
  }
}

void keyPressed() {
  if (key == 'q') {
   saveFrame("blackhole-######.png");
   exit();
  }
}
