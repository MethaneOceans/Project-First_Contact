class Collectable {
  // Properties
  private String name;
  private String gameObjectImageFile;
  //Could be expanded to add an amount, for example
  
  // Constructor
  public Collectable(String name, String gameObjectImageFile) {
    this.name = name;
    this.gameObjectImageFile = gameObjectImageFile;
  }
  
  // Get property
  public String getName() { 
    return name; 
  }
  
  public String getGameObjectImageFile() { 
    return gameObjectImageFile; 
  } 
  
  // Override standard object methods
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
