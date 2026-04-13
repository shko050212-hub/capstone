package login;

import java.sql.Connection;

public class DBTest {
    public static void main(String[] args) {
        try {
            Connection conn = DBUtil.getConnection();

            if (conn != null) {
                System.out.println("DB 연결 성공!");
                conn.close();
            } else {
                System.out.println("DB 연결 실패");
            }

        } catch (Exception e) {
            System.out.println("에러 발생!");
            e.printStackTrace();
        }
    }
}