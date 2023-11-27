class RequireMultiObjectFilled extends PuzzleObject{
    public int requiredIndex;
    public GameObject emptyRequire;
    public InventoryObject slottedItem;

    public RequireMultiObjectFilled(String identifier, int x, int y, int owidth, int oheight, 
                        String gameObjectImageFile) {
        super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    }

    public void update() {
        if(super.solved != true && slottedItem != null && slottedItem.hasImage) {
            setAltImage(slottedItem.image);
            if(slottedItem.multiIndex == requiredIndex) {
                println("unlocked");
                super.correct = true;
            }

        }
    }

    public boolean isSolved() {
        return super.solved;
    }

    @Override
    public void mouseClicked() {
        if(mouseIsHovering && super.solved != true) {
            inventoryManager.addCollectable(slottedItem);
            slottedItem = null;
            super.correct = false;
            //this.update();
            sceneManager.getCurrentScene().removeGameObject(this);
            sceneManager.getCurrentScene().addGameObject(emptyRequire);
        } else {
            /*println("slotted index: " + slottedItem.multiIndex);
            println("required index: " + requiredIndex);
            if(slottedItem.multiIndex == requiredIndex) {
                println("unlocked");
            }*/
            super.mouseClicked();
        }
    } 
}
