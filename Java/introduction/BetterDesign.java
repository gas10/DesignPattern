package introduction;

public class BetterDesign {

    public static void main(String[] args) {
        new BetterDesign().miniDuckSimulator();
    }

    void miniDuckSimulator() {
        // Mallard
        Duck mallard = new MallardDuck();
        mallard.performQuack();
        mallard.performFly();

        // Model
        Duck model = new ModelDuck();
        model.performQuack();
        model.performFly();
        // Change Fly behaviour
        model.setFlyBehaviour(new FlyRocketPowered());
        model.performFly();
    }
    // Fly Behaviour
    interface FlyBehaviour {
        void fly();
    }

    // Quack Behaviour
    interface QuackBehaviour {
        void quack();
    }

    class FlyWithWings implements FlyBehaviour {
        public void fly() {
            System.out.println("Fly Behaviour... With Wings");
        }
    }

    class FlyNoWay implements FlyBehaviour {
        public void fly() {
            System.out.println("Fly Behaviour... No Way");
        }
    }

    class FlyRocketPowered implements FlyBehaviour {
        @Override
        public void fly() {
            System.out.println("Fly Behaviour... Rocket Launch");
        }
    }

    class Quack implements QuackBehaviour {
        public void quack() {
            System.out.println("Quack Behaviour... Quack");
        }
    }

    class Squeak implements QuackBehaviour {
        public void quack() {
            System.out.println("Quack Behaviour... Squeak");
        }
    }

    class MuteQuack implements QuackBehaviour {
        public void quack() {
            System.out.println("Quack Behaviour... MuteQuack");
        }
    }

    abstract class Duck {
        FlyBehaviour flyBehaviour;
        QuackBehaviour quackBehaviour;

        void performQuack() {
            quackBehaviour.quack();
        }

        void performFly() {
            flyBehaviour.fly();
        }

        void swim() {
            System.out.println("Abstract Duck... swim");
        }

        void display() {
            System.out.println("Abstract Duck... display");
        }

        void setFlyBehaviour(FlyBehaviour fb) {
            this.flyBehaviour = fb;
        }

        void setQuackBehaviour(QuackBehaviour qb) {
            this.quackBehaviour = qb;
        }
    }

    class MallardDuck extends Duck {
        public MallardDuck() {
            quackBehaviour = new Quack();
            flyBehaviour = new FlyWithWings();
        }

        public void display() {
            System.out.println("MallardDuck... display");
        }
    }

    class ModelDuck extends Duck {
        public ModelDuck() {
            quackBehaviour = new Quack();
            flyBehaviour = new FlyNoWay();
        }

        public void display() {
            System.out.println("ModelDuck... display");
        }
    }
}