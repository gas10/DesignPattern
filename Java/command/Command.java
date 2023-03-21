package command;

public interface Command {
    public void execute();
}

interface CommandWithUndo extends Command {
    public void undo();
}


class NoCommand implements Command {
    public void execute() {

    } 
}