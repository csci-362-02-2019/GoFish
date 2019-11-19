import java.awt.Color;

public class xRgb2HslDriver{
	public static void main (String[] args){
		String test = args[0];

		
		try{
			ColorConverter obj = new ColorConverter();
			
			//Preparing the test input for use
			String [] colors = test.split(",");
			Color one = new Color(Integer.parseInt(colors[0]),Integer.parseInt(colors[1]),Integer.parseInt(colors[2]));
			String provided = obj.rgb2Hsl(one);

			System.out.println (provided); //actual answer
		}

		catch(Exception E){
			System.out.println ("ERROR"); //actual answer
		}
	}
}
