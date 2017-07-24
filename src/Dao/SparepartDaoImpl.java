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
public class SparepartDaoImpl implements SparepartDao{
    Connection connection = ConnectionFactory.getConnection();


    public int add_sparepart(String model_no, String name, String brand, double price, int units, int vehicle_id, double tax) throws SQLException {

        PreparedStatement stmt = null;

        stmt = connection.prepareStatement("insert into spareparts(model_no, name, brand, price, units,vehicle_id, updated_at, tax) values(?,?,?,?,?,?,?,?)");
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        Calendar now = Calendar.getInstance();
        String time = df.format(now.getTime());
        stmt.setString(1, model_no);
        stmt.setString(2, name);
        stmt.setString(3, brand);
        stmt.setDouble(4, price);
        stmt.setInt(5, units);
        stmt.setInt(6, vehicle_id);
        stmt.setString(7, time);
        stmt.setDouble(8, tax);
        int cnt = stmt.executeUpdate();
        if (cnt > 0) {
            String sql = "insert into logs(username, time, description) values(?, ?, ?)";
            PreparedStatement st2 = connection.prepareStatement(sql);
            st2.setString(1,"admin");
            st2.setString(2,time);
            st2.setString(3,"added sparepart: "+name);
            st2.executeUpdate();

            return 1;
        } else {
            return -1;
        }

    }
    public int remove_sparepart(String model_no) throws SQLException, IOException, InterruptedException {

        String sql = "delete from spareparts where model_no = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1,model_no);
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        Calendar now = Calendar.getInstance();
        String time = df.format(now.getTime());
        int rows_affected = stmt.executeUpdate();


        if (rows_affected > 0) {
            String sql0 = "insert into logs(username, time, description) values(?, ?, ?)";
            PreparedStatement st2 = connection.prepareStatement(sql0);
            st2.setString(1,"admin");
            st2.setString(2,time);
            st2.setString(3,"removed sparepart having model number: "+model_no);
            st2.executeUpdate();

            return 1;
        } else {
            return -1;
        }

    }
    public ResultSet list_spareparts() throws SQLException {

        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("select * from spareparts");
        return rs;
    }

    public int add_sparePartsStocks(String user,String model, int n) {
        try {
            String isql = "select units from spareparts where model_no = ?";
            PreparedStatement stmt = connection.prepareStatement(isql);
            stmt.setString(1, model);
            ResultSet rs = stmt.executeQuery();

            int t = 0;
            if(rs.next()) {
                t=rs.getInt(1) +n;
            }
            String sql = "update spareparts set units=? where model_no = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, t);
            stmt.setString(2, model);
            int rows_affected = stmt.executeUpdate();
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            Calendar now = Calendar.getInstance();
            String time = df.format(now.getTime());

            if(rows_affected > 0) {
                String sql0 = "insert into logs(username, time, description) values(?, ?, ?)";
                PreparedStatement st2 = connection.prepareStatement(sql0);
                st2.setString(1,user);
                st2.setString(2,time);
                st2.setString(3,n+" Spareparts of Model no.: "+model+" added");
                st2.executeUpdate();

                return 1;
            }
        } catch (SQLException sqle) {
            System.err.println(sqle);
        }
        return -1;
    }

    public int sell_spareParts(String user,String model, int n) {
        try {
            String isql = "select units from spareparts where model_no = ?";
            PreparedStatement stmt = connection.prepareStatement(isql);
            stmt.setString(1, model);
            ResultSet rs = stmt.executeQuery();
            int t = 0;
            if(rs.next()) {
                t=rs.getInt(1) -n;
            }
            String sql = "update spareparts set units=? where model_no = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, t);
            stmt.setString(2, model);
            int rows_affected = stmt.executeUpdate();
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            Calendar now = Calendar.getInstance();
            String time = df.format(now.getTime());

            if(rows_affected > 0) {
                String sql0 = "insert into logs(username, time, description) values(?, ?, ?)";
                PreparedStatement st2 = connection.prepareStatement(sql0);
                st2.setString(1,user);
                st2.setString(2,time);
                st2.setString(3,n+" Spareparts of model no.: "+model+" selled");
                st2.executeUpdate();


                return 1;
            }
        } catch (SQLException sqle) {
            System.err.println(sqle);
        }
        return -1;
    }
}
