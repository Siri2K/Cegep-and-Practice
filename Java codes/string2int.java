import java.util.*;

public class string2int {
    
    public static void main(String[] args){
        // Declare Variables
        Scanner obj = new Scanner (System.in);
        String snum;
        int inum;

        // Declare and Input variables
        System.out.print("Input a string number : ");
        snum = obj.next();

        // Output result
        inum = Integer.valueOf(snum);

        // print result
        System.out.print(inum);
        
    }
}
