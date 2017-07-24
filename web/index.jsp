<%@ page import="java.sql.SQLException" %><%-- Created by IntelliJ IDEA. --%>
<jsp:useBean id="obj" class="Dao.UserDaoImpl"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
      <link rel='stylesheet'  href='css/style.css'>
  </head>
  <body>
<%
  String username=request.getParameter("user");
  String pass=request.getParameter("password");
  HttpSession session2=request.getSession(false);
  if(session2.getAttribute("username")!=null) {
      String user=session2.getAttribute("username").toString();
      %>
<script>
    window.onload = function () {
        <%
      if(user.equals("admin")) {

RequestDispatcher rd =request.getRequestDispatcher("entity/Admin.jsp");
          rd.include(request,response);
%>alert("You are already logged in!!")
      <%
    }
      else {
          RequestDispatcher rd =request.getRequestDispatcher("entity/Operator.jsp");
          rd.include(request,response);
      %>alert("You are already logged in!!")
        <%
        }
          %>
    };
</script>
<%
  }
  else {
  HttpSession session1=request.getSession(true);

  session1.setAttribute("username",username);
  try {
    int privilege = obj.isValid(username,pass);
     if(privilege ==1)
      response.sendRedirect("entity/Operator.jsp");
    else if(privilege ==2)
      response.sendRedirect("entity/Admin.jsp");
else { %>
    <nav class="w3-bar w3-black" style="background: #cddc39">
    <a href="#home" class="w3-button w3-bar-item">About Us</a>
    <a href="#band" class="w3-button w3-bar-item">Career</a>
    <a href="#tour" class="w3-button w3-bar-item">Invester Relations</a>
    <a href="#contact" class="w3-button w3-bar-item">Media Center</a>
</nav>
<section class="w3-container w3-center w3-content" style="max-width:600px">
    <h2 class="w3-wide">&nbsp;&nbsp;&nbsp;<img src="images/cdk.png"></h2>
</section>

<section class="w3-container w3-center w3-content" style="max-width:600px">
    <h2 class="w3-wide" style="font-family:'Times New Roman';color:#066d17;font-size: 250%  "><b>Dealer Management System</b>
        <div class="login-page">
            <div class="form">
              <h2>Username Does not Exist!!</h2>
                <form class="login-form" action="/index.html">
                    <button>Back</button>
                </form>
            </div>
        </div>
    </h2>
</section>

<footer class="w3-container w3-padding-64 w3-center w3-black w3-xlarge">

</footer>
</body>
<%
    }
  } catch (SQLException e) {
    e.printStackTrace();
  }
    }
%>
  </body>
</html>