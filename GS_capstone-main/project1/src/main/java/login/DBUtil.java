package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String URL =
        "jdbc:mysql://capstone-db.cfw4cvqk4dks.ap-northeast-2.rds.amazonaws.com:3306/testdb?serverTimezone=Asia/Seoul&useSSL=false&allowPublicKeyRetrieval=true";

    private static final String USER = "admin";
    private static final String PASSWORD = "12341234";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL 드라이버 로드 실패", e);
        }

        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
