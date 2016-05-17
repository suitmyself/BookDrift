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
	select username,sharetime,article_title,article_details,bookName from article order by article_score desc;
	*/
	String order=request.getParameter("order");
	String sql = "select articleID,username,sharetime,article_title,article_details,bookName from article order by "+order+" desc";
	//System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
%>

		<% for ( ; rs.next(); ) { %>
			<div class="postItem">
					<div class="originalText">
						<p><strong style="font-weight: bold; color: #333; font-size:15px;">
						&nbsp;&nbsp;<%= rs.getString("username") %></strong> &nbsp;读书分享
						&nbsp;&nbsp; 书名:	<%=rs.getString("bookName") %> 
						&nbsp;&nbsp; 时间:  <i><%= rs.getString("sharetime") %></i></p>
						
						<p class="content"><%= rs.getString("article_title")+"</br></br>"+rs.getString("article_details") %></p>
						<button type="button" id=<%=rs.getString("articleID") %> onclick="addscore(<%=rs.getString("articleID") %>)">点赞</button>
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
