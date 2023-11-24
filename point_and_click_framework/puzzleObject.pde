// An object that resembles a puzzle so the scene can draw it.
abstract class PuzzleObject {
  private GameObject returnObject; // Finishing the puzzle returns a gameobject... can change for doing some other stuff
  private GameObject removeObject
  
  public abstract void draw();
  public abstract void mouseClicked();
  public abstract void 
}

class WavePuzzle extends PuzzleObject {
  private Dial ampWaveA;
  private Dial ampWaveB;
  
  private float ampWaveC;
  private float ampWaveD;
  
  
  private Dial periodWaveA;
  
  public void draw() {
    point(0, 0);
  }
  
  public void mouseClicked() {
    
  }
  
  
  
  // Classes for functionality of puzzle
  private class Dial {
    private int xPos, yPos;
    
    public Dial(int xPos, int yPos) {
      
    }
  }
}
