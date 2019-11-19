import java.io.File;
import java.util.Scanner;
import java.awt.Color; 

public class colorFromRgbStrDriver {
	
	public static void main(String[] args) {
		String input = args[0];

		try {			
			ColorConverter obj = new ColorConverter();

			Color col = obj.colorFromRgbStr(input);

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

	
