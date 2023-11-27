class Collectable {
  private String name;
  private String inventoryIcon;
  private PImage icon;
  private boolean hasIcon;
  private int index = -1;
  private boolean isMulti;
  //Could be expanded to add an amount, for example
  
  public Collectable(String name, String inventoryIcon) {
    this(name, inventoryIcon, false);
  }

  public Collectable(String name, String inventoryIcon, boolean pIsMulti) {
    this.name = name;
    this.inventoryIcon = inventoryIcon;
    this.isMulti = pIsMulti;
    hasIcon = !inventoryIcon.equals("");
    if(hasIcon) {
      this.icon = loadImage(inventoryIcon);
    }
    //I know the image gets loaded twice. I shouldn't be expected to optimize 3KB of memory in a game this small
  }
  
  /*public Collectable(String name, String inventoryIcon, int index) {
    this(name, inventoryIcon);
    this.index = index;
  }*/
  
  /*public Boolean isMulti() {
    println("checking multi");
    if(index != -1) {
      println("is multi");
      return true;
    } else {
      println("is not multi; " + index);
      return false;
    }
  }*/
  
  public Boolean hasIcon() {
    return hasIcon;
  }
  
  public PImage getIcon() {
    return icon;
  }
  
  public String getName() { 
    return name; 
  }
  
  public String getInventoryIcon() {
    return inventoryIcon;
  }
  
  public String getGameObjectImageFile() { 
    return inventoryIcon; 
  } 
  
  public void setGameObjectImageFile(String imageFile) {
    inventoryIcon = imageFile;
  }
  
  @Override 
  public boolean equals(Object obj) { 
    if (obj == this) { return true; } 
    if (obj == null || obj.getClass() != this.getClass()) { return false; } 
    Collectable otherCollectable = (Collectable) obj; 
    return otherCollectable.getName().equals(this.name);
  } 

  @Override 
  public int hashCode() { 
    final int prime = 13;
    return prime * this.name.hashCode();
  }
}
