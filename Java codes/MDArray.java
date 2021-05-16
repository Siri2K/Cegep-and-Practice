public class MDArray {
    public static void main(String[] args){
        int [][] numbers = new int [7][4];

        for(int i =0; i<7;i++){
            for(int j =0; j<4;j++){
                numbers[i][j] = i*j;
            }
        }
        System.out.print(numbers[4][2]);
    }
}
