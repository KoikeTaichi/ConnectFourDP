public class MonteCarloStrategy implements Strategy {
  @Override
    public int think(Board board, int col) {
    int winCnt[]=new int[board.getXsize()], drawCnt[]=new int[board.getXsize()], loseCnt[]=new int[board.getXsize()], turn=-col;
    for (int i=0; i<board.getXsize(); i++) {
      if (board.getColor(i, 0)==EMP&&reachCheck(i, board.getYsize()-1-board.getRowCnt(i), board, turn)) return i;
    }
    for (int i=0; i<board.getXsize(); i++) {
      //if (board.getColor(i, 0)!=EMP) continue;
      for (int j=0; j<1; j++) {
        Board tmp=new Board(7, 6);
        
        tmp.put(i, col);
        turn=-col;
        while (tmp.check()==-2) {
          boolean putReach=false;
          for (int k=0; k<tmp.getXsize(); k++) {
            if (tmp.getColor(k, 0)==EMP&&reachCheck(k, tmp.getYsize()-1-tmp.getRowCnt(k), tmp, turn)) {
              tmp.put(k, turn); 
              putReach=true;
              break;
            }
          }
          if (!putReach) {
            int putRow=(int)random(tmp.getXsize());
            while (tmp.getColor(putRow, 0)!=EMP)putRow=(int)random(tmp.getXsize());
            tmp.put(putRow, turn);
          }
          turn*=-1;
        }
        int result=tmp.check();
        if (result==col) {
          winCnt[i]++;
        } else if (result==-col) {
          loseCnt[i]++;
        } else {
          drawCnt[i]++;
        }
      }
    }
    int selectRow=0;
    for (int i=0; i<board.getXsize(); i++) {
      if (winCnt[selectRow]+drawCnt[selectRow]<winCnt[i]+drawCnt[i]) {
        selectRow=i;
      }
    }
    return selectRow;
  }

  private boolean reachCheck(int x, int y, Board board, int turn) {
    int cnt=1;
    int tmpX=x;
    int tmpY=y;
    boolean clear=false;
    if (turn==EMP) return clear;
    if ((y>0&&board.getColor(x, y-1)==turn)||(y<board.getYsize()-1&&board.getColor(x, y+1)==turn)) {
      while (tmpY>0&&board.getColor(x, tmpY-1)==turn) {
        tmpY--;
        cnt++;
      }
      tmpY=y;
      while (tmpY<board.getYsize()-1&&board.getColor(x, tmpY+1)==turn) {
        tmpY++;
        cnt++;
      }
      if (cnt>=4) {
        clear=true;
      }
    }
    if (((x>0&&board.getColor(x-1, y)==turn)||(x<board.getXsize()-1&&board.getColor(x+1, y)==turn))&&!clear) {
      cnt=1;
      tmpX=x;
      tmpY=y;
      while (tmpX>0&&board.getColor(tmpX-1, y)==turn) {
        tmpX--;
        cnt++;
      }
      tmpX=x;
      while (tmpX<board.getXsize()-1&&board.getColor(tmpX+1, y)==turn) {
        tmpX++;
        cnt++;
      }
      if (cnt>=4) {
        clear=true;
      }
    }
    if (((x>0&&y>0&&board.getColor(x-1, y-1)==turn)||(x<board.getXsize()-1&&y<board.getYsize()-1&&board.getColor(x+1, y+1)==turn))&&!clear) {
      cnt=1;
      tmpX=x;
      tmpY=y;
      while (tmpX>0&&tmpY>0&&board.getColor(tmpX-1, tmpY-1)==turn) {
        tmpX--;
        tmpY--;
        cnt++;
      }
      tmpX=x;
      tmpY=y;
      while (tmpX<board.getXsize()-1&&tmpY<board.getYsize()-1&&board.getColor(tmpX+1, tmpY+1)==turn) {
        tmpX++;
        tmpY++;
        cnt++;
      }
      if (cnt>=4) {
        clear=true;
      }
    }
    if (((x>0&&y<board.getYsize()-1&&board.getColor(x-1, y+1)==turn)||(x<board.getXsize()-1&&y>0&&board.getColor(x+1, y-1)==turn))&&!clear) {
      cnt=1;
      tmpX=x;
      tmpY=y;
      while (tmpX>0&&tmpY<board.getYsize()-1&&board.getColor(tmpX-1, tmpY+1)==turn) {
        tmpX--;
        tmpY++;
        cnt++;
      }
      tmpX=x;
      tmpY=y;
      while (tmpX<board.getXsize()-1&&tmpY>0&&board.getColor(tmpX+1, tmpY-1)==turn) {
        tmpX++;
        tmpY--;
        cnt++;
      }
      if (cnt>=4) {
        clear=true;
      }
    }
    return clear;
  }
}
