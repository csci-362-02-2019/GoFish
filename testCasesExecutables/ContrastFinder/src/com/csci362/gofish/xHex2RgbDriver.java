import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
//package com.csci362.gofish;

public class xHex2RgbDriver {
	
	public static void main(String[] agrs) throws FileNotFoundException{
		int num = 1;
		

		
		
		int lineNumber = 1;
		while (num < 6){
			File text = new File("../../../../../../testCases/testCase" + num +  ".txt");
			Scanner scnr = new Scanner(text);
			while(scnr.hasNextLine()){
				
				String line = scnr.nextLine();
		    		System.out.println("line " + lineNumber + " :" + line);
		    		lineNumber++;
				
			}
			num++;
			lineNumber = 1;
		}

	}

	
}
