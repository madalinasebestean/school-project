package User;

import java.sql.*;

/**
 * Created by msebestean on 19.05.2017.
 */
public class FlightRepository {

    public FlightRepository() {}

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

    public User viewFlight(int id){
        Flight user = new Flight();

        try {
            Connection con = this.getConnection();
            PreparedStatement x = con.prepareStatement("SELECT * FROM flights WHERE id = '" + id + "' ");
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

    public void createFlight(Flight flight){
        try {
            Connection con = this.getConnection();
            PreparedStatement posted = con.prepareStatement(
                "INSERT INTO flights (airplane_type, departure_city_id, departure_time, arrival_city_id, arrival_time) VALUES " +
                    "( '" + flight.getAirplaneType() + "', '" + flight.getDepartureCity() + "', '" + flight.getDepartureTime() +
                    "', '"f flight.getArrivalCity() + "', '" + flight.getArrivalTime() + "', '" + "');");
            posted.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateFlight(Flight flight){
        try {
            Connection con = this.getConnection();
            Statement stm = con.createStatement();
            String sql = "UPDATE flights SET" +
                    "airplane_type = '" + flight.getAirplaneType() + "' ," +
                    "departure_city_id = '" + flight.getDepartureCity() + "' " +
                    "departure_time = '" + flight.getDepartureTime() + "' " +
                    "arrival_city_id = '" + flight.getArrivalCity() + "' " +
                    "arrival_time = '" + flight.getArrivalTime() + "' " +
                    "WHERE id = '" + flight.getFlightNumber() + "'";
            stm.executeUpdate(sql);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteFlight(Flight flight){
        try {
            Connection con = this.getConnection();
            PreparedStatement del = con.prepareStatement("DELETE FROM flights WHERE id = '" + user.getFlightNumber() + "' ");
            del.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
