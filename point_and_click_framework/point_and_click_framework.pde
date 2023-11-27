int wwidth = 1280;
int wheight = 720;
public PImage inventoryBackground;


final SceneManager sceneManager = new SceneManager();
final InventoryManager inventoryManager = new InventoryManager();

  //String inventoryBackground = "InventoryBar.png";
  //InventoryManager.setupBackground(inventoryBackground);


void settings()
{
  size(wwidth, wheight);
}

void setup() {
  //fullScreen();
  inventoryBackground = loadImage("InventorySlot.png");
  
  Collectable key01 = new Collectable("key", "Key.png", true);
  MoveToSceneObject openDoor = new MoveToSceneObject("goToScene02_scene01", 100, 200, 170, 300, "", "scene02");
  
  Scene scene01 = new Scene("scene01", "Background01.png");
  MultiCollectableObject keyObj = new MultiCollectableObject("key01_scene01", 495, 358, 100, 45, key01, 0, "arrowLeft.png");
  MultiCollectableObject keyObj2 = new MultiCollectableObject("key02_scene01", 395, 258, 100, 45, key01, 1);
  RequireObject door01 = new RequireObject("requiresKey_scene01", 100, 200, 170, 300, "Door.png", "Locked", key01, openDoor);
  RequireMultiObjectFilled slotFilled01 = new RequireMultiObjectFilled("requireMultiSlot01_filled", 100, 100, 50, 50, "arrowUp.png");
  RequireMultiObject slot01 = new RequireMultiObject("requireMultiSlot01", 100, 100, 50, 50, "arrowDown.png", key01, slotFilled01, 1);
  
  Scene scene02 = new Scene("scene02", "Background02.png");
  
  scene01.addGameObject(door01);
  scene01.addGameObject(keyObj);
  scene01.addGameObject(keyObj2);
  scene01.addGameObject(slot01);
  
  sceneManager.addScene(scene01);
  sceneManager.addScene(scene02);
  
  
  
/* 
  Collectable apple = new Collectable("apple", "back04_apple.png");
  MoveToSceneObject object7 = new MoveToSceneObject("goToScene04_scene01", 206, 461, 50, 50, "arrowUp.png", "scene04");
  
  Scene scene01 = new Scene("scene01", "back01.png");
  RequireObject loupe01 = new RequireObject("requiresApple_scene01", 206, 461, 50, 50, "zoom.png", "You need an Apple before getting here!", apple, object7);
  loupe01.setHoverImage("zoomIn.png");
  scene01.addGameObject(loupe01);
  TextObject loupe02 = new TextObject("smallText_scene01", 541, 445, 50, 50, "zoom.png", "This object has a text!");
  loupe02.setHoverImage("zoomIn.png");
  scene01.addGameObject(loupe02);
  TextObject loupe03 = new TextObject("largeText_scene01", 46, 687, 50, 50, "zoom.png", "This object has a way longer text. It shows that the windows can be of varied size according to the text.");
  loupe03.setHoverImage("zoomIn.png");
  scene01.addGameObject(loupe03);
  MoveToSceneObject object2 = new MoveToSceneObject("goToScene02_scene01", 708, 445, 50, 50, "arrowRight.png", "scene02");
  scene01.addGameObject(object2);
  MoveToSceneObject restaurantSceneMoveTo = new MoveToSceneObject("goToScene06_scene01", 388, 440, 50, 50, "arrowUp.png", "scene05");
  scene01.addGameObject(restaurantSceneMoveTo);
  
  Scene scene02 = new Scene("scene02", "back02.png");
  MoveToSceneObject object3 = new MoveToSceneObject("goBack_scene02", 350, 700, 50, 50, "arrowDown.png", true);
  scene02.addGameObject(object3);
  MoveToSceneObject object4 = new MoveToSceneObject("goToScene03_scene02", 441, 494, 50, 50, "arrowUp.png", "scene03");
  scene02.addGameObject(object4);
  
  Scene scene03 = new Scene("scene03", "back04.png");
  MoveToSceneObject object5 = new MoveToSceneObject("goBack_scene03", 203, 673, 50, 50, "arrowDown.png", true);
  scene03.addGameObject(object5);
  CollectableObject object6 = new CollectableObject("apple_scene03", 325, 366, 123, 101, apple);
  scene03.addGameObject(object6);
  
  Scene scene04 = new Scene("scene04", "back03.png");
  TextObject endGame = new TextObject("smallText_scene04", 430, 590, 50, 50, "medal1.png", "Congratulations. You finished the game!");
  scene04.addGameObject(endGame);
  
  Scene scene05 = new Scene("scene05", "back05.png");
  MoveToSceneObject object8 = new MoveToSceneObject("goBack_scene01", 203, 753, 50, 50, "arrowDown.png", true);
  scene05.addGameObject(object8);
  TextObject loupe04 = new TextObject("smallText_scene05", 120, 275, 50, 50, "zoom.png", "Have you checked the apples in that odd house to the right?");
  loupe04.setHoverImage("zoomIn.png");
  scene05.addGameObject(loupe04);
  TextObject loupe05 = new TextObject("smallText_2_scene05", 480, 285, 50, 50, "zoom.png", "Hello! How are you doing?");
  loupe05.setHoverImage("zoomIn.png");
  scene05.addGameObject(loupe05);
  
  sceneManager.addScene(scene01);
  sceneManager.addScene(scene02);
  sceneManager.addScene(scene03);
  sceneManager.addScene(scene04);
  sceneManager.addScene(scene05);*/
}

void draw()
{
  background(0);
  sceneManager.getCurrentScene().draw(wwidth, wheight);
  sceneManager.getCurrentScene().updateScene();
  inventoryManager.clearMarkedForDeathCollectables();
  inventoryManager.draw();
}

void mouseMoved() {
  sceneManager.getCurrentScene().mouseMoved();
  inventoryManager.mouseMoved();
}

void mouseClicked() {
  sceneManager.getCurrentScene().mouseClicked();
  //if(mouseY >= 620 && mouseY <= 715) {
  inventoryManager.mouseClicked();
  //}
}
