class MultiPuzzleManager extends PuzzleManager {

    private int tally;

    public MultiPuzzleManager(LockedObject lock, PuzzleObject... elements) {
        super(lock, elements);
    }

    public void update() {

        //counts up if the player has solved all elements of a puzzle
        int tally = 0;
        if(elements != null) {
            for(PuzzleObject e : elements) {
                if(e != null) { // I'm aware it's excessive, but I had to deal with so many fucking NullPointerExceptions
                    if(e.correct) {
                        tally++;
                    } else {
                    }
                }
            }

            //dissables element interactivity, unlocks the lock, and deletes itself on puzzle completion
            if(tally == elements.length) {
                for(PuzzleObject e : elements) {
                    if(e != null) {
                        e.solved = true; 
                    }
                }
                lock.unlock();
                sceneManager.getCurrentScene().removePuzzle(this);
            }
        }
    }
}