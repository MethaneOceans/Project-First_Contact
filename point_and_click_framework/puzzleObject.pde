// An object that resembles a puzzle so the scene can draw it.
abstract class PuzzleObject extends GameObject {
  private Boolean solved = false;
  
  public PuzzleObject(String identifier, int x, int y, int owidth, int oheight) {
    super(identifier, x, y, owidth, oheight);
  }
  
  abstract public void draw();
  abstract public void mouseMoved();
  abstract public void mouseClicked();
  abstract public void onSolve();
  
}
