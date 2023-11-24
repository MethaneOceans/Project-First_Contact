class RequireObject extends TextObject {
  // Properties
  private Collectable collectable;
  private GameObject replaceWith;
  
  // Constructor
  public RequireObject(String identifier, int x, int y, int owidth, int oheight, 
                       String gameObjectImageFile, String text, 
                       Collectable collectable, GameObject replaceWith) {
    super(identifier, x, y, owidth, oheight, gameObjectImageFile, text);
    this.collectable = collectable;
    this.replaceWith = replaceWith;
  }
  
  // mouseClicked gets re-educated
  @Override
  public void mouseClicked() {
    if(mouseIsHovering && inventoryManager.containsCollectable(collectable)) {
      inventoryManager.removeCollectable(collectable);
      sceneManager.getCurrentScene().removeGameObject(this);
      sceneManager.getCurrentScene().addGameObject(replaceWith);
    } else {
      super.mouseClicked();
    }
  } 
}
