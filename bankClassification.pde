Table table;
float[] data;
int n=0;

void setup(){
  size(1000,800);
  table = loadTable("bank.csv");
  println(table.getRowCount() + " total rows in table");
  
  background(190,180,155);
  
  //for(int n=0; n<table.getRowCount(); n++){

  //}
}

void draw(){
  translate(width/2,height/2);
    n=n%table.getRowCount();
    TableRow row = table.getRow(n);
    if(row.getInt(16)==1){
      stroke(100,80,125, 15);
      pushMatrix();
      translate(-height/4,0);
      fill(170,80,125, 15);
    }
    else{
      stroke(100,200,255, 15);
      pushMatrix();
      translate(height/4,0);
      fill(100,80,155, 15);
    }
    beginShape();
    for(int i=0; i<16;i++){
      vertex((150+int(row.getFloat(i)*10))*cos(i*PI/8),(150+int(row.getFloat(i)*10))*sin(i*PI/8));
      //line(i*50,int(row.getFloat(i)*10),(i+1)*50,int(row.getFloat(i+1)*10));
    }
    vertex((150+int(row.getFloat(0)*10))*cos(0),(150+int(row.getFloat(0)*10))*sin(0));
    endShape();
    popMatrix();
  //}
  n++;
}
