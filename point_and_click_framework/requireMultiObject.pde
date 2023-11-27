class RequireMultiObject extends PuzzleObject{
    private int requiredIndex;
    private Collectable collectable;
    private RequireMultiObjectFilled replaceWith;

    public RequireMultiObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile, 
                        Collectable collectable, RequireMultiObjectFilled replaceWith, int pRequiredIndex) {
        super(identifier, x, y, owidth, oheight, gameObjectImageFile);
        this.collectable = collectable;
        this.replaceWith = replaceWith;
        this.replaceWith.requiredIndex = pRequiredIndex;
        this.replaceWith.emptyRequire = this;
    }

    @Override
    public void mouseClicked() {
        if(mouseIsHovering && inventoryManager.currentSelectionEquals(collectable)) {
            this.replaceWith.slottedItem = inventoryManager.currentSelection;
            inventoryManager.removeCollectable(collectable);
            this.replaceWith.update();
            sceneManager.getCurrentScene().removeGameObject(this);
            sceneManager.getCurrentScene().addGameObject(replaceWith);
        } else {
            super.mouseClicked();
        }
    } 
} 
