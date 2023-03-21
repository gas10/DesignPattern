package introduction;
class NotAGoodDesign {
    class Duck {
        void quack() {
        }

        void swim() {
        }

        void display() {
            System.out.println("Duck... Display");
        }

        // Add new behaviour
        void fly() {
            System.out.println("Duck... Fly");
        }
    }

    class MallardDuck extends Duck {
        void display() {
            System.out.println("Mallard Duck... Display");
        }
    }

    class RedHeadDuck extends Duck {
        void display() {
            System.out.println("RedHeadDuck Duck... Display");
        }
    }

    class RubberDuck extends Duck {
        void quack() {
            System.out.println("RedHeadDuck Duck... Quack");
        }

        void display() {
            System.out.println("RedHeadDuck Duck... Display");
        }

        // Do Nothing Behaviour
        void fly() {
            System.out.println("RubberDuck Duck... No Fly");
        }
    }

    class DecoyDuck extends Duck {
        void quack() {
            System.out.println("DecoyDuck Duck... Quack");
        }

        void display() {
            System.out.println("DecoyDuck Duck... Display");
        }

        // Add Fly Behaviour
        void fly() {
            System.out.println("DecoyDuck Duck... Fly");
        }
    }
}
