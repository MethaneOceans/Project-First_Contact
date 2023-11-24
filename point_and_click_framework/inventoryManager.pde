class InventoryManager {
  // Properties
  private ArrayList<Collectable> collectables;
  private ArrayList<Collectable> markedForDeathCollectables;
  
  // Constructor
  public InventoryManager() {
     collectables = new ArrayList<Collectable>();
     markedForDeathCollectables = new ArrayList<Collectable>();
  }
  
  // Manage collectibles
  public void addCollectable(Collectable collectable) {
    collectables.add(collectable);
  }
  
  public void removeCollectable(Collectable collectable) {
    markedForDeathCollectables.add(collectable);
  }
  
  // Inception
  public boolean containsCollectable(Collectable collectable) {
    return collectables.contains(collectable);
  }
  
  // KILL
  public void clearMarkedForDeathCollectables() {
    if(markedForDeathCollectables.size() > 0) {
      for(Collectable collectable : markedForDeathCollectables) {
        collectables.remove(collectable);
      }
      markedForDeathCollectables  = new ArrayList<Collectable>();
    }
  }
}
