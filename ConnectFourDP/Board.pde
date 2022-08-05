class Board {
  private int Xsize, Ysize, board[][], rowCnt[]=new int[Xsize];
  public Board(int Xsize, int Ysize) {
    this.Xsize=Xsize;
    this.Ysize=Ysize;
    this.board=new int[Xsize][Ysize];
    this.rowCnt=new int[Xsize];
    for (int i=0; i<Xsize; i++) {
      for (int j=0; j<Ysize; j++) {
        board[i][j]=EMP;
      }
    }
  }

  public void put(int row, int col) {
    board[row][Ysize-1-rowCnt[row]]=col;
    rowCnt[row]++;
  }

  public int getXsize() {
    return Xsize;
  }

  public int getYsize() {
    return Ysize;
  }

  public int getColor(int x, int y) {
    return board[x][y];
  }

  public int getRowCnt(int row) {
    return rowCnt[row];
  }

  public int check() {
    for (int i=0; i<Xsize; i++) {
      if (this.getColor(i, 0)==EMP) {
        break;
      }
      if (i==Xsize-1) {
        return 0;
      }
    }
    for (int i=0; i<Xsize; i++) {
      for (int j=0; j<Ysize; j++) {
        if (connectCheck(i, j)) {
          if (this.getColor(i, j)==RED) {
            return RED;
          } else {
            return YELLOW;
          }
        }
      }
    }
    return -2;
  }

  public boolean connectCheck(int x, int y) {
    int cnt=1;
    int tmpX=x;
    int tmpY=y;
    boolean clear=false;
    if (this.getColor(x, y)==EMP) return clear;
    if ((y>0&&this.getColor(x, y-1)==this.getColor(x, y))||(y<Ysize-1&&this.getColor(x, y+1)==this.getColor(x, y))) {
      while (tmpY>0&&this.getColor(x, tmpY-1)==this.getColor(x, y)) {
        tmpY--;
        cnt++;
      }
      tmpY=y;
      while (tmpY<Ysize-1&&this.getColor(x, tmpY+1)==this.getColor(x, y)) {
        tmpY++;
        cnt++;
      }
      if (cnt>=4) {
        clear=true;
      }
    }
    if (((x>0&&this.getColor(x-1, y)==this.getColor(x, y))||(x<Xsize-1&&this.getColor(x+1, y)==this.getColor(x, y)))&&!clear) {
      cnt=1;
      tmpX=x;
      tmpY=y;
      while (tmpX>0&&this.getColor(tmpX-1, y)==this.getColor(x, y)) {
        tmpX--;
        cnt++;
      }
      tmpX=x;
      while (tmpX<Xsize-1&&this.getColor(tmpX+1, y)==this.getColor(x, y)) {
        tmpX++;
        cnt++;
      }
      if (cnt>=4) {
        clear=true;
      }
    }
    if (((x>0&&y>0&&this.getColor(x-1, y-1)==this.getColor(x, y))||(x<Xsize-1&&y<Ysize-1&&this.getColor(x+1, y+1)==this.getColor(x, y)))&&!clear) {
      cnt=1;
      tmpX=x;
      tmpY=y;
      while (tmpX>0&&tmpY>0&&this.getColor(tmpX-1, tmpY-1)==this.getColor(x, y)) {
        tmpX--;
        tmpY--;
        cnt++;
      }
      tmpX=x;
      tmpY=y;
      while (tmpX<Xsize-1&&tmpY<Ysize-1&&this.getColor(tmpX+1, tmpY+1)==this.getColor(x, y)) {
        tmpX++;
        tmpY++;
        cnt++;
      }
      if (cnt>=4) {
        clear=true;
      }
    }
    if (((x>0&&y<Ysize-1&&this.getColor(x-1, y+1)==this.getColor(x, y))||(x<Xsize-1&&y>0&&this.getColor(x+1, y-1)==this.getColor(x, y)))&&!clear) {
      cnt=1;
      tmpX=x;
      tmpY=y;
      while (tmpX>0&&tmpY<Ysize-1&&this.getColor(tmpX-1, tmpY+1)==this.getColor(x, y)) {
        tmpX--;
        tmpY++;
        cnt++;
      }
      tmpX=x;
      tmpY=y;
      while (tmpX<Xsize-1&&tmpY>0&&this.getColor(tmpX+1, tmpY-1)==this.getColor(x, y)) {
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

  @Override
    public String toString() {
    StringBuilder sb = new StringBuilder();
    for (int i=0; i<Ysize; i++) {
      for (int j=0; j<Xsize; j++) {
        if (this.getColor(j, i)==RED) {
          sb.append("●  ");
        } else if (this.getColor(j, i)==YELLOW) {
          sb.append("○  ");
        } else {
          sb.append("    ");
        }
      }
      sb.append("\n");
    }
    return sb.toString();
  }
}
