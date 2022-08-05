public class RandomStrategy implements Strategy {
  public int think(Board board, int col) {
    int selectRow=(int)random(board.getXsize());
    while (board.getColor(selectRow, 0)!=EMP)selectRow=(int)random(board.getXsize());
    Board tmp=new Board(8, 8);
    while (tmp.check()==-2) {
      int row=(int)random(tmp.getXsize());
      while (tmp.getColor(row, 0)!=EMP)row=(int)random(tmp.getXsize());
      tmp.put(row, RED);
    }
    return selectRow;
  }
}
