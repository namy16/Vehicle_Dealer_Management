<%@ page import="java.sql.ResultSet" %>
<%@ page import="session_tracking.ActiveUsers" %>
<jsp:useBean id="obj" class="Dao.VehicleDaoImpl"/>
<jsp:useBean id="obj2" class="Dao.AdminDaoImpl"/>
<jsp:useBean id="obj1" class="Dao.SparepartDaoImpl"/>
<jsp:useBean id="au" class="session_tracking.ActiveUsers"/>
<%--
  Created by IntelliJ IDEA.
  UserDao: parashan
  Date: 7/18/2017
  Time: 12:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css" >
    <link rel="stylesheet" href=" https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css" >

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="https://code.jquery.com/jquery-1.12.4.js" ></script>
    <script type="text/javascript" language="JavaScript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" ></script>
    <script type="text/javascript" language="JavaScript" src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js" ></script>
<script type="text/javascript">
function displayrow() {
    document.getElementById("view").style.display="block";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    document.getElementById("operations").style.display="none";

}
function homerow() {
    document.getElementById("view").style.display="none";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="block";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    document.getElementById("viewspareparts").style.display="none";
    document.getElementById("viewvehicles").style.display="none";
    document.getElementById("viewoperators").style.display="none";
    document.getElementById("viewlogs").style.display="none";
    document.getElementById("operations").style.display="block";

}
function viewvehicles() {

    document.getElementById("view").style.display="block";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    document.getElementById("operations").style.display="none";
    document.getElementById("viewspareparts").style.display="none";
    document.getElementById("viewoperators").style.display="none";
    document.getElementById("viewlogs").style.display="none";
    document.getElementById("main").innerHTML = document.getElementById("viewvehicles").innerHTML;
    document.getElementById("viewvehicles").style.display="block";

}
function viewspareparts() {

    document.getElementById("view").style.display="block";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    document.getElementById("operations").style.display="none";
    document.getElementById("viewvehicles").style.display="none";
    document.getElementById("viewoperators").style.display="none";
    document.getElementById("viewlogs").style.display="none";
    document.getElementById("main").innerHTML = document.getElementById("viewspareparts").innerHTML;
    document.getElementById("viewspareparts").style.display="block";

}
function viewoperators() {

    document.getElementById("view").style.display="block";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    document.getElementById("operations").style.display="none";
    document.getElementById("viewspareparts").style.display="none";
    document.getElementById("viewvehicles").style.display="none";
    document.getElementById("viewlogs").style.display="none";
    document.getElementById("main").innerHTML = document.getElementById("viewoperators").innerHTML;
    document.getElementById("viewoperators").style.display="block";
}
function viewlogs() {

    document.getElementById("view").style.display="block";
    document.getElementById("addsparepart").style.display="none";
    document.getElementById("main").style.display="none";
    document.getElementById("addoperator").style.display="none";
    document.getElementById("addvehicle").style.display="none";
    document.getElementById("removevehicle").style.display="none";
    document.getElementById("removeoperator").style.display="none";
    document.getElementById("removesparepart").style.display="none";
    document.getElementById("operations").style.display="none";
    document.getElementById("viewspareparts").style.display="none";
    document.getElementById("viewvehicles").style.display="none";
    document.getElementById("viewoperators").style.display="none";
    document.getElementById("main").innerHTML = document.getElementById("viewlogs").innerHTML;
    document.getElementById("viewlogs").style.display="block";
}
var xmlhttp;
function f1(a1)
{

    console.log(a1);
xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange=f2;
    xmlhttp.open("GET","http://localhost:8080/Ajax.jsp?id1="+a1,true);
    xmlhttp.send(null);
    console.log("iiiiiiii");
}
function f2()
{

    if(xmlhttp.readyState===4 && xmlhttp.status===200)
    {
        str=xmlhttp.responseText;
        alert(str);
        console.log(str);
        if(str.trim()==="false") {
            document.getElementById("modelnum").style.display="block";
            document.getElementById("axy").focus();

            return false;
        }
        else {
            alert("model number does not exist");
        }
    }
}


</script>
    <script>
$(document).ready(function() {
    $('#example').DataTable();
} );
</script>
</head>
<body>
<%

