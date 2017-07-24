<%@ page import="java.sql.ResultSet" %>
<%@ page import="session_tracking.ActiveUsers" %>
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
    <link rel="stylesheet" href="/css/style.css" >
    <link rel="stylesheet" href=" https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <script type="text/javascript">
        function odisplayrow() {
            document.getElementById("view2").style.display="block";
            document.getElementById("addvehiclestock").style.display="none";
            document.getElementById("main2").style.display="none";
            document.getElementById("addsparepartstock").style.display="none";
            document.getElementById("sellvehicle").style.display="none";
            document.getElementById("sellsparepart").style.display="none";
            document.getElementById("operations2").style.display="none";
            document.getElementById("oviewvehicles").style.display="none";
            document.getElementById("oviewspareparts").style.display="none";

        }
        function ohomerow() {
            document.getElementById("oviewvehicles").style.display="none";
            document.getElementById("oviewspareparts").style.display="none";
            document.getElementById("view2").style.display="none";
            document.getElementById("addvehiclestock").style.display="block";
            document.getElementById("addsparepartstock").style.display="none";
            document.getElementById("sellvehicle").style.display="none";
            document.getElementById("sellsparepart").style.display="none";
            document.getElementById("main2").style.display="none";
            document.getElementById("operations2").style.display="block";

        }
        function oviewvehicles() {

            document.getElementById("view2").style.display="block";
            document.getElementById("main2").style.display="none";
            document.getElementById("operations2").style.display="none";
            document.getElementById("sellsparepart").style.display="none";
            document.getElementById("addvehiclestock").style.display="none";
            document.getElementById("addsparepartstock").style.display="none";
            document.getElementById("sellvehicle").style.display="none";
            document.getElementById("oviewspareparts").style.display="none";
            document.getElementById("main2").innerHTML = document.getElementById("oviewvehicles").innerHTML;
            document.getElementById("oviewvehicles").style.display="block";
            console.log("biibibibib");
        }
        function oviewspareparts() {

            document.getElementById("view2").style.display="block";
            document.getElementById("main2").style.display="none";
            document.getElementById("operations2").style.display="none";
            document.getElementById("sellsparepart").style.display="none";
            document.getElementById("addvehiclestock").style.display="none";
            document.getElementById("addsparepartstock").style.display="none";
            document.getElementById("sellvehicle").style.display="none";
            document.getElementById("oviewvehicles").style.display="none";
            document.getElementById("main2").innerHTML = document.getElementById("oviewspareparts").innerHTML;
            document.getElementById("oviewspareparts").style.display="block";
            console.log("hihihihih");
        }
    </script>
