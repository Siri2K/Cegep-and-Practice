public class Array {
    public static void main (String[] args){
        int[] numbers = new int[5];
        
        for(int i=0;i<numbers.length;i++){
            numbers[i] = i*2;
            System.out.print(numbers[i]+"\n");
        }
    }
}
