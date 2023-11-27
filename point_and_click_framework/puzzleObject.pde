class PuzzleObject extends GameObject{
    private boolean solved = false;
    private boolean correct = false;

    public PuzzleObject(String identifier, int x, int y, int owidth, int oheight, String gameObjectImageFile) {
        super(identifier, x, y, owidth, oheight, gameObjectImageFile);
    }

    public PuzzleObject(String identifier, int x, int y, int owidth, int oheight) {
        super(identifier, x, y, owidth, oheight);
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
