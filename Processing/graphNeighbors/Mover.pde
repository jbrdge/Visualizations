class Mover{
  PVector location;
  float t;
  float timeVelocity;
  
  Mover(){
    t=random(25*PI);
    timeVelocity=random(.008*PI);
    location = new PVector(100*cos(PI*t/5)+100*cos(PI*t/17)+50*sin(PI*t/7), 100*sin(PI*t/5)+100*sin(PI*t/17)+50*sin(PI*t/7));
  }
  
  void update(){
    t+=timeVelocity;
    location = new PVector(100*cos(PI*t/5)+100*cos(PI*t/17)+50*sin(PI*t/7), 100*sin(PI*t/5)+100*sin(PI*t/17)+50*sin(PI*t/7));
  }
  
  void show(){
    if(location.x>1250)location.x=0;
    if(location.x<0)location.x=1250;
    if(location.y>800)location.y=0;
    if(location.y<0)location.y=800;
    
    point(location.x,location.y);
  }
}
