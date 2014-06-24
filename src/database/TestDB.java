package database;

import java.sql.SQLException;
import java.util.List;

public class TestDB {
    public static void main(String... args)  {
        Itinerary it = new Itinerary("b", "b", "b", 25);
        try {
            //DataManager.createItinerary(it);
            List<Itinerary> itineraries = DataManager.getItineraryByUserID(25);
            System.out.println(itineraries.size());
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}