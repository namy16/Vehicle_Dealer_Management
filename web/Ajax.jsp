<%@ page import="java.sql.ResultSet" %>
<%@ page import="Dao.VehicleDaoImpl"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  VehicleDaoImpl obj1 = new VehicleDaoImpl();
    String modelno2 = request.getParameter("id1");
    ResultSet r1=obj1.list_vehicles();
    if(r1.next()) {
        String model=r1.getString("model_no");
        if(modelno2.equals(model)) {
            response.getWriter().write("false");
        }

    }
%>

