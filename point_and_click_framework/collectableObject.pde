class CollectableObject extends GameObject {
  // Properties
  private Collectable collectable;
  private GameObject replaceWith;
  private boolean willReplaceByAnotherGameObject;
  
  // Constructor?
  public CollectableObject(String identifier, int x, int y, int owidth, 
                           int oheight, Collectable collectable) {
    this(identifier, x, y, owidth, oheight, collectable, null);
  }
  
  // Constructor
  public CollectableObject(String identifier, int x, int y, int owidth, 
                           int oheight, Collectable collectable, GameObject replaceWith) {
    super(identifier, x, y, owidth, oheight, collectable.getGameObjectImageFile());
    this.collectable = collectable;
    if(replaceWith != null) {
      this.replaceWith = replaceWith;
      this.willReplaceByAnotherGameObject = true;
    } else {
      this.willReplaceByAnotherGameObject = false;
    }
  }
  
  // Overrides GameObject draw
  @Override
  public void draw() {
    super.draw();
  }
  
  // Override mouseClicked compared to main code
  @Override
  public void mouseClicked() {
    if(mouseIsHovering) {
      inventoryManager.addCollectable(collectable);
      sceneManager.getCurrentScene().removeGameObject(this);
      if(willReplaceByAnotherGameObject) {
        sceneManager.getCurrentScene().addGameObject(replaceWith);  
      }
    }
  }
}
