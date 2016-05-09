<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String userID = (String) session.getAttribute("userID");
if (session.isNew() || userID == null)
{
	response.sendRedirect("login.jsp");
	//System.out.println("转向到登录页面");
	return;
}
%>
<%@ include file="accessDB.jsp" %>

<%
String ask_driftID=request.getParameter("id");
try {
	//Query posts
	/*
	select ask_num from ask_drift where ask_driftID=1;
	*/
	
	String sql = "select ask_num from ask_drift where ask_driftID="+ask_driftID;
	//System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next())
	{
		int num=rs.getInt("ask_num")+1;
		//update ask_drift set ask_num=3 where ask_driftID=1;
		sql="update ask_drift set ask_num='"+num+"' where ask_driftID='"+ask_driftID+"'";
		stmt.executeUpdate(sql);
	}
	
%>

<%
	rs.close();
	stmt.close();
	conn.close();
} //try
catch(SQLException se) {
	//Handle errors for JDBC
	out.println("<p>sorry,数据库错误</P>");
	se.printStackTrace();
}
catch(Exception e) {
	//Handle errors for Class.forName
	out.println("<p>sorry,数据库错误</P>");
	e.printStackTrace();
}
finally {
	//finally block used to close resources
	try {
		if(stmt!=null) stmt.close();
	}
	catch(SQLException se2)
	{
		out.println("<p>sorry,数据库错误</P>");
	}// nothing we can do
	try {
		 if(conn!=null) conn.close();
	}
	catch(SQLException se) {
		out.println("<p>sorry,数据库错误</P>");
		se.printStackTrace();
	}
}
%>
