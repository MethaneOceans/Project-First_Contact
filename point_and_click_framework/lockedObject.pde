class LockedObject extends TextObject {
  private Collectable collectable;
  private GameObject replaceWith;
  
  public LockedObject(String identifier, int x, int y, int owidth, int oheight, 
                       String gameObjectImageFile, String text, GameObject replaceWith) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, text);
    this.replaceWith = replaceWith;
  }
  
  public void unlock() {
    sceneManager.getCurrentScene().removeGameObject(this);
    sceneManager.getCurrentScene().addGameObject(replaceWith);
  } 
}