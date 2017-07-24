package Dao;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by parashan on 7/22/2017.
 */
public interface VehicleDao {
    public int add_vehicle(String model_no, String name, String brand, double price, int units, double tax, double profit) throws SQLException;

    public int remove_vehicle(String model_no) throws SQLException, IOException, InterruptedException;

    public ResultSet list_vehicles() throws SQLException;

    public int add_vehicle_stock(String user,String model_no, int n);

    public int sell_vehicle_stock(String user,String model_no,int n);
}
