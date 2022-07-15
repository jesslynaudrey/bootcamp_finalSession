package introduction;

import java.util.Scanner;

public class Main {

	public Main() {
		// TODO Auto-generated constructor stub
		Scanner scan = new Scanner(System.in);
		int choice;
		do {
			System.out.println("1. Start The Simulation!!");
			System.out.println("2. Close App");	
			System.out.print("Choice >> ");
			choice = scan.nextInt();
		} while(choice != 1 && choice != 2);
		
		int first, second;
		switch(choice) {
		case 1:
			do {
				System.out.print("Input the first number [1 - 100](inclusive): ");		
				first = scan.nextInt();
			}while(first < 1 || first > 100);
			do {
				System.out.print("Input the second number [1 - 100](inclusive): ");
				second = scan.nextInt(); scan.nextLine();
			}while(first < 1 || first > 100);
			System.out.println("+========================================================================================================================+");
			System.out.println("+  + (String type)  |  (Character Type)  |  * (Integer type)  |  / (Floating Type)  | input 1 == input 2 (Boolean Type)  +");
			System.out.println("+========================================================================================================================+");
//			System.out.printf("+      %d + %d      |       %7c  %7c       |          %d        |           %f        |            %b                      +\n", first, second, first, second, first*second, (float)first/second, first == second);
			System.out.printf ("+ %8d + %-7d | %7c  %-9c | %11d        | %12.3f         | %20b               +\n", first, second, first, second, first*second, (float)first/second, (first == second));
			System.out.println("+========================================================================================================================+");
			System.out.print("Press enter to proceed..");
			scan.nextLine();
			
			System.out.println("\n\n+==================================================+");
			System.out.println("+Data Type : Integer                               +");
			System.out.println("+==================================================+");
			System.out.println("+    +     |    -    |    *    |    /    |    %    +");
			System.out.println("+==================================================+");
			System.out.printf("+   %d     |    %d   |    %d   |    %d   |    %d   +\n", first+second, first-second, first*second, first/second, first%second);
			System.out.println("+==================================================+");
			System.out.print("Press enter to proceed..");
			scan.nextLine();

			boolean p1 = false, p2 = false;
            do {
                try {
                    System.out.print("Give me value for p1 [true | false]: ");
                    p1 = scan.nextBoolean();
                    break;
                } catch (Exception e) {
                    scan.nextLine();
                }
            } while(!p1);
            
			do {
				try {
					System.out.print("Give me value for p2 [true | false]: ");
					p2 = scan.nextBoolean();
					break;
				} catch (Exception e) {
					scan.nextLine();
				}			
			}while(!p2);
			
			String s1 = String.valueOf(p1).toUpperCase();
            String s2 = String.valueOf(p2).toUpperCase();
			
			System.out.println("+=============================================+");
			System.out.println("+Logical Table                                +");
			System.out.println("+=============================================+");
			System.out.printf("+ P1 = %c , P2 = %c                           +\n", s1.charAt(0), s2.charAt(0));
			System.out.println("+=============================================+");
			System.out.println("+    !P1    |    !P2    |    &&    |    ||    +");
			System.out.println("+=============================================+");
			System.out.printf("+    %b     |     %b    |     %b   |    %b    +\n", !p1, !p2, p1&&p2, p1||p2);
			System.out.println("+=============================================+");
			System.out.print("Press enter to proceed..");
			scan.nextLine();
			
			new Main();
			break;
			
		case 2:
			System.out.println("thank you for using the apps!!");
			break;
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Main();
	}

}
