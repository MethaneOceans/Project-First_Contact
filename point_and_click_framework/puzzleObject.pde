class PuzzleObject extends GameObject{
    private boolean solved = false;

    public PuzzleObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile) {
        super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    }

    public void mouseClicked() {

    }

    public void update() {
        
    }

    public void onSolve() {

    }

    public void unlock() {
        solved = true;
        onSolve();
    }
}