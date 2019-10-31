import java.awt.Color;

public class xRgb2HslDriver{
	public static void main (String[] args){
		String id = args[0];
		String requirement = args[1];
		String driver = args[2];
		String component = args[3];
		String method = args[4];
		String test = args[5];
		String answer = args[6];

		ColorConverter obj = new ColorConverter();
		//Preparing the test input for use
		String [] colors = test.split(",");
		Color one = new Color(Integer.parseInt(colors[0]),Integer.parseInt(colors[1]),Integer.parseInt(colors[2]));
		String provided = obj.rgb2Hsl(one);

		System.out.println (id);
		System.out.println (requirement);
		System.out.println (driver);
		System.out.println (component);
		System.out.println (method);
		System.out.println (test);
		System.out.println (answer); //expected answer
		System.out.println (provided); //actual answer
		
	}
}
