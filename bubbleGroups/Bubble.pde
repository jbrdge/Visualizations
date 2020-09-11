class Bubble{
  PVector location;
  PVector velocity;
  Boolean alive;
  ArrayList<Bubble> setOfBubbles;
  int numberOfCircles;
  ArrayList<Float> radii;
  ArrayList<PVector> circleLocations;
  PVector p = new PVector(0,0);
  
  Bubble(ArrayList<Bubble> B){
    radii = new ArrayList<Float>();
    circleLocations = new ArrayList<PVector>();
    location = new PVector(mouseX,mouseY);
    setOfBubbles = B;
    alive=true;
    numberOfCircles=int(1+random(6));
    for(int k=0; k<numberOfCircles;k++){
      radii.add(random(40,100));
      p = new PVector(random(-20,20),random(-30,30));
      circleLocations.add(p);
    }
  }
  
    Bubble(ArrayList<Bubble> B, float x, float y){
    radii = new ArrayList<Float>();
    circleLocations = new ArrayList<PVector>();
    location = new PVector(x,y);
    setOfBubbles = B;
    alive=true;
    numberOfCircles=int(1+random(6));
    for(int k=0; k<numberOfCircles;k++){
      radii.add(random(40,100));
      p = new PVector(random(-20,20),random(-30,30));
      circleLocations.add(p);
    }
  }
  
  Boolean isAlive(){
    return alive;
  }
  
  void kill(){
    alive =false;
  }
  
  void update(){
    setVelocity();
    location.add(velocity);
    if(location.y<-300){ alive=false;}
  }
  
  void setVelocity(){
    velocity = new PVector(random(-2.4,3),random(-3,1));
  }
  
  void showBubs(){
    this.update();
    if(alive){
        
          for(int i=-6;i<6;i++){
            for(int n=0; n<this.numberOfCircles;n++){
            fill((abs(i)%2)*360);
            noStroke();
            ellipse(this.location.x+circleLocations.get(n).x,this.location.y+circleLocations.get(n).y,this.radii.get(n)-i*10,this.radii.get(n)-i*10);
          }
        }
    }
  }
  
  PVector getLocation(){
    return location;
  }
}
