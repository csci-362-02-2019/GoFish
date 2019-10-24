import java.io.File;
import java.util.Scanner;
import java.awt.Color; 


public class xHex2RgbDriver {
	
	public static void main(String[] agrs) {
		try {
			boolean correct = false;		
			String input = agrs[0];
			String output;
			String oricle = agrs[1];

				
			ColorConverter obj = new ColorConverter();

			output = obj.hex2Rgb(input);
			System.out.println(output);
		}catch{
			System.out.println0("AAAAAAAAAAaaaAAAaaaaAAAAAAAAAAaaaaaaa");
		}
							
	}		
}

	
