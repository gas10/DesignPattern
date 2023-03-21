package prisoner;

import java.util.*;
import java.util.random.RandomGenerator;

public class PrisonerEscape {
    static int greaterThanFifty = 0;
    static int iteration = 100000;
    static int totalPrisonor = 100;
    static int[] sizeOfLoop = new int[totalPrisonor];
    public static void main(String args[]) {
        int moreThanHalfFoundIteration = 0;
        System.out.println("Welcome");
        for(int i = 0; i < iteration; i++) {
            System.out.println("Iteration... " + i);
            new PrisonerEscape().calculateProbability(totalPrisonor);
            if(greaterThanFifty > 0) {
                moreThanHalfFoundIteration++;
            }
            // printLoopCount();
        }
        printLoopCount();
        System.out.println("Total Greater than 50...found out of " + moreThanHalfFoundIteration +"("+ iteration +")");
        System.out.println("Probability=" + ((moreThanHalfFoundIteration * 100)/iteration));
    }

    static void printLoopCount() {
        for (int i = 0; i < sizeOfLoop.length; i++) {
            if(sizeOfLoop[i] != 0) {
                System.out.println("Loop of size " + (i + 1) +" found..." + sizeOfLoop[i]);
            }
        }
    }

    void calculateProbability(int noOfPrisoner) {
        int[] convicts = new int[noOfPrisoner];
        int[] prison = new int[noOfPrisoner];
        List<Integer> list = new ArrayList<>();
        int releaseCount = 0;

        for(int index= 0; index < noOfPrisoner; index++) {
            convicts[index] = index;
            list.add(index);
        }
        Collections.shuffle(list);
        for(int index= 0; index < noOfPrisoner; index++) {
            prison[index] = list.get(index);
        }
//        System.out.println(Arrays.toString(prison));
        geneateLoop(prison);
//        for(int convictNo: convicts) {
//            int count = 0;
//            int maxCount = noOfPrisoner/2;
//            int start = convictNo;
//            while(count < maxCount) {
//                if(convictNo == prison[convictNo]) {
//                    releaseCount++;
//                    break;
//                }
//            }
//        }
    }

    void geneateLoop(int[] prison) {
        int elementInLoop = 0;
        int start = 0;
        int loopCount = 1;
        int position = 0;
        Set<Integer> set = new HashSet<>();
        while(set.size() != prison.length) {
            elementInLoop = 1;
            start = getNext(prison, set);
            position = start;
            print("\nLoop "+ loopCount + "......");
            while(start != prison[position]) {
                set.add(position);
                print("\t" + position);
                position = prison[position];
                elementInLoop++;
            }
            print("\t" + prison[position]);
            set.add(position);
            if(elementInLoop > PrisonerEscape.totalPrisonor/2) {
                PrisonerEscape.greaterThanFifty++;
            }
            loopCount++;
            sizeOfLoop[elementInLoop - 1]++;
        }
        print("\nTotal Loops are:" + (loopCount - 1));
    }

    int getNext(int[] prison, Set<Integer> set) {
        for(int index = 0; index < prison.length; index++) {
            if(!set.contains(index))
                return index;
        }
        return -1;
    }

    void print(String str) {
//        System.out.println(str);
    }
}
