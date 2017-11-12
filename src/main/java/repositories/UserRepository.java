package User;

import java.sql.*;

/**
 * Created by msebestean on 19.05.2017.
 */
public class UserRepository {

    public UserRepository() {}

    public Connection getConnection() throws Exception {
        try {
            String driver = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/tema3?autoReconnect=true&useSSL=false";
            String username = "root";
            String password = "hbtd9xcb";
            Class.forName(driver);

            Connection conn = DriverManager.getConnection(url, username, password);

            return conn;
        } catch (Exception e) {
            System.out.println(e);
        }

        return null;
    }

    public User viewUser(String username){
        User user = new User();

        try {
            Connection con = this.getConnection();
            PreparedStatement x = con.prepareStatement("SELECT * FROM users WHERE username = '" + username + "' ");
            ResultSet result = x.executeQuery();
            while (result.next()) {
                user = new User(result.getString("user"), result.getString("password"),
                        result.getString("type"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return user;
    }

    public void createUser(User user){
        try {
            Connection con = this.getConnection();
            PreparedStatement posted = con.prepareStatement(
                "INSERT INTO flights (username, password, type) VALUES " +
                    "( '" + user.getUsername() + "', '" + user.getPassword() + "', '" + user.getType() + "', '" + "');");
            posted.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteUser(User user){
        try {
            Connection con = this.getConnection();
            PreparedStatement del = con.prepareStatement("DELETE FROM users WHERE id = '" + user.getId() + "' ");
            del.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
