package Dao;

import database.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

/**
 * Created by parashan on 7/18/2017.
 */
public class AdminDaoImpl implements  AdminDao {

    public int add_operator(String user_name,String password) throws SQLException {
        Connection con = ConnectionFactory.getConnection();
        //Statement st0 = con.createStatement();
        PreparedStatement st1 = con.prepareStatement("select * from users where username = ?");
        st1.setString(1,user_name);
        ResultSet res =st1.executeQuery();
        if(!res.next()) {
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            Date now = Calendar.getInstance().getTime();
            String reportDate = df.format(now);
            PreparedStatement st = con.prepareStatement("insert into users(username,password,privelege,updated_at) values(?,?,?,?)");
            st.setString(1,user_name);
            st.setString(2,password);
            st.setInt(3,1);
            st.setString(4,reportDate);

            int result=st.executeUpdate();
                    if(result > 1) {
                        String sql = "insert into logs(username, time, description) values(?, ?, ?)";
                        PreparedStatement st2 = con.prepareStatement(sql);
                        st2.setString(1,"admin");
                        st2.setString(2,reportDate);
                        st2.setString(3,"created operator: "+user_name);
                        st2.executeUpdate();
                    }
            return 1;
        } else {
            return -1;
        }
    }
    public int remove_operator(String user_name) throws SQLException {
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement st1 = con.prepareStatement("select * from users where username = ? and privelege = ?");
        st1.setString(1,user_name);
        st1.setInt(2,1);
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        Date now = Calendar.getInstance().getTime();
        String reportDate = df.format(now);


        ResultSet res =st1.executeQuery();
        if(res.next()) {
            PreparedStatement st = con.prepareStatement("delete from users where username = ?");
            st.setString(1,user_name);
            int result=st.executeUpdate();
            if(result > 1) {
                String sql = "insert into logs(username, time, description) values(?, ?, ?)";
                PreparedStatement st2 = con.prepareStatement(sql);
                st2.setString(1,"admin");
                st2.setString(2,reportDate);
                st2.setString(3,"removed Operator: "+user_name);
                st2.executeUpdate();

            }
           return 1;
        }
        else {
            return -1;
             }
    }
    public ResultSet viewoperators() throws SQLException {
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement st1 = con.prepareStatement("select * from users where privelege = ?");
        st1.setInt(1,1);
        return st1.executeQuery();
    }
    public ResultSet viewlogs() throws SQLException {
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement st1 = con.prepareStatement("select * from logs ");
        return st1.executeQuery();
    }
}
