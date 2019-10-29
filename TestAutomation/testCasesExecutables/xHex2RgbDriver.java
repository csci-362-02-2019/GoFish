import java.io.File;
import java.util.Scanner;
import java.awt.Color; 

public class xHex2RgbDriver {
	
	public static void main(String[] agrs) {
		try {
			boolean correct = false;		
			String input = agrs[0];
			String orcale = agrs[1];
				
			ColorConverter obj = new ColorConverter();

			Color output = obj.hex2Rgb(input);

			System.out.println(obj.hex2Rgb(output));
}
		catch (Exception e){
			System.out.println(e.getMessage());
		}
							
	}		
}

	
