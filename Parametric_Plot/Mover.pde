class Mover{
  PVector location;
  PVector velocity;
  float radius0;
  float radius1;
  float phi;
  float theta;
  PVector time;
  
  Mover(){
    time = new PVector(0, 0, 0);
    location = new PVector(time.x, time.y, time.z);
    velocity= new PVector(1, 1, 1);
    radius0=500;
    radius1=150;
    phi=7*PI/10000;
    theta=2*PI/10000;
  }
  
  Mover(float a, float b, float c){
    time = new PVector(a, b, c);
    location = new PVector(time.x, time.y, time.z);
    velocity= new PVector(2, 2, 2);
    radius0=500;
    radius1=250;
    phi=PI/1000;
    theta=PI/2000+PI/2;
  }
  
  float x(float _t){
    return (radius0 + radius1*cos(theta*_t)*cos(phi*_t));
  }
  
  float y(float _t){
    return (radius0 + radius1*cos(theta*_t)*sin(phi*_t));
  }
  
  float z(float _t){
    return radius1*sin(theta*_t);
  }
  
  void Update_Location(){
    location.x = x(time.x);
    location.y = y(time.y);
    location.z = z(time.z);
  }
  
  void Update_Time(){
    time.x+=velocity.x;
    time.y+=velocity.y;
    time.z+=velocity.z;
  }
  
  void Update_theta(float _t){
    _t*=PI;
    theta+=_t;
  }
  
  void Update_phi(float _t){
    _t*=PI;
    phi+=_t;
  }
  
  void Show(){
    stroke(250,200,100);
    strokeWeight(5);
    point(location.x,location.y,location.z);
  }
  
  
}
