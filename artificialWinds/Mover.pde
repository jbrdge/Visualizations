class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration1;
  PVector acceleration2;
  PVector delt1 = new PVector(100*cos(PI), 100*sin(PI));
  PVector delt2 = new PVector(100*cos(PI), 100*sin(PI));
  
  Mover() {
    location = new PVector(random(-width/2,width/2), random(-height/2,height/2));
    velocity = new PVector(0,.2);
    acceleration1 = new PVector(0.01, 0);
    acceleration2 = new PVector(0, 0.01);
  }
  
  Mover(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(0,.2);
    acceleration1 = new PVector(0.01, 0);
    acceleration2 = new PVector(0, 0.01);
  }
  
  void update(float t) {
    delt1.x = 20*cos(t*PI)+50*cos(t*PI*4)+250;
    delt1.y = 20*sin(t*PI)+50*sin(t*PI*4.1);
    delt2.x = 20*cos(t*PI*1.5)+50*cos(t*PI*4)-250;
    delt2.y = 20*sin(t*PI*1.5)+50*sin(t*PI*3.9);
    noStroke();
    fill(5,25,97, 150);
    ellipse(20*cos(t*PI)+50*cos(t*PI*4.1)+250,20*sin(t*PI)+50*sin(t*PI*4.1),3,3);
    fill(5,5,97, 150);
    ellipse(20*cos(t*PI*1.5)+50*cos(t*PI*3.5)-250,20*sin(t*PI*1.5)+50*sin(t*PI*3.5),3,3);
    delt1.sub(location);
    delt1.setMag(.1);
    delt2.sub(location);
    delt2.setMag(.3);
    fill(55,100,100,360);
    acceleration1 = delt1;
    acceleration2 = delt2;
    //acceleration = PVector.random2D();
    if(delt1.x>delt2.x){
      velocity.x+=acceleration1.x;
    }
    if(delt1.x<=delt2.x){
      velocity.x+=acceleration2.x;
    }
    if(delt1.y>delt2.y){
      velocity.y+=acceleration1.y;
    }
    if(delt1.y<=delt2.y){
      velocity.y+=acceleration2.y;
    }
    location.add(velocity);
    velocity.limit(5);
  }
  
  void edges(){
    if (location.x > width/2) location.x =-width/2;
    if (location.x < -width/2) location.x = width/2;
    if (location.y > height/2) location.y = -height/2;
    if (location.y < -height/2) location.y = height/2;
  }
  
  void display(color col){
    fill(30,50,50);
    noFill();
    stroke(330,50,50);
    float d = 10*dist(delt1.x,delt1.y,location.x,location.y)/300;
    //ellipse(location.x,location.y,d,d);
    pushMatrix();
    translate(location.x,location.y);
    box(24);
    popMatrix();
  }
  
  void setAcceleration(PVector accel, float _x, float _y){
    accel.x = _x;
    accel.y = _y;
  }
  

}
