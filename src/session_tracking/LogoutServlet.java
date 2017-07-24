package session_tracking;

import database.ConnectionFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by parashan on 7/21/2017.
 */
@WebServlet(name = "LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session1 = request.getSession(false);
        String user = session1.getAttribute("username").toString();
        Connection con = ConnectionFactory.getConnection();
        String sql = "insert into logs(username, time, description) values(?, ?, ?)";
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
        Date now = Calendar.getInstance().getTime();
        String reportDate = df.format(now);
        session1.invalidate();
        PreparedStatement st2 = null;
        try {
            st2 = con.prepareStatement(sql);
            st2.setString(1,user);
            st2.setString(2,reportDate);
            st2.setString(3,"Logout");
            st2.executeUpdate();
            response.sendRedirect("http://localhost:8080");

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
