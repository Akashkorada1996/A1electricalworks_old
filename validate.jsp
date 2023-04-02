<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.List" %>
<%

String userID=request.getParameter("userID");
String password=request.getParameter("password");
int temp =1;


try{ 

	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase","root","1996@Kna");
	Statement st= con.createStatement();
	
	ResultSet resultset = st.executeQuery("select * from user;");
	
	while(resultset.next()) {
		String db_userID= resultset.getString("userID");
		String db_password = resultset.getString("password");
		/* System.out.println(db_userID + " "+db_password);
		System.out.println(db_userID == userID);
		System.out.println(((Object)userID).getClass().getSimpleName());
		System.out.println(((Object)db_userID).getClass().getSimpleName()); */
		if(userID.equals(db_userID) && password.equals(db_password)){
			response.sendRedirect("view.html");
			temp=0;
			break;
		}
		
	
	}
	if (temp == 1){
		out.println("<script>");
	    out.println("alert('This is an alert message!');");
	    out.println("</script>");

	}
	
}
catch(Exception e){
	response.sendRedirect("error.html");
	
	System.out.println(e);
	e.printStackTrace();
}
%>