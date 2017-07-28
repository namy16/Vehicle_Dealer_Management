package Dao;

import database.ConnectionFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import util.VehicleService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Created by parashan on 7/18/2017.
 */
public class UserDaoImpl {
    Connection connection = ConnectionFactory.getConnection();
    private static String username;
    static SessionFactory factory;



    public int isValid(String username, String pswd) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("select privelege from users where username = ? and password = ?");
        stmt.setString(1, username);
        stmt.setString(2, pswd);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            UserDaoImpl.username = username;
            int pvlg = rs.getInt(1);
            String sql = "insert into logs(username, time, description) values(?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Calendar cal = Calendar.getInstance();
            String dd = dateFormat.format(cal.getTime());

            st.setString(1, username);
            st.setString(2, dd);
            st.setString(3, "login");

            st.executeUpdate();

            return pvlg;
        } else {
            return -1;
        }
    }
    public int vehicle_service(String model_no,String owner_name,int service_id,int reading,String service_type){

        Configuration configuration = new Configuration();
        configuration.configure();

        factory = configuration.buildSessionFactory();
        Session session = factory.openSession();
        Transaction tx = null;
        Integer employeeID = null;
        try{
            tx = session.beginTransaction();
            VehicleService v = new VehicleService(model_no,owner_name,service_id,reading,service_type);
            employeeID = (Integer) session.save(v);
            tx.commit();
        }catch (HibernateException e) {
            if (tx!=null) tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
        return 1;
    }
}

