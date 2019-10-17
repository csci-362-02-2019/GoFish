import bin.com.csci362.gofish.*;
import java.awt.Color;
import junit.framework.TestCase;
import org.junit.Test;  // Junit 4 anotation @Test

public class xColorNameLookupDriver {
	public static void main (String[] args){
		Color Yellow = new Color(0xFF, 0xFF, 0x00);
		ColorNameLookup obj = new ColorNameLookup();
		Color provided = obj.getColorFromName("YeLLow");
		System.out.println("Test: Was YeLLow found? " + provided.equals(Yellow));
	}
}
