class Scene {
  private String sceneName;
  private PImage backgroundImage;
  private ArrayList<GameObject> gameObjects;
  private ArrayList<PuzzleManager> puzzles;
  
  private ArrayList<GameObject> recentlyAddedGameObjects;
  private ArrayList<GameObject> markedForDeathGameObjects;

  private ArrayList<PuzzleManager> recentlyAddedPuzzles;
  private ArrayList<PuzzleManager> markedForDeathPuzzles;
  
  public Scene(String sceneName, String backgroundImageFile) {
    this.sceneName = sceneName;
    this.backgroundImage = loadImage(backgroundImageFile);
    gameObjects = new ArrayList<GameObject>();
    puzzles = new ArrayList<PuzzleManager>();
    markedForDeathGameObjects = new ArrayList<GameObject>();
    recentlyAddedGameObjects = new ArrayList<GameObject>();
    markedForDeathPuzzles = new ArrayList<PuzzleManager>();
    recentlyAddedPuzzles = new ArrayList<PuzzleManager>();
  }
  
  public void addGameObject(GameObject object) {
    recentlyAddedGameObjects.add(object);
  }
  
  public void removeGameObject(GameObject object) {
    markedForDeathGameObjects.add(object);
  }

  public void addPuzzle(PuzzleManager puzzle) {
    if(puzzle != null) {
      println("adding puzzle");
      recentlyAddedPuzzles.add(puzzle);
      println("added puzzle");
    } else {
      println("puzzle is null");
    }
  }
  
  public void removePuzzle(PuzzleManager puzzle) {
    markedForDeathPuzzles.add(puzzle);
  }
  
  public void updateScene() {
    if(markedForDeathGameObjects.size() > 0) {
      for(GameObject object : markedForDeathGameObjects) {
        gameObjects.remove(object);
      }
      markedForDeathGameObjects = new ArrayList<GameObject>();
    }
    if(markedForDeathPuzzles.size() > 0) {
      for(PuzzleManager puzzle : markedForDeathPuzzles) {
        puzzles.remove(puzzle);
      }
      markedForDeathPuzzles  = new ArrayList<PuzzleManager>();
    }

    if(recentlyAddedGameObjects.size() > 0) {
      for(GameObject object : recentlyAddedGameObjects) {
        gameObjects.add(object);
      }
      recentlyAddedGameObjects  = new ArrayList<GameObject>();
    }
    if(recentlyAddedPuzzles.size() > 0) {
      for(PuzzleManager puzzle : recentlyAddedPuzzles) {
        puzzles.add(puzzle);
      }
      recentlyAddedPuzzles  = new ArrayList<PuzzleManager>();
    }
  }
  
  public void draw(int wwidth, int wheight) {
    image(backgroundImage, 0, 0, wwidth, wheight);
    for(GameObject object : gameObjects) {
      object.draw();
    }
    if(puzzles != null) {
      for(PuzzleManager puzzle : puzzles) {
        puzzle.update();
      }
    }
  }
  
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
  
  public String getSceneName() {
    return this.sceneName;
  }
}
