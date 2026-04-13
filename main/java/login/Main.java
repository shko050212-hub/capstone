package login;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("\n===== 메뉴 =====");
            System.out.println("1. 회원가입");
            System.out.println("2. 로그인");
            System.out.println("3. 종료");
            System.out.print("선택: ");

            int choice = sc.nextInt();
            sc.nextLine();

            if (choice == 1) {
                System.out.print("이름 입력: ");
                String name = sc.nextLine();

                System.out.print("아이디 입력: ");
                String username = sc.nextLine();

                System.out.print("비밀번호 입력: ");
                String password = sc.nextLine();

                boolean result = UserService.registerUser(name, username, password);

                if (result) {
                    System.out.println("회원가입 성공");
                } else {
                    System.out.println("회원가입 실패");
                }

            } else if (choice == 2) {
                System.out.print("아이디 입력: ");
                String username = sc.nextLine();

                System.out.print("비밀번호 입력: ");
                String password = sc.nextLine();

                boolean result = UserService.loginUser(username, password);

                if (result) {
                    System.out.println("로그인 성공");
                } else {
                    System.out.println("로그인 실패");
                }

            } else if (choice == 3) {
                System.out.println("프로그램 종료");
                break;
            } else {
                System.out.println("잘못된 입력입니다.");
            }
        }
        sc.close();
    }
}