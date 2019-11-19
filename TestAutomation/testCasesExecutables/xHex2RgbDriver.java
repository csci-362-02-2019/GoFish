import java.io.File;
import java.util.Scanner;
import java.awt.Color; 

public class xHex2RgbDriver {
	
	public static void main(String[] args) {
		String input = args[0];

		try {		
			ColorConverter obj = new ColorConverter();

			Color col = obj.hex2Rgb(input);

			int red = col.getRed();
			int blue = col.getBlue();
			int green = col.getGreen();

			String output = "" + red + "," + green + "," + blue + "";
			System.out.println (output);
		}

		catch (Exception e){
			System.out.println ("ERROR");
		}
							
	}		
}

	
