package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by parashan on 7/22/2017.
 */
public interface SparepartDao {
    int add_sparepart(String model_no, String name, String brand, double price, int units, int vehicle_id, double tax) throws SQLException;

    ResultSet list_spareparts() throws SQLException;

    int add_sparePartsStocks(String user,String model, int n);

    int sell_spareParts(String user,String model, int n);
}
