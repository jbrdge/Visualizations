class Planet {
  float size;
  float angle;
  float distance;
  float angular_momentum;
  boolean hole;
  Planet[] planets;
  
  Planet(float r, float d, boolean is_a_hole) {
    size = r;
    distance = d;
    angle = random(0,2*PI);
    angular_momentum = exp(-(d/50));
    hole = is_a_hole;
  }
  
  void spawnMoons(int total){
    planets = new Planet[total];
    for(int i=0; i<planets.length; i++){
      float r = size*random(0.1,0.4);
      float d = random(50,300);
      planets[i] = new Planet(r,d, false);
    }
  }
  
  void show(){
    pushMatrix();
    //line(0,0,distance*cos(angle),distance*sin(angle));
    rotate(angle);
    translate(distance,0);
    
    if(hole){
      stroke(0);
      fill(0);
    }
    else{
      stroke(255);
      fill(255, 50);
    }
    ellipse(0,0,size*2, size*2);
    if(planets!= null){
      for (int i=0; i<planets.length; i++){
        planets[i].show();
      }
    }
    popMatrix();
  }
  
  void update_angle(){
    angle += angular_momentum;
  }
}
