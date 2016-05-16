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
	/*
	select account.username,email,put_time,put_drift.bookID,ISBN,bookName,author,publishment,publish_time,own_username,now_username 
	from account,put_drift,book where put_drift.username=account.username and put_drift.bookID=book.bookID;
	*/
	
	String sql = "select put_driftID,account.username,email,put_time,put_drift.bookID,ISBN,bookName,author,publishment,publish_time,own_username,now_username"
	+" from account,put_drift,book where put_drift.username=account.username and put_drift.bookID=book.bookID;";
	//System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
%>

		<% for ( ; rs.next(); ) { %>
			<div class="postItem">
					<div class="originalText">
						<p><strong style="font-weight: bold; color: #333; font-size:15px;">
						&nbsp;&nbsp;<%= rs.getString("username") %></strong> &nbsp;发布放漂
						&nbsp;&nbsp; email:	<%=rs.getString("email") %> 
						&nbsp;&nbsp; 时间:  <i><%= rs.getString("put_time") %></i></p>
						<% String bookinfor="书名：<button type='button' onclick=\"window.location.href='bookshareinfor.jsp?bookName="+rs.getString("bookName")+"'\">"+rs.getString("bookName")+"</button></br> 作者："+rs.getString("author")+"&nbsp;&nbsp;&nbsp;&nbsp;出版社："+rs.getString("publishment")+"&nbsp;&nbsp;&nbsp;&nbsp;出版时间："+rs.getString("publish_time")+"&nbsp;&nbsp;&nbsp;&nbsp;ISBN:"+rs.getString("ISBN"); %>
						<p class="content"><%= bookinfor %></p>
						<button type="button" id=<%=rs.getString("put_driftID") %> onclick="changeclaim(<%=rs.getString("put_driftID") %>,<%=rs.getString("bookID") %>,'<%=userID%>')">认领</button>
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
