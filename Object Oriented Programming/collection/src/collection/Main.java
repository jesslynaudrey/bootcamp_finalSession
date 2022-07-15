package collection;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
	
	ArrayList<Share> shares = new ArrayList<>();
	
	public Main() {
		// TODO Auto-generated constructor stub
		Scanner scan = new Scanner(System.in);
		int choose;
		do {
			System.out.println("+========================+");
			System.out.println("+Options                 +");
			System.out.println("+========================+");
			System.out.println("+1. Start Sharing        +");
			System.out.println("+2. Update Participant   +");
			System.out.println("+3. Delete Participants  +");
			System.out.println("+4. Close App            +");
			System.out.println("+========================+");
			System.out.print("Choice >> ");
			choose = scan.nextInt();			
		} while(choose<1 || choose>4);
		
		switch(choose) {
		case 1:
			int num;
			
			do {
				System.out.print("Input a number [0 - 100]: ");	
				num = scan.nextInt();
			}while(num < 1 || num > 100);
			try
		    {
				num = scan.nextInt();
//		        Integer.parseInt(num);
		    } catch (NumberFormatException ex)
		    {
		    	System.out.println("Input must be numeric");
		    }
//			while(num < 1 || num > 100 || Integer.valueOf(num) = false) {
//				System.out.print("Input a number [0 - 100]: ");				
//				num = scan.nextInt();
//				
//			}
			
			break;
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Main();
	}

}
