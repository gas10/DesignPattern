package command;

public class RemoteControlWithUndo {
    Command[] onCommands;
    Command[] offCommands;
    Command undoCommand;

    public RemoteControlWithUndo() {
        onCommands = new Command[7];
        offCommands = new Command[7];

        Command noCommand = new NoCommand();
        for(int i = 0; i < 7; i++) {
            onCommands[i] = noCommand;
            offCommands[i] = noCommand;
        }
        undoCommand = noCommand;
    }

    public void setCommand(int slot, Command onCommand, Command offCommand) {
        onCommands[slot] = onCommand;
        offCommands[slot] = offCommand;
    }

    public void onButtonWasPushed(int slot) {
        if(onCommands[slot] != null ) {
            onCommands[slot].execute();
            undoCommand = onCommands[slot];
        }
    }

    public void offButtonWasPushed(int slot) {
        offCommands[slot].execute();
        undoCommand = offCommands[slot];
    }

    public void undoButtonWasPushed() {
        CommandWithUndo command = (CommandWithUndo) undoCommand;
        command.undo();
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append("----------Remote Control-----------");
        for(int i = 0; i < onCommands.length; i++) {
            sb.append("[Slot " + i +"]" + onCommands[i].getClass().getName() + "  "+ offCommands[i].getClass().getName() + "\n");
        }
        return sb.toString();
    }
}

