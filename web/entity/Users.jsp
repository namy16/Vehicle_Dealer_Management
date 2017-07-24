<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="obj" class="Dao.VehicleDaoImpl"/>
<jsp:useBean id="obj1" class="Dao.SparepartDaoImpl"/>
<%--
  Created by IntelliJ IDEA.
  UserDao: parashan
  Date: 7/18/2017
  Time: 12:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css" >
    <link rel="stylesheet" href=" https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
</head>
<body>

<nav class="w3-bar w3-black">
    <div class="w3-button w3-bar-item"><a href="../index.html"><input class="w3-button" type="button" value="Home" ></a>
    </div>
</nav>
<section class="w3-container w3-center w3-content" style="max-width:600px;">
    <h1 class="w3-wide">Welcome User</h1>
</section><br>
<div class = "row"  id="oviewvehicles">
    <%
        ResultSet rs= obj.list_vehicles();
    %>
    <div class="container-fluid">
        &nbsp;&nbsp;<table class ="table table-hover table-bordered text-centered" style="border: 2px solid black" ><h3 class="w3-center">Vehicles</h3>
        <tr class="success"><th>Vehicle ID</th><th>Vehicle Name</th><th>Model Number</th><th>Brand Name</th><th>Cost</th></tr>
        <% try {
            while(rs.next()) {
        %>
        <tr class="danger"><td><%out.println(rs.getInt("id"));%></td><td><%out.println(rs.getString("name"));%></td><td><%out.println(rs.getString("model_no"));%>
        </td><td><%out.println(rs.getString("brand"));%></td><td><%out.println(rs.getDouble("price"));%></td></tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>

    </div>

</div>
<div class = "row"  id="viewspareparts">
    <%
        ResultSet rs1= obj1.list_spareparts();
    %>
    <div class="container-fluid">
        &nbsp;&nbsp;<table class ="table table-hover table-bordered text-centered" style="border: 2px solid black;"><h3 class="w3-center">Spareparts</h3>
        <tr class="success"><th>Sparepart Id</th><th>Sparepart Name</th><th>Model Number</th><th>Brand Name</th><th>Cost</th></tr>
        <% try {
            while(rs1.next()) {
        %>
        <tr class="danger"><td><%out.println(rs1.getInt("id"));%></td><td><%out.println(rs1.getString("name"));%></td><td><%out.println(rs1.getString("model_no"));%>
        </td><td><%out.println(rs1.getString("brand"));%></td><td><%out.println(rs1.getDouble("price"));%></td></tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>

    </div>

</div>


<footer class="w3-container w3-padding-64 w3-center w3-black w3-xlarge">
</footer>

<script type="text/javascript" language="JavaScript" src="../js/final.js" ></script>
</body>
</html>
