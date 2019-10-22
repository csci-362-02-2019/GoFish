import java.io.File; 
import java.util.Scanner; 
public class runAllTests{
	public static void main(String args[]){
		try{
			//Getting the amount of test cases
			System.out.println("How many test cases to execute? ");
			Scanner in = new Scanner(System.in);
			int j = in.nextInt();
			//Iniciallizing Varibles for manipulating Tests array
			int k = 0;
			int l = 0;
			//Array for holding all test case info
			String [][] Tests = new String[j][8]; 
			//Running a loop to grab info from all test cases
			for (int i = 1; i <= j; ++i){
				File file = new File("/home/lexus/GoFish/testCases/testCase" + i + ".txt"); 
    				Scanner sc = new Scanner(file);
				k = 0;
				//Inserting info into test cases array
    				while (sc.hasNextLine()){
      					Tests[l][k] = sc.nextLine();
					k += 1;
  				}
				l += 1;
			}
		}
		catch (Exception e){
			System.out.println(e.getMessage());
		}	
	}
}
