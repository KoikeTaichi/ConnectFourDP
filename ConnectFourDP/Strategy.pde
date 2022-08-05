public interface Strategy {
  //局面と手番を受け取り、落とす箇所を決めるメソッド。結果はintで返す。
  //実装はサブクラスで。
  public abstract int think(Board board, int col);
}
