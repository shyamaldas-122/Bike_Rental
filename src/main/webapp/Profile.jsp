<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="css/Homepage.css">
<link rel="stylesheet" href="about.css">

</head>
<body>
    <header>
        <a href="#" class="logo"><img src="image/bycicle (1).png" width="60px" alt=""></a>
        <ul>
            <li><a href="index.html" class="A">HOME</a></li>
            <li><a href="about.html" class="A">ABOUT</a></li>
            <li><a href="BikeListing.html" class="A">BIKE LISTING</a></li>
            <!-- <li><a href="#">Portfolio</a></li>
            <li><a href="#">Team</a></li> -->
            <li><a href="contact-us.html" class="A">CONTACT</a></li>
            <li><a href="Profile.jsp" class="B"><img src="images/user.png" alt="" width="30px"></a></li>
            <li><button class="btn"><a href="Logout.jsp" class="A">LOGOUT</a></button></li>
        </ul>
    </header>
    <script type="text/javascript">
    window.addEventListener("scroll",function()
    {
        var header=document.querySelector("header");
        header.classList.toggle("sticky",window.scrollY>0);
    })
 </script>
 
<div class="active">
	<%@ page import="java.sql.*" %>
	<%@ page import="javax.sql.*" %>
	
	<%
	HttpSession httpSession = request.getSession();
    String guid=(String)httpSession.getAttribute("currentuser");
    %>
    
    <div class="filler"></div>
    <h2>Welcome <%=guid%></h2>
    
    <%
	ResultSet rs=null;
	PreparedStatement ps=null;
	java.sql.Connection conn=null;
	String query="select fname,uid,address,phno,email from customer where uid=?";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase","root","root");
		ps=conn.prepareStatement(query);
		ps.setString(1,guid);
		rs=ps.executeQuery();
		if(rs.next())
		{
			
		%>
		<div class="filler2"></div>
			<div class="card">
  				<img style="border-radius:100%;" src="images/Sasuke2.png" class="Avatar" width=70%>
  				<div class="container">
    			 <div class="space1"><b><%=rs.getString("fname") %></b></div>
    			 <div class="filler3"></div>
   					<div class="space"><b>ID: </b><%=rs.getString("uid") %></div>
   					<div class="space"><b>Address: </b><%=rs.getString("address") %></div>
   					<div class="space"><b>Phone: </b><%=rs.getString("phno") %></div>
   					<div class="space"><b>Email: </b><%=rs.getString("email") %></div>
  				</div>
			</div>
		<%
		
		}
	}
	catch(Exception e)
	{
		out.println("error: "+e);
	}
	finally {
	    try { if (rs != null) rs.close(); } catch (Exception e) {};
	    try { if (ps != null) ps.close(); } catch (Exception e) {};
	    try { if (conn != null) conn.close(); } catch (Exception e) {};
	}
	%>
	
</div>
</body>
</html>
