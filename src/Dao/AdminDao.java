package Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by parashan on 7/22/2017.
 */
public interface AdminDao {
    int add_operator(String user_name,String password) throws SQLException;

    int remove_operator(String user_name) throws SQLException;

    ResultSet viewoperators() throws SQLException;

    ResultSet viewlogs() throws SQLException;
}
