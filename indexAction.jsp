<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List" %>
<%
String name=request.getParameter("name");
String userID=request.getParameter("userID");
String email=request.getParameter("email");
String password=request.getParameter("password");
String confirm_password=request.getParameter("confirm_password");

try{ 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase","root","1996@Kna");
	Statement st= con.createStatement();
	st.executeUpdate("insert into user (name,userID,email,password,confirm_password) values('"+name+"','"+userID+"','"+email+"','"+password+"','"+confirm_password+"')");
	response.sendRedirect("save.html");
	
	
}
catch(Exception e){
	response.sendRedirect("error.html");
	
	System.out.println(e);
	e.printStackTrace();
}
%>