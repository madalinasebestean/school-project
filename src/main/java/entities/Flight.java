package entities;

import javax.persistence.*;
import java.sql.Time;
import java.sql.Timestamp;

@Entity
@Table(name="Flights")
public class Flight {
    private int id;
    private int flightNumber;
    private String airplaneType;
    private City departureCity;
    private Timestamp departureTime;
    private City arrivalCity;
    private Timestamp arrivalTime;

    public Flight(int id) {
        this.id = id;
    }

    public Flight(int flightNumber, String airplaneType, City departureCity, Timestamp departureTime, City arrivalCity, Timestamp arrivalTime) {
        this.flightNumber = flightNumber;
        this.airplaneType = airplaneType;
        this.departureCity = departureCity;
        this.departureTime = departureTime;
        this.arrivalCity = arrivalCity;
        this.arrivalTime = arrivalTime;
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false, unique = true)
    public int getId() {
        return id;
    }

    @Column(name = "flight_number", nullable = false)
    public int getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(int flightNumber) {
        this.flightNumber = flightNumber;
    }

    @Column(name = "airplane_type", nullable = false)
    public String getAirplaneType() {
        return airplaneType;
    }

    public void setAirplaneType(String airplaneType) {
        this.airplaneType = airplaneType;
    }

    @ManyToOne
    @JoinColumn(name="departure_city_id", nullable=false)
    public City getDepartureCity() {
        return departureCity;
    }

    public void setDepartureCity(City departureCity) {
        this.departureCity = departureCity;
    }

    @Column(name = "departure_time", nullable = false)
    public Timestamp getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Timestamp departureTime) {
        this.departureTime = departureTime;
    }

    @ManyToOne
    @JoinColumn(name="arrival_city_id", nullable=false)
    public City getArrivalCity() {
        return arrivalCity;
    }

    public void setArrivalCity(City arrivalCity) {
        this.arrivalCity = arrivalCity;
    }

    @Column(name = "arrival_time", nullable = false)
    public Timestamp getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Timestamp arrivalTime) {
        this.arrivalTime = arrivalTime;
    }
}


