//import bin.com.csci362.gofish.ColorNameLookup;
import java.awt.Color;

public class xColorNameLookupDriver {
	public static void main (String[] args){
		try{
			//Retreiving passed data
			String test = args[0];
			String answer = args[1];
    			Color oracle = (Color)Color.class.getField(answer.toUpperCase()).get(null);
			ColorNameLookup obj = new ColorNameLookup();
			Color provided = obj.getColorFromName(test);
			System.out.println ("" + provided.equals(oracle) + "");

		}
		
		catch (Exception e){
			System.out.println(e.getMessage());
		}				
	}
}