HttpSession session2 = request.getSession(false);
if(session2.getAttribute("username")!=null)
    {
%>
<nav class="w3-bar w3-black">
    <div class="w3-button w3-bar-item"><a href="/logout"><input class="w3-button" style="font-weight: bold" type="button" value="Logout" ></a>
    </div>
    <div class="w3-button w3-bar-item"><input class="w3-button" style="font-weight: bold" type="button" value="Display" onclick="displayrow();">
    </div>
    <div class="w3-button w3-bar-item"><input class="w3-button" style="font-weight: bold" type="button" value="Home" onclick="homerow();">
    </div>
    <div class="w3-button w3-bar-item" style="float: left"><input class="w3-button" style="font-weight: bold" type="button" value="Active Users:<%out.println(ActiveUsers.getActiveSessions());%>" >
    </div>
</nav>
<section class="w3-container w3-center w3-content" style="max-width:600px;">
    <h1 class="w3-wide">Welcome Admin</h1>
</section><br>
    <div class="row" style="background: #044404;color: white" id="operations">
        <div class="col-md-2  w3-button" ><h3><input type="button" class="w3-button"  value="Add Operator" onclick="addoperator();"></h3></div>
        <div class="col-md-2 w3-button" ><h3><input type="button" class="w3-button" value="Remove Operator" onclick="removeoperator();"></h3></div>
        <div class="col-md-2 w3-button" ><h3><input type="button" class="w3-button" value="Add Vehicle" onclick="addvehicle();"></h3></div>
        <div class="col-md-2 w3-button"><h3><input type="button" class="w3-button" value="Remove Vehicle" onclick="removevehicle();"></h3></div>
        <div class="col-md-2 w3-button"><h3><input type="button" class="w3-button" value="Add Sparepart" onclick="addsparepart();"></h3></div>
        <div class="col-md-2 w3-button"><h3><input type="button" class="w3-button" value="Remove Sparepart" onclick="removesparepart();"></h3></div>
    </div>
<div class="row" style="background: #044404;color: white;display: none" id="view" >
    <div class="col-md-3  w3-button" ><h3><input type="button" class="w3-button" value="View Vehicles"  onclick="viewvehicles();"></h3></div>
    <div class="col-md-3 w3-button" ><h3><input type="button" class="w3-button" value="View Spareparts" onclick="viewspareparts();"></h3></div>
<div class="col-md-3 w3-button" ><h3><input type="button" class="w3-button" value="View Operators" onclick="viewoperators();"></h3></div>
<div class="col-md-3 w3-button" ><h3><input type="button" class="w3-button" value="Logs" onclick="viewlogs();"></h3></div>
</div>
<div class = "row w3-center" id="main"  >
    </div>

<div class = "row" id="addoperator" >
    <div class="login-page" >
        <div class="form" >
            <form class="login-form" action="/Operations.jsp">
                <p class="message"><h4>Add Operator</h4></p>
                <input type="text" placeholder="Enter Operator username" name="user" required/>
                <input type="password" placeholder="Choose a password" name="password1" required/>
                <input type="password" placeholder="Confirm password" name="password2" required/>
                <button>ADD</button>

            </form>
        </div>
    </div>
</div>
    <div class = "row" style="display: none" id="removeoperator">
        <div class="login-page" >
            <div class="form" >
                <h4>Remove Operator</h4>
                <form class="login-form" action="/Operations.jsp">
                    <input type="text" placeholder="Enter Operator username !" name="opuser" required/>
                    <button>DELETE</button>
                </form>
            </div>
        </div>
    </div>
        <div class = "row" style="display: none" id="addvehicle">
            <div class="login-page" >
                <div class="form" >
                    <h4>Add Vehicle</h4>
                    <form class="login-form" name="myform" action="/Operations.jsp">
                        <input type="text" placeholder="Enter Vehicle Name" name="vname" required/>
                        <span class="glyphicon glyphicon-remove-circle" id="modelnum" style="float: left;color: #f44336;padding-bottom: 2%;display: none">Vehicle Number Already exist!!</span>
                        <input type="text" placeholder="Enter Vehicle Number" name="mno" id="axy" onblur = "f1(this.value)"/>
                        <input type="text" placeholder="Enter Brand Name" name="bname" required/>
                        <input type="text" placeholder="Enter Price of Vehicle" name="price" required/>
                        <input type="text" placeholder="Enter Units of Vehicle" name="units" required/>
                        <input type="text" placeholder="Enter Tax Incurred" name="tax" required/>
                        <input type="text" placeholder="Enter Profit Gained!" name="profit" required/>
                        <button>ADD</button>
                    </form>
                </div>
            </div>
        </div>
            <div class = "row" style="display: none" id="removevehicle">
                <div class="login-page" >
                    <div class="form" >
                        <h4>Remove Vehicle</h4>
                        <form class="login-form" action="/Operations.jsp" >
                            <input type="text" placeholder="Enter Model Number Of Vehicle" name="modelno" required/>
                            <button>DELETE</button>
                        </form>
                    </div>
                </div>
            </div>
                <div class = "row" style="display: none" id="addsparepart">
                    <div class="login-page" >
                        <div class="form" >
                            <h4>Add Sparepart</h4>
                            <form class="login-form" action="/Operations.jsp" >
                                <input type="text" placeholder="Enter Sparepart Name" name="svname" required/>
                                <input type="text" placeholder="Enter Model Number" name="smno" required/>
                                <input type="text" placeholder="Enter Brand Name" name="sbname" required/>
                                <input type="text" placeholder="Enter Price of Sparepart" name="sprice" required/>
                                <input type="text" placeholder="Enter sparepart's vehicle id" name="vehicle_id" required/>
                                <input type="text" placeholder="Enter Units of sparepart" name="sunits" required/>
                                <input type="text" placeholder="Enter Tax Incurred" name="stax" required/>
                                <button>ADD</button>
                            </form>
                        </div>
                    </div>
                </div>
                    <div class = "row" style="display: none" id="removesparepart">
                        <div class="login-page" >
                            <div class="form" >
                                <h4>Remove Sparepart</h4>
                                <form class="login-form" action="/Operations.jsp">
                                    <input type="text" placeholder="Enter Model number of sparepart" name="smodelno" required/>
                                    <button>DELETE</button>
                                </form>
                            </div>
                        </div>
                    </div>

<div class = "row" style="display: none" id="viewvehicles">
    <%
       ResultSet rs= obj.list_vehicles();
    %>
        <div class="container-fluid">
            &nbsp;&nbsp;<table class ="table table-hover table-bordered text-centered" style="margin: auto;width: 90% !important; border: 2px solid black "><h2 class="w3-center">Vehicles</h2>
                <tr class="success"><th>Vehicle ID</th><th>Vehicle Name</th><th>Model Number</th><th>Brand Name</th><th>Cost</th><th>Units</th><th>GST</th><th>Profit</th><th>Added On:</th></tr>
                <% try {
                    while(rs.next()) {
                    %>
                <tr class="danger"><td><%out.println(rs.getInt("id"));%></td><td><%out.println(rs.getString("name"));%></td><td><%out.println(rs.getString("model_no"));%>
                </td><td><%out.println(rs.getString("brand"));%></td><td><%out.println(rs.getDouble("price"));%></td><td><%out.println(rs.getInt("units"));%>
                </td><td><%out.println(rs.getDouble("tax"));%></td><td><%out.println(rs.getDouble("profit"));%></td><td><%out.println(rs.getString("updated_at"));%></td></tr>
                <%
                }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </table>

        </div>

</div>
<div class = "row" style="display: none" id="viewspareparts">
    <%
        ResultSet rs1 = obj1.list_spareparts();
    %>
    <div class="container-fluid">
        &nbsp;&nbsp;<table class ="table table-hover table-bordered text-centered" style="margin: auto;width: 90% !important; border: 2px solid black "><h2 class="w3-center">Spareparts</h2>
        <tr class="success"><th>Sparepart Id</th><th>Sparepart Name</th><th>Model Number</th><th>Brand Name</th><th>Cost</th><th>Units</th><th>GST</th><th>Vehicle Id</th><th>Added On:</th></tr>
        <% try {
            while(rs1.next()) {
        %>
        <tr class="danger"><td><%out.println(rs1.getInt("id"));%></td><td><%out.println(rs1.getString("name"));%></td><td><%out.println(rs1.getString("model_no"));%>
        </td><td><%out.println(rs1.getString("brand"));%></td><td><%out.println(rs1.getDouble("price"));%></td><td><%out.println(rs1.getInt("units"));%>
        </td><td><%out.println(rs1.getDouble("tax"));%></td><td><%out.println(rs1.getInt("vehicle_id"));%></td><td><%out.println(rs1.getString("updated_at"));%></td></tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>

    </div>
</div>
        <div class = "row" style="display: none" id="viewoperators">
            <%try {
                ResultSet rs2= obj2.viewoperators();
            %>
            <div class="container-fluid">
                &nbsp;&nbsp;<table class ="table table-hover table-bordered text-centered" style="margin: auto;width: 50% !important; border: 2px solid black "><h2 class="w3-center">Operators</h2>
                <tr class="success"><th>Id</th><th>Operator username</th><th>Added On:</th></tr>
                <%
                    while(rs2.next()) {
                %>
                <tr class="danger"><td><%out.println(rs2.getInt("id"));%></td><td><%out.println(rs2.getString("username"));%>
                    <td><%out.println(rs2.getString("updated_at"));%></td></tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>

            </div>

</div>

        <div class = "row" style="display: none" id="viewlogs">
            <%try {
                ResultSet rs3= obj2.viewlogs();
            %>
            <div class="container-fluid">
                &nbsp;&nbsp; <table id="example" class="table table-striped table-bordered" cellspacing="0" style="margin: auto;width: 50% !important; border: 2px solid black "><h2 class="w3-center">Logs</h2>
                <thead>
                <tr ><th>Id</th><th>Userame</th><th>Access Time:</th><th>Action:</th></tr>
                </thead><tbody>
                <%
                    while(rs3.next()) {
                %>

                <tr ><td><%out.println(rs3.getInt("id"));%></td><td><%out.println(rs3.getString("username"));%>
                    <td><%out.println(rs3.getString("time"));%></td><td><%out.println(rs3.getString("description"));%></td></tr>
                <%
                        }%>
                        </tbody><%
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
    <a href="../index.html" class="w3-button w3-bar-item">Login</a>
</nav>
<section class="w3-container w3-center w3-content" style="max-width:600px;">
    <h1 class="w3-wide">Please login to continue!!</h1>
</section>
<%
    }
%>
<script type="text/javascript" language="JavaScript" src="../js/final.js" ></script>
</body>
</html>
