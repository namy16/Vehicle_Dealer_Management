package Dao;

import database.ConnectionFactory;

import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Created by parashan on 7/19/2017.
 */
public class VehicleDaoImpl implements VehicleDao {
    Connection connection = ConnectionFactory.getConnection();


    public int add_vehicle(String model_no, String name, String brand, double price, int units, double tax, double profit) throws SQLException {

            PreparedStatement stmt = null;
            String sql;
            stmt = connection.prepareStatement("insert into vehicles(model_no, name, brand, price, units, updated_at, tax, profit) values(?,?,?,?,?,?,?,?)");
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            Calendar now = Calendar.getInstance();
            String time = df.format(now.getTime());
            stmt.setString(1, model_no);
            stmt.setString(2, name);
            stmt.setString(3, brand);
            stmt.setDouble(4, price);
            stmt.setInt(5, units);
            stmt.setString(6, time);
            stmt.setDouble(7, tax);
            stmt.setDouble(8, profit);
            int cnt = stmt.executeUpdate();
            if (cnt > 0) {
                String sql0 = "insert into logs(username, time, description) values(?, ?, ?)";
                PreparedStatement st2 = connection.prepareStatement(sql0);
                st2.setString(1,"admin");
                st2.setString(2,time);
                st2.setString(3," Vehicle added: "+name);
                st2.executeUpdate();

                return 1;
            } else {
                return -1;
            }

        }
    public int remove_vehicle(String model_no) throws SQLException, IOException, InterruptedException {

        String sql = "delete from vehicles where model_no = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1,model_no);
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        Calendar now = Calendar.getInstance();
        String time = df.format(now.getTime());
        int rows_affected = stmt.executeUpdate();
        if (rows_affected > 0) {
            String sql0 = "insert into logs(username, time, description) values(?, ?, ?)";
            PreparedStatement st2 = connection.prepareStatement(sql0);
            st2.setString(1,"added");
            st2.setString(2,time);
            st2.setString(3," Vehcile deleted having model no: "+model_no);
            st2.executeUpdate();

            return 1;
        } else {
            return -1;
        }

    }
    public ResultSet list_vehicles() throws SQLException {

        Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("select * from vehicles");
        return rs;
    }
    public int add_vehicle_stock(String user,String model_no, int n){
        try {
            String isql = "select units from vehicles where model_no = ?";
            PreparedStatement stmt = connection.prepareStatement(isql);
            stmt.setString(1, model_no);
            ResultSet rs = stmt.executeQuery();
            int t = 0;
            if(rs.next()) {
                t=rs.getInt(1) +n;
            }
            String sql = "update vehicles set units=? where model_no = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, t);
            stmt.setString(2, model_no);
            int rows_affected = stmt.executeUpdate();

            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            Calendar now = Calendar.getInstance();
            String time = df.format(now.getTime());
            if(rows_affected > 0) {

                String sql0 = "insert into logs(username, time, description) values(?, ?, ?)";
                PreparedStatement st2 = connection.prepareStatement(sql0);
                st2.setString(1,user);
                st2.setString(2,time);
                st2.setString(3,n+" Vehicles of model no. "+model_no+" added");
                st2.executeUpdate();

                return 1;
            }

        } catch (SQLException sqle) {
            System.err.println(sqle);
        }
        return -1;
    }
    public int sell_vehicle_stock(String user,String model_no,int n){
        try {
            String isql = "select units from vehicles where model_no = ?";
            PreparedStatement stmt = connection.prepareStatement(isql);
            stmt.setString(1, model_no);
            ResultSet rs = stmt.executeQuery();
            int t = 0;
            if(rs.next()) {
                t=rs.getInt(1) -n;
            }
            String sql = "update vehicles set units=? where model_no = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, t);
            stmt.setString(2, model_no);
            int rows_affected = stmt.executeUpdate();
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            Calendar now = Calendar.getInstance();
            String time = df.format(now.getTime());
            if(rows_affected > 0) {
                String sql0 = "insert into logs(username, time, description) values(?, ?, ?)";
                PreparedStatement st2 = connection.prepareStatement(sql0);
                st2.setString(1,user);
                st2.setString(2,time);
                st2.setString(3,n+" Vehicles of modelno: "+model_no+" selled");
                st2.executeUpdate();


                return 1;
            }
        } catch (SQLException sqle) {
            System.err.println(sqle);
        }
        return -1;
    }
}