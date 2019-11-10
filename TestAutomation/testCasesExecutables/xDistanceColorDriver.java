import java.awt.Color;
import java.text.*;

public class xDistanceColorDriver {
	public static void main (String[] args){
		String id = args[0];
		String requirement = args[1];
		String driver = args[2];
		String component = args[3];
		String method = args[4];
		String test = args[5];
		String answer = args[6];
		try{
			ContrastChecker obj = new ContrastChecker();
			//Preparing the test input for use
			String [] colors = test.split(" ");
			String [] rgbs1 = colors[0].split(",");
			String [] rgbs2 = colors[1].split(",");
			Color one = new Color(Integer.parseInt(rgbs1[0]),Integer.parseInt(rgbs1[1]),Integer.parseInt(rgbs1[2]));
			Color two = new Color(Integer.parseInt(rgbs2[0]),Integer.parseInt(rgbs2[1]),Integer.parseInt(rgbs2[2]));
			Double provided = obj.distanceColor(one,two);
		
			DecimalFormat df = new DecimalFormat("#.#");

			System.out.println (id);
			System.out.println (requirement);
			System.out.println (driver);
			System.out.println (component);
			System.out.println (method);
			System.out.println (test);
			System.out.println (answer); //expected answer
			System.out.println (df.format(provided)); //actual answer
		}

		catch(Exception e){
			System.out.println (id);
			System.out.println (requirement);
			System.out.println (driver);
			System.out.println (component);
			System.out.println (method);
			System.out.println (test);
			System.out.println (answer); //expected answer
			System.out.println ("ERROR"); //actual answer
		}
	}
}
