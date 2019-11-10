import java.io.File;
import java.util.Scanner;
import java.awt.Color; 

public class xHex2RgbDriver {
	
	public static void main(String[] args) {
		String id = args[0];
		String requirement = args[1];
		String driver = args[2];
		String component = args[3];
		String method = args[4];
		String input = args[5];
		String answer = args[6];

		try {		
			ColorConverter obj = new ColorConverter();

			Color col = obj.hex2Rgb(input);

			int red = col.getRed();
			int blue = col.getBlue();
			int green = col.getGreen();

			String output = "" + red + "," + green + "," + blue + "";
			System.out.println (id);
			System.out.println (requirement);
			System.out.println (driver);
			System.out.println (component);
			System.out.println (method);
			System.out.println (input);
			System.out.println (answer);
			System.out.println (output);
		}

		catch (Exception e){
			System.out.println (id);
			System.out.println (requirement);
			System.out.println (driver);
			System.out.println (component);
			System.out.println (method);
			System.out.println (input);
			System.out.println (answer);
			System.out.println ("ERROR");
		}
							
	}		
}

	
