//import bin.com.csci362.gofish.ColorNameLookup;
import java.awt.Color;

public class xGetColorNameFromStrDriver {
	public static void main (String[] args){
		//Retreiving passed data
		String test = args[0];

		try{
			ColorNameLookup obj = new ColorNameLookup();
			String provided = obj.getColorNameFromStr(test);
			
			System.out.println (provided); //actual answer
			
		}
		catch (Exception e){
			System.out.println ("ERROR"); //actual answer
		}				
	}
}
