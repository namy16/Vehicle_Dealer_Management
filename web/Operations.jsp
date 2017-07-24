<%@ page import="java.sql.SQLException" %>
<jsp:useBean id="obj" class="Dao.AdminDaoImpl"/>
<jsp:useBean id="obj1" class="Dao.VehicleDaoImpl"/>
<jsp:useBean id="obj2" class="Dao.SparepartDaoImpl"/>


<%--
  Created by IntelliJ IDEA.
  UserDao: parashan
  Date: 7/19/2017
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/style.css" >
    <link rel="stylesheet" href=" https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
</head>
<body>
<%

HttpSession session2 = request.getSession(false);

if(session2.getAttribute("username")!=null){
    String mainuser=session2.getAttribute("username").toString();

    String username = request.getParameter("user");
    String password = request.getParameter("password1");

%>
<nav class="w3-bar w3-black">
    <div class="w3-button w3-bar-item"><a href="/logout"><input class="w3-button" type="button" value="Logout" ></a>
    </div>

    <%
    if(mainuser.equals("admin"))
    {
    %>
    <div class="w3-button w3-bar-item"><a href="entity/Admin.jsp"><input class="w3-button" type="button" value="Home"></a>
    </div>
    <%
        }
    else
        {%>
          <div class="w3-button w3-bar-item"><a href="entity/Operator.jsp"><input class="w3-button" type="button" value="Home"></a>
    </div>
        <%}

    %>
</nav>
<section class="w3-container w3-center w3-content" style="max-width:600px;">
    <h1 class="w3-wide">Welcome <%out.println(mainuser);%></h1>
</section><br>


<%
try {   if(username!=null) {
    int result = obj.add_operator(username, password);
    if (result == 1) {
      %>  <div class="row" id="itemadded">
    <center><h1><img src="images/right.png" title="right"/>Operator Added Succesfully!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
    <%
    } else if (result == -1) {
    %>  <div class="row" id="itemadded">
    <center><h1><img src="images/wrong.png" title="right"/>Username already exist! Please try different one..</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
    } else {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/wrong.png" title="right"/>Something goes wrong!!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
    }
}
    String opuser = request.getParameter("opuser");
if(opuser!=null) {
int result = obj.remove_operator(opuser);
if(result ==1) {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/right.png" title="right"/>Operator terminated!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
}
else {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/wrong.png" title="right"/>Username not found.</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
}
}
    String vname = request.getParameter("vname");
    String mno = request.getParameter("mno");
    String bname = request.getParameter("bname");
    String price = request.getParameter("price");
    String units = request.getParameter("units");
    String tax = request.getParameter("tax");
    String profit = request.getParameter("profit");

    if(vname!=null) {
        int result = obj1.add_vehicle(mno,vname,bname,Double.parseDouble(price),Integer.parseInt(units),Double.parseDouble(tax),Double.parseDouble(profit));
        if(result ==1) {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/right.png" title="right"/>Vehicle Added Succesfully!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%      }
        else {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/wrong.png" title="right"/>Something goes wrong!!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }

    }
String modelno=request.getParameter("modelno");
    if(modelno!=null){
        int result = obj1.remove_vehicle(modelno);
        if(result ==1) {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/right.png" title="right"/>Vehicle removed successfully!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
        else {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/wrong.png" title="right"/>Something goes wrong!!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
    }
    String svname = request.getParameter("svname");
    String smno = request.getParameter("smno");
    String sbname = request.getParameter("sbname");
    String sprice = request.getParameter("sprice");
    String sunits = request.getParameter("sunits");
    String stax = request.getParameter("stax");
    String vehicle_id = request.getParameter("vehicle_id");
    if(svname != null) {
        int result = obj2.add_sparepart(smno,svname,sbname,Double.parseDouble(sprice), Integer.parseInt(sunits),Integer.parseInt(vehicle_id),Double.parseDouble(stax));
        if(result ==1) {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/right.png" title="right"/>Sparepart added successfully!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
        else if(result == -1){
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/wrong.png" title="right"/>Something goes wrong!!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }

    }
    String smodelno = request.getParameter("smodelno");
    if(smodelno!=null){
        int result = obj2.remove_sparepart(smodelno);
        if(result == 1) {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/right.png" title="right"/>Sparepart removed successfully!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
        else if(result == -1){
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/wrong.png" title="right"/>Something goes wrong!!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
    }
} catch (Exception e) {
        e.printStackTrace();
    }

String vmodelno=request.getParameter("vmodelno");
    String vunits=request.getParameter("vunits");
    if(vmodelno!=null){
        int result = obj1.add_vehicle_stock(mainuser,vmodelno,Integer.parseInt(vunits));
        if(result == 1) {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/right.png" title="right"/>Stock added successfully!</h1></center><br>
    <center><h3><a href="entity/Operator.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
        else if(result == -1){
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/wrong.png" title="right"/>Something goes wrong!!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
    }

    String svmodelno=request.getParameter("svmodelno");
    String svunits=request.getParameter("svunits");
    if(svmodelno!=null){
        int result = obj1.sell_vehicle_stock(mainuser,svmodelno,Integer.parseInt(svunits));
        if(result == 1) {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/right.png" title="right"/>Vehicle Selled successfully!</h1></center><br>
    <center><h3><a href="entity/Operator.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
        else if(result == -1){
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/wrong.png" title="right"/>Something goes wrong!!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
    }
    String smodelno=request.getParameter("sparemodelno");
    String sunits=request.getParameter("spareunits");
    if(smodelno!=null){
        int result = obj2.add_sparePartsStocks(mainuser,smodelno,Integer.parseInt(sunits));
        if(result == 1) {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/right.png" title="right"/>Spareparts added successfully!</h1></center><br>
    <center><h3><a href="entity/Operator.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
        else if(result == -1){
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/wrong.png" title="right"/>Something goes wrong!!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
    }
    String ssmodelno=request.getParameter("ssmodelno");
    String ssunits=request.getParameter("ssunits");
    if(ssmodelno!=null){
        int result = obj2.sell_spareParts(mainuser,ssmodelno,Integer.parseInt(ssunits));
        if(result == 1) {
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/right.png" title="right"/>Spareparts selled successfully!</h1></center><br>
    <center><h3><a href="entity/Operator.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
        else if(result == -1){
%>  <div class="row" id="itemadded">
    <center><h1><img src="images/wrong.png" title="right"/>Something goes wrong!!</h1></center><br>
    <center><h3><a href="entity/Admin.jsp"><button class="w3-button">Back</button></a></h3></center>
</div>
<%
        }
    }
}else{
%>
<nav class="w3-bar w3-black">
    <a href="index.html" class="w3-button w3-bar-item">Login</a>
</nav>
<section class="w3-container w3-center w3-content" style="max-width:600px;">
    <h1 class="w3-wide">Please login to continue!!</h1>
</section>
<%
    }
%>

<footer class="w3-container w3-padding-64 w3-center w3-black w3-xlarge">
</footer>


<script type="text/javascript" language="JavaScript" src="js/final.js" ></script>

</body>
</html>
