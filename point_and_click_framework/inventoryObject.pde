class InventoryObject extends GameObject {
  private Collectable collectable;
  public int index;
  private boolean isMulti;
  private int multiIndex;
  private boolean hasImage = true;
  private PImage image;

  public InventoryObject(String identifier, int owidth, int oheight, Collectable collectable) {
    this(identifier, owidth, oheight, collectable, "", -1);
  }
  
  public InventoryObject(String identifier, int owidth, int oheight, Collectable collectable, String altImageFile, int index) {
    super(identifier, 0, 0, owidth, oheight, collectable.getGameObjectImageFile());

    if(altImageFile != "") {
      image = loadImage(altImageFile);
    } else if(collectable.hasIcon) {
      image = collectable.getIcon();
    } else {
      hasImage = false;
    }

    this.collectable = collectable;
    if(index != -1) {
      multiIndex = index;
      isMulti = true;
    } else {
      isMulti = false;
    }
  }
  
  public void draw() {
    image(inventoryBackground, 0, 0, owidth, oheight);
    if(hasImage) {
      imageMode(CENTER);
      image(image, 103, 69, 100, 75);
      imageMode(CORNER);
    } else {
      rectMode(CENTER);
      fill(0);
      text(collectable.getName(), 103, 69, 100, 75);
      rectMode(CORNER);
    }

    if(inventoryManager.currentSelectionEquals(this)) {
      fill(0xFFFF4343, 50);
      rect(0, 0, owidth, oheight);
      fill(0);
    }
  }
  public void mouseMoved() {
    mouseIsHovering = false;
    int x = 150 + (owidth + 10) * index;
    int y = 630;
    //println(index + ": x = " + x + ", y = " + y);
    if(mouseX >= x && mouseX <= x + owidth &&
       mouseY >= y && mouseY <= y + oheight) {
        mouseIsHovering = true;
        //println("mouse hovering");
     }
  }
  
  
  public void mouseClicked() {
    if(mouseIsHovering) {
      //println("mouse hovering");
      if(inventoryManager.currentSelection == this){
        inventoryManager.currentSelection = null;
      }
      else {
        inventoryManager.currentSelection = this;
      }
    } else {
      //println("mouse not hovering");
    }
  }
}
