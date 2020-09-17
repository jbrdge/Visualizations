class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse = new PVector(100*cos(PI), 100*sin(PI));
  
  Mover() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,2);
    acceleration = new PVector(0.01, 0);
  }
  
  Mover(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(0,.2);
    acceleration = new PVector(0.01, 0);
  }
  
  void update(float t) {
    mouse.x = 150*cos(t*PI)+100*cos(t*PI*4/3)+30*cos(-t*PI*3/2);
    mouse.y = 150*sin(t*PI)+100*sin(t*PI*4/3)+30*sin(-t*PI*3/2);
    stroke(255,40);
    strokeWeight(5);
    point(150*cos(t*PI)+100*cos(t*PI*4/3)+30*cos(-t*PI*3/2),150*sin(t*PI)+100*sin(t*PI*4/3)+30*sin(-t*PI*3/2));
    noStroke();
    mouse.sub(location);
    mouse.setMag(5.2);
    acceleration = mouse;
    
    //acceleration = PVector.random2D();
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(5);
  }
  
  void edges(){
    if (location.x > width/2) location.x =-width/2;
    if (location.x < -width/2) location.x = width/2;
    if (location.y > height/2) location.y = -height/2;
    if (location.y < -height/2) location.y = height/2;
  }
  
  void display(){
    ellipse(location.x,location.y,5,5);
  }
  
  void setAcceleration(float _x, float _y){
    acceleration.x = _x;
    acceleration.y = _y;
  }
  

}
