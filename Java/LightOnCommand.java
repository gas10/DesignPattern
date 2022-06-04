

class Light {
    String name;
    public Light(String name) {
        this.name = name;
    }

    public void on() {
        System.out.println("Turning -> " + name + " : ON");
    }

    public void off() {
        System.out.println("Turning -> " + name + " : Off");
    }
}

public class LightOnCommand implements CommandWithUndo {
    Light light;

    public LightOnCommand(Light light) {
        this.light = light;
    }

    public void execute() {
        light.on();
    }

    public void undo() {
        light.off();
    }

    public static void main(String args[]) {
        System.out.println("Test");
    }
}

class LightOffCommand implements CommandWithUndo {
    Light light;
    public LightOffCommand(Light light) {
        this.light = light;
    }

    public void execute() {
        light.off();
    }

    public void undo() {
        light.on();
    }
}

class CeilingFan {
    public static final int HIGH = 3;
    public static final int MEDIUM = 2;
    public static final int LOW = 1;
    public static final int OFF = 0;
    String location;
    int speed;

    public CeilingFan(String location) {
        this.location = location;
        speed = OFF;
    }

    public void high() {
        speed = HIGH;
    }

    public void medium() {
        speed = MEDIUM;
    }

    public void low() {
        speed = LOW;
    }

    public void off() {
        speed = OFF;
    }

    public int getSpeed() {
        return speed;
    }
}

class CeilingFanOnCommand implements Command {
    CeilingFan ceilingFan;
    public CeilingFanOnCommand(CeilingFan ceilingFan) {
        this.ceilingFan = ceilingFan;
    }

    public void execute() {
        
    }
}

class CeilingFanOffCommand implements Command {
    CeilingFan ceilingFan;
    public CeilingFanOffCommand(CeilingFan ceilingFan) {
        this.ceilingFan = ceilingFan;
    }

    public void execute() {
        
    }
}

class CeilingFanHighCommand implements CommandWithUndo {
    CeilingFan ceilingFan;
    int prevSpeed;
    public CeilingFanHighCommand(CeilingFan ceilingFan) {
        this.ceilingFan = ceilingFan;
    }

    public void execute() {
        prevSpeed = ceilingFan.getSpeed();
        ceilingFan.high();
    }

    public void undo() {
        if(prevSpeed == CeilingFan.HIGH) 
            ceilingFan.high();
        else if(prevSpeed == CeilingFan.MEDIUM)
            ceilingFan.medium();
        else if(prevSpeed == CeilingFan.LOW)
            ceilingFan.low();
        else if(prevSpeed == CeilingFan.OFF) 
            ceilingFan.off();
    }
}

class GarageDoor {
    String name;
    public GarageDoor(String name) {
        this.name = name;
    }
}

class GarageDoorUpCommand implements Command {
    GarageDoor door;
    public GarageDoorUpCommand(GarageDoor door) {
        this.door = door;
    }

    public void execute() {
        
    }
}

class GarageDoorDownCommand implements Command {
    GarageDoor door;
    public GarageDoorDownCommand(GarageDoor door) {
        this.door = door;
    }

    public void execute() {
        
    }
    
}

class Stereo {
    String name;
    public Stereo(String name) {
        this.name = name;
    }

    void on() {

    }

    void setCD() {

    }

    void setVolume(int value) {

    }
}

class StereoOffCommand implements Command {
    Stereo stereo;
    public StereoOffCommand(Stereo stereo) {
        this.stereo = stereo;
    }

    public void execute() {
        
    }
}

class StereoOnWithCDCommand implements Command {
    Stereo stereo;
    public StereoOnWithCDCommand(Stereo stereo) {
        this.stereo = stereo;
    }

    public void execute() {
        stereo.on();
        stereo.setCD();
        stereo.setVolume(11);
    }
}

