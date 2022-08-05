final int EMP=0, RED=1, YELLOW=-1;
Computer c1=new Computer(new RandomStrategy());
void setup() {
  int turn=1;
  Board b;
  b=new Board(7, 6);
  while (b.check()==-2) {
    int row=c1.think(b, turn);
    b.put(row, turn);
    turn*=-1;
  }
  println(b);
  exit();
}
void draw() {
}
