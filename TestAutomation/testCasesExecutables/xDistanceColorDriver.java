import java.awt.Color;
import java.text.*;

public class xDistanceColorDriver {
	public static void main (String[] args){
		String test = args[0];
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

			System.out.println (df.format(provided)); //actual answer
		}

		catch(Exception e){
			System.out.println ("ERROR"); //actual answer
		}
	}
}