</head>
<body>
<%

    HttpSession session2 = request.getSession(false);
    if(session2.getAttribute("username")!=null)
    {
%>
<nav class="w3-bar w3-black">
    <div class="w3-button w3-bar-item"><a href="/logout"><input class="w3-button" style="font-weight: bold" type="button" value="Logout"  ></a>
    </div>
    <div class="w3-button w3-bar-item"><input class="w3-button" style="font-weight: bold" type="button" value="Display" onclick="odisplayrow();">
    </div>
    <div class="w3-button w3-bar-item"><input class="w3-button" style="font-weight: bold" type="button" value="Home" onclick="ohomerow();">
    </div>
    <div class="w3-button w3-bar-item" style="float: left"><input class="w3-button" style="font-weight: bold" type="button" value="Active Users:<%out.println(ActiveUsers.getActiveSessions());%>">
    </div>
</nav>
<section class="w3-container w3-center w3-content" style="max-width:600px;">
    <h1 class="w3-wide">Welcome Operator</h1>
</section><br>
<div class="row" style="background: #044404;color: white" id="operations2">
    <div class="col-md-3  w3-button" ><h3><input type="button" class="w3-button" value="Add Vehicle Stock" onclick="addvehiclestock();"></h3></div>
    <div class="col-md-3 w3-button" ><h3><input type="button" class="w3-button" value="Sell Vehicle" onclick="sellvehicle();"></h3></div>
    <div class="col-md-3 w3-button" ><h3><input type="button" class="w3-button" value="Add Sparepart Stock" onclick="addsparepartstock();"></h3></div>
    <div class="col-md-3 w3-button"><h3><input type="button" class="w3-button" value="Sell Sparepart" onclick="sellsparepart();"></h3></div>
</div>
<div class="row" style="background: #044404;color: white;display: none" id="view2" >
    <div class="col-md-6  w3-button" ><h3><input type="button" class="w3-button" value="View Vehicles"  onclick="oviewvehicles();"></h3></div>
    <div class="col-md-6 w3-button" ><h3><input type="button" class="w3-button" value="View Spareparts" onclick="oviewspareparts();"></h3></div>
</div>
<div class = "row w3-center" id="main2"  >
</div>
</div>
<div class = "row" id="addvehiclestock" >
    <div class="login-page" >
        <div class="form" >
            <form class="login-form" action="/Operations.jsp">
                <p class="message"><h4>Add Vehicle Stock</h4></p>
                <input type="text" placeholder="Enter Vehicle model number" name="vmodelno" required/>
                <input type="text" placeholder="Enter number of units to be addded" name="vunits" required/>
                <button>ADD</button>
            </form>
        </div>
    </div>
</div>
<div class = "row" style="display: none" id="sellvehicle">
    <div class="login-page" >
        <div class="form" >
            <h4>Sell Vehicle</h4>
            <form class="login-form" action="/Operations.jsp">
                <input type="text" placeholder="Enter Vehicle model number !" name="svmodelno" required/>
                <input type="text" placeholder="Enter no. of units to be sold!" name="svunits" required/>
                <button>SELL</button>
            </form>
        </div>
    </div>
</div>
<div class = "row" style="display: none" id="addsparepartstock">
    <div class="login-page" >
        <div class="form" >
            <h4>Add Sparepart Stock</h4>
            <form class="login-form" action="/Operations.jsp">
                <input type="text" placeholder="Enter Sparepart model number" name="sparemodelno" required/>
                <input type="text" placeholder="Enter no. of units to be added" name="spareunits" required/>
                <button>ADD</button>
            </form>
        </div>
    </div>
</div>
<div class = "row" style="display: none" id="sellsparepart">
    <div class="login-page" >
        <div class="form" >
            <h4>Sell Sparepart</h4>
            <form class="login-form" action="/Operations.jsp">
                <input type="text" placeholder="Enter Model Number Of Sparepart" name="ssmodelno" required/>
                <input type="text" placeholder="Enter No. of units to be sold" name="ssunits" required/>
                <button>SELL</button>
            </form>
        </div>
    </div>
</div>

<div class = "row" style="display: none" id="oviewvehicles">
    <%
        ResultSet rs= obj.list_vehicles();
    %>
    <div class="container-fluid">
        &nbsp;&nbsp;<table class ="table table-hover table-bordered text-centered" style="margin: auto;width: 90% !important; border: 2px solid black "><h3 class="w3-center">Vehicles</h3>
        <tr class="success"><th>Vehicle ID</th><th>Vehicle Name</th><th>Model Number</th><th>Brand Name</th><th>Cost</th><th>Units</th><th>Added On:</th></tr>
        <% try {
            while(rs.next()) {
        %>
        <tr class="danger"><td><%out.println(rs.getInt("id"));%></td><td><%out.println(rs.getString("name"));%></td><td><%out.println(rs.getString("model_no"));%>
        </td><td><%out.println(rs.getString("brand"));%></td><td><%out.println(rs.getDouble("price"));%></td><td><%out.println(rs.getInt("units"));%>
        </td></td><td><%out.println(rs.getString("updated_at"));%></td></tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>

    </div>

</div>
<div class = "row" style="display: none" id="oviewspareparts">
    <%
        ResultSet rs1= obj1.list_spareparts();
    %>
    <div class="container-fluid">
        &nbsp;&nbsp;<table class ="table table-hover table-bordered text-centered" style="margin: auto;width: 90% !important; border: 2px solid black "><h3 class="w3-center">Spareparts</h3>
        <tr class="success"><th>Sparepart Id</th><th>Sparepart Name</th><th>Model Number</th><th>Brand Name</th><th>Cost</th><th>Units</th><th>Vehicle Id</th><th>Added On:</th></tr>
        <% try {
            while(rs1.next()) {
        %>
        <tr class="danger"><td><%out.println(rs1.getInt("id"));%></td><td><%out.println(rs1.getString("name"));%></td><td><%out.println(rs1.getString("model_no"));%>
        </td><td><%out.println(rs1.getString("brand"));%></td><td><%out.println(rs1.getDouble("price"));%></td><td><%out.println(rs1.getInt("units"));%>
        </td><td><%out.println(rs1.getInt("vehicle_id"));%></td><td><%out.println(rs1.getString("updated_at"));%></td></tr>
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
<%
}else{
%>
<nav class="w3-bar w3-black">
    <a href="/index.html" class="w3-button w3-bar-item">Login</a>
</nav>
<section class="w3-container w3-center w3-content" style="max-width:600px;">
    <h1 class="w3-wide">Please login to continue!!</h1>
</section>
<%
    }
%>
<script type="text/javascript" language="JavaScript" src="/js/final.js" ></script>
</body>
</html>
