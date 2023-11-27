class PuzzleManager {

    public PuzzleObject[] elements;
    public LockedObject lock;

    public PuzzleManager(LockedObject lock, PuzzleObject... elements) {
        this.lock = lock;
        this.elements = elements;
    }

    public void update() {

    }
}