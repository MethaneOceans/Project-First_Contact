class Scene {
  // Properties
  private String sceneName;
  private PImage backgroundImage;
  private ArrayList<GameObject> gameObjects;
  private ArrayList<PuzzleObject> puzzleObjects;
  
  
  private ArrayList<GameObject> recentlyAddedGameObjects;
  private ArrayList<GameObject> markedForDeathGameObjects;
  
  // Constructor
  public Scene(String sceneName, String backgroundImageFile) {
    this.sceneName = sceneName;
    this.backgroundImage = loadImage(backgroundImageFile);
    gameObjects = new ArrayList<GameObject>();
    markedForDeathGameObjects = new ArrayList<GameObject>();
    recentlyAddedGameObjects = new ArrayList<GameObject>();
  }
  
  // Manage game objects associated with the scene
  public void addGameObject(GameObject object) {
    recentlyAddedGameObjects.add(object);
  }
  
  public void removeGameObject(GameObject object) {
    markedForDeathGameObjects.add(object);
  }
  
  public void updateScene() {
    if(markedForDeathGameObjects.size() > 0) {
      for(GameObject object : markedForDeathGameObjects) {
        gameObjects.remove(object);
      }
      markedForDeathGameObjects  = new ArrayList<GameObject>();
    }
    if(recentlyAddedGameObjects.size() > 0) {
      for(GameObject object : recentlyAddedGameObjects) {
        gameObjects.add(object);
      }
      recentlyAddedGameObjects  = new ArrayList<GameObject>();
    }
  }
  
  // Draw
  public void draw(int wwidth, int wheight) {
    image(backgroundImage, 0, 0, wwidth, wheight);
    for (GameObject object : gameObjects) {
      object.draw();
    }
    for (PuzzleObject object : puzzleObjects) {
      object.draw();
    }
  }
  
  // Input management
  public void mouseMoved() {
    for(GameObject object : gameObjects) {
      object.mouseMoved();
    }
  }
  
  public void mouseClicked() {
    for(GameObject object : gameObjects) {
      object.mouseClicked();
    }
  }
  
  // Get name property
  public String getSceneName() {
    return this.sceneName;
  }
}
