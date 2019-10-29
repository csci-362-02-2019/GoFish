//import bin.com.csci362.gofish.ColorNameLookup;
import java.awt.Color;

public class xColorNameLookupDriver {
	public static void main (String[] args){
		try{
			//Retreiving passed data
			String id = args[0];
			String requirement = args[1];
			String driver = args[2];
			String component = args[3];
			String method = args[4];
			String test = args[5];
			String answer = args[6];
    			//Color oracle = (Color)Color.class.getField(answer.toUpperCase()).get(null);
			ColorNameLookup obj = new ColorNameLookup();
			String provided = obj.getColorNameFromStr(test);
			
			System.out.println (id);
			System.out.println (requirement);
			System.out.println (driver);
			System.out.println (component);
			System.out.println (method);
			System.out.println (test);
			System.out.println (answer); //expected answer
			System.out.println (provided); //actual answer
			//System.out.println (
		}
		catch (Exception e){
			System.out.println(e.getMessage());
		}				
	}
}
