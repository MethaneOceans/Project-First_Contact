class InventoryManager {
  private ArrayList<Collectable> collectables;
  private ArrayList<Collectable> markedForDeathCollectables;
  private ArrayList<InventoryObject> inventoryObjects;
  private PImage Background;
  public InventoryObject currentSelection;
  
  public InventoryManager() {
    collectables = new ArrayList<Collectable>();
    markedForDeathCollectables = new ArrayList<Collectable>();
    inventoryObjects = new ArrayList<InventoryObject>();
  }
  
  public void draw() {
    int i = 0;
    translate(150, 630);
    for(InventoryObject c : inventoryObjects) {
      c.index = i;
      c.draw();
      translate(193, 0);
      i++;
    }
  }

  public void addCollectable(InventoryObject collectableObject) {
    collectables.add(collectableObject.collectable);
    inventoryObjects.add(collectableObject);
  }
  
  public void addCollectable(Collectable collectable, String identifier) {
    collectables.add(collectable);
    InventoryObject item = new InventoryObject(identifier, 183, 148, collectable);
    inventoryObjects.add(item);
  }
  
  public void addCollectable(Collectable collectable, String identifier, String altImageFile, int index) {
    collectables.add(collectable);
    InventoryObject item = new InventoryObject(identifier, 183, 148, collectable, altImageFile, index);
    inventoryObjects.add(item);
  }
  
  public void removeCollectable(Collectable collectable) {
    markedForDeathCollectables.add(collectable);
  }
  
  public boolean containsCollectable(Collectable collectable) {
    return collectables.contains(collectable);
  }
  
  public void clearMarkedForDeathCollectables() {
    if(markedForDeathCollectables.size() > 0) {
      for(Collectable collectable : markedForDeathCollectables) {
        inventoryObjects.remove(currentSelection);
        currentSelection = null;
        collectables.remove(collectable);
      }
      markedForDeathCollectables  = new ArrayList<Collectable>();
    }
  }
  
  public boolean currentSelectionEquals(Collectable collectable) {
    if(currentSelection == null) {
      return false;
    } else if(currentSelection.collectable == collectable) {
      return true;
    } else {
      return false;
    }
  }
  
  public boolean currentSelectionEquals(InventoryObject collectable) {
    if(currentSelection == null) {
      return false;
    } else if(currentSelection == collectable) {
      return true;
    } else {
      return false;
    }
  }
  
  public void mouseClicked() {
    for(InventoryObject obj : inventoryObjects) {
      obj.mouseClicked();
    }
  }
  
  public void mouseMoved() {
    for(InventoryObject obj : inventoryObjects) {
      obj.mouseMoved();
    }    
  }
  
}
