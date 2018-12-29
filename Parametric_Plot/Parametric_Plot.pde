Torus m = new Torus();
ArrayList<Torus> mlist = new ArrayList<Torus>();
float t=0.0001;
float change = 0.000001;

void setup(){
  size(1000,1000,P3D);
  colorMode(HSB);
  for(int i=0; i<4000 ;i++){
    mlist.add( new Torus(i,i,2*i));
  }
}

void draw(){
  colorMode(BLEND);
  background(0);
  
  for(int i=0; i< 4000; i++){
    mlist.get(i).Show();
    mlist.get(i).Update_Location();
    mlist.get(i).Update_Time();
    mlist.get(i).Update_theta(change);
    mlist.get(i).Update_phi(change/100);
  }
  t+=0.01;
}
