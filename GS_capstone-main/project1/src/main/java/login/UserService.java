package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserService {

    public static boolean isUsernameExists(String username) {
        String sql = "SELECT id FROM users WHERE username = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }

        } catch (Exception e) {
            throw new RuntimeException("isUsernameExists 오류", e);
        }
    }

    public static boolean registerUser(String name, String username, String password) {
        String sql = "INSERT INTO users (name, username, password_hash, salt) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection()) {
            String salt = PasswordUtil.generateSalt();
            String hashed = PasswordUtil.hashPassword(password, salt);

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, username);
                stmt.setString(3, hashed);
                stmt.setString(4, salt);

                return stmt.executeUpdate() > 0;
            }

        } catch (Exception e) {
            throw new RuntimeException("registerUser 오류", e);
        }
    }

    public static boolean loginUser(String username, String password) {
        String sql = "SELECT password_hash, salt FROM users WHERE username = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String hash = rs.getString("password_hash");
                    String salt = rs.getString("salt");
                    return PasswordUtil.verifyPassword(password, hash, salt);
                }
            }

            return false;

        } catch (Exception e) {
            throw new RuntimeException("loginUser 오류", e);
        }
    }
}

