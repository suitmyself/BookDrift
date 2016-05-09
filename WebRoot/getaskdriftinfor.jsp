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
try {
	//Query posts
	//select ask_driftID,ask_drift.username,ask_time,ask_infor,email from ask_drift,account where ask_drift.username=account.username ORDER BY ask_num DESC;
	String sql = "SELECT ask_driftID,ask_drift.username,bookName,ask_time,ask_infor,email FROM ask_drift,account"
				+ " where ask_drift.username=account.username"
				+ " ORDER BY ask_num DESC";
	//System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
%>

		<% for ( ; rs.next(); ) { %>
			<% String ask_driftID = rs.getString("ask_driftID"); %>
			<div class="postItem">
				<div class="originalText">
					<p><strong style="font-weight: bold; color: #333; font-size:15px;">
					&nbsp;&nbsp;<%= rs.getString("username") %></strong> &nbsp;发布求漂
					&nbsp;&nbsp; email:	<%=rs.getString("email") %> 
					&nbsp;&nbsp; 时间:  <i><%= rs.getString("ask_time") %></i></p>
					<% String ask_infor="书名："+rs.getString("bookName")+"</br>"+rs.getString("ask_infor"); %>
					<p class="content"><%= ask_infor%></p>
					<button type="button" id=<%=ask_driftID %> onclick="addnum(<%=ask_driftID %>)">同求</button>
					
				</div>
			</div>
		<%
		} //for rs
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
