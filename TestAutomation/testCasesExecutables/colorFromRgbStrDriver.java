import java.io.File;
import java.util.Scanner;
import java.awt.Color; 

public class colorFromRgbStrDriver {
	
	public static void main(String[] args) {
		try {
			boolean correct = false;		
			String id = args[0];
			String requirement = args[1];
			String driver = args[2];
			String component = args[3];
			String method = args[4];
			String input = args[5];
			String answer = args[6];
				
			ColorConverter obj = new ColorConverter();

			Color output = obj.colorFromRgbStr(input);

			System.out.println (id);
			System.out.println (requirement);
			System.out.println (driver);
			System.out.println (component);
			System.out.println (method);
			System.out.println (input);
			System.out.println (answer);
			System.out.println(obj.colorFromRgbStr(output));
}
		catch (Exception e){
			System.out.println(e.getMessage());
		}
							
	}		
}

	