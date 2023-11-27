class MultiCollectableObject extends CollectableObject {
  private int index;
  private boolean hasAltImage;
  private String identifier;
  private String altImageFile;
  
  public MultiCollectableObject(String identifier, int x, int y, int owidth, 
                           int oheight, Collectable collectable, int index) {
    this(identifier, x, y, owidth, oheight, collectable, index, "", null);
  }
  
  public MultiCollectableObject(String identifier, int x, int y, int owidth, 
                           int oheight, Collectable collectable, int index, String altImageFile) {
    this(identifier, x, y, owidth, oheight, collectable, index, altImageFile, null);
  }  
  
  public MultiCollectableObject(String identifier, int x, int y, int owidth, 
                           int oheight, Collectable collectable, int index, GameObject replaceWith) {
    this(identifier, x, y, owidth, oheight, collectable, index, "", replaceWith);
  }  
  
  public MultiCollectableObject(String identifier, int x, int y, int owidth, 
                           int oheight, Collectable collectable,int index, String altImageFile, GameObject replaceWith) {
    
    super(identifier, x, y, owidth, oheight, collectable, replaceWith);
    this.altImageFile = altImageFile;
    if(altImageFile != "") {
      setAltImage(altImageFile);
      //collectable.setGameObjectImageFile(altImageFile);
    }
    this.identifier = identifier;
    this.index = index;

  }
  
  @Override
  public void draw() {
    super.draw();
    // textAlign(CENTER, CENTER);
    // textSize(40);
    // text(str(index), (float) x, (float) y, (float) owidth, (float) oheight);
    // textAlign(LEFT, TOP);
    
  }
  
@Override
  public void mouseClicked() {
    if(mouseIsHovering) {
      inventoryManager.addCollectable(super.collectable, identifier, altImageFile, index);
      sceneManager.getCurrentScene().removeGameObject(this);
      if(super.willReplaceByAnotherGameObject) {
        sceneManager.getCurrentScene().addGameObject(super.replaceWith);  
      }
    }
  }
}
