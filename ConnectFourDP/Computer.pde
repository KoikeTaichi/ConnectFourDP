public class Computer {
  private Strategy strategy;  // 委譲先の戦略 (すべての戦略で共通の型)

  // コンストラクタで、このコンピュータが使用する戦略を指定する
  public Computer(Strategy strategy) {
    this.strategy = strategy;
  }

  // 途中で戦略を変えたいときに呼ぶメソッド
  public void setStrategy(Strategy strategy) {
    this.strategy = strategy;
  }

  // 思考するメソッド。
  // 実際の処理は丸投げ
  public int think(Board board, int turn) {
    return strategy.think(board, turn);
  }
}
