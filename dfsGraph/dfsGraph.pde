ArrayList<PVector> v;
int t=0;
int b=0;
int[] output = new int[14];
int[] path = new int[14];
int count=-1;
int[][] nodes = {
{0,1,1,0,0,1,0,0,0,0,1,0,0,0},
{1,0,0,1,0,0,0,0,0,0,1,0,0,0},
{0,0,0,0,1,0,0,0,1,0,0,0,0,0},
{0,1,0,0,0,0,0,1,0,0,0,0,0,0},
{0,0,1,0,0,1,1,0,0,0,0,0,0,0},
{1,0,0,0,1,0,0,0,0,0,0,0,0,0},
{0,0,0,0,1,0,0,0,0,1,0,0,0,0},
{0,0,0,1,0,0,0,0,0,0,0,0,1,0},
{0,0,1,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,1,0,0,0,0,0,0,1},
{1,1,0,0,0,0,0,0,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,0,0,1,0,1},
{0,0,0,0,0,0,0,1,0,0,0,0,0,0},
{0,0,0,0,0,0,0,0,0,1,0,1,0,0},
};
void setup(){
  for(int x=0;x<width;x++){
    for(int y=0; y<height; y++){
      stroke(155*cos(x*PI/1000)+105*sin(y*PI/1000),55*cos(x*PI/1000)+155*sin(y*PI/1000),85*cos(x*PI/1000+PI/2)+155*sin(y*PI/1000));
      point(x,y);
    }
  }
  translate(200,200);
  //background(50);
  randomSeed(2151);
  size(800,800);
  frameRate(30);
  v = new ArrayList<PVector>();
  for(int i=0;i<14;i++){
    v.add(new PVector(i*30+int(random(-200,200)), i*30+int(random(-200,200))));

    
  }
  for(int i=0;i<14;i++){
    for(int j=0; j<14;j++){
      if(nodes[i][j]==1 && i<j){
        stroke(255);
        line(v.get(i).x,v.get(i).y,v.get(j).x,v.get(j).y);
      }
    }
    stroke(0);
    fill(255);
    strokeWeight(2);
    ellipse(v.get(i).x,v.get(i).y,30,30);
  }
    DFS(0);

}

void draw(){
  translate(200,200);
  fill(205,100,110);
  if (b<14){
    ellipse(v.get(path[b]).x,v.get(path[b]).y,30,30);
  }
  else{
      for(int i=0;i<14;i++){
        stroke(0);
        fill(255);
        strokeWeight(2);
        ellipse(v.get(i).x,v.get(i).y,30,30);
      }
      b=-1;
  }
  if(t%30==10||b==-1){
    b+=1;
  }
  t+=1;

}

void DFS(int i){
  count+=1;
  output[i]=1;
  path[count]=i;
  for(int j=0; j<14;j++){
    if(output[j]==0&&nodes[i][j]==1){
      DFS(j);
    }
  }
}

void keyPressed() {
  if (key == 'q') {
   saveFrame("dfsGraph-######.png");
   exit();
  }
}
