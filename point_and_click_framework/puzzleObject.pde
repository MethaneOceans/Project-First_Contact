// An object that resembles a puzzle so the scene can draw it.
abstract class PuzzleObject {
  private Boolean locked;
  
  // Abstract members because all puzzles work vastly different
  public abstract void draw();
  public abstract void mouseClicked();
  public abstract void update();
  public abstract void onSolve(); // This should change a scene like adding an object to enter another scene or placing a collectible
  
  public void unlock() {
    locked = false;
  }
  
  // TODO: Implement standard ways to interact with the puzzle like buttons and dials
}

/*
class WavePuzzle extends PuzzleObject {
  // You need to implement all abstract members of PuzzleObject
}
*/
