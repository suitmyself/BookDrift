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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="description" content="mainshow.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<style type="text/css">
	.showaskput
	{
		width:40%;
		height:180px;
		/*height:180px;*/
		margin-left: auto;
		margin-bottom: 20px;
		margin-top: 0px;
		float: right;
		padding-bottom: 40px;
		/*width: 500px;*/
		background-color: #FFF;
		border: 1px solid  	#E1DFDF ;
		border-radius: 2px;
		box-shadow: 2px 4px 4px #CCC;
		word-break: break-all;
		font: 12px/18px arial,STHeiti,"Microsoft YaHei",宋体;
		color: #333;
	}
	.showarticle
	{
		width:80%;
		/*height:180px;*/
		margin-left: auto;
		margin-bottom: 20px;
		margin-top: 25px;
		padding-bottom: 40px;
		/*width: 500px;*/
		background-color: #FFF;
		border: 1px solid  	#E1DFDF ;
		border-radius: 2px;
		box-shadow: 2px 4px 4px #CCC;
		word-break: break-all;
		font: 12px/18px arial,STHeiti,"Microsoft YaHei",宋体;
		color: #333;
	}
	.content
	{
		background-color:FFCCCC;
		font-size:14px;
		width:100%;
		min-height:30px;
		padding-left:10px;
		padding-top:10px;
		border-radius: 2px;
	}

	
	</style>
	
<title>图书漂流</title>
</head>
<body style="background-color:#D9D9D9">
    <%@ include file="navigator.jsp" %>
  	<%@ include file="module.jsp" %>
  	

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

			<div class="showaskput">
					<p><strong style="font-weight: bold; color: #333; font-size:15px;">
					&nbsp;&nbsp;<a href="askdriftshow.jsp">求漂信息:</a></strong>
					<% int i=0; %>
				<% for (i=0 ; rs.next() && i<3; ++i) { %>
					<% String ask_infor="求漂者："+rs.getString("username")+"&nbsp;&nbsp;&nbsp;&nbsp;书名："+rs.getString("bookName")+"</br>"; %>
					<p class="content"><%= ask_infor%></p>
				<%
				} //for rs
				%>
				<% if(i==0)
					out.print("<p class='content'>暂时没有信息</p>");
				%>
			</div>
<%
sql="select put_driftID,account.username,email,put_time,put_drift.bookID,ISBN,bookName,author,publishment,publish_time,own_username,now_username"
		+" from account,put_drift,book where put_drift.username=account.username and put_drift.bookID=book.bookID;";
rs=stmt.executeQuery(sql);
%>
			
			<div class="showaskput">
					<p><strong style="font-weight: bold; color: #333; font-size:15px;">
					&nbsp;&nbsp;<a href="putdriftshow.jsp">放漂信息:</a></strong>
				<% for (i=0 ; rs.next() && i<3; ++i) { %>
					<% String put_infor="放漂者："+rs.getString("username")+"&nbsp;&nbsp;&nbsp;&nbsp;书名："+rs.getString("bookName")+"</br>"; %>
					<p class="content"><%= put_infor%></p>
				<%
				} //for rs
				%>
				<% if(i==0)
					out.print("<p class='content'>暂时没有信息</p>");
				%>

			</div>
<%
sql="select articleID,username,sharetime,article_title,article_details,bookName from article order by article_score desc;";
rs=stmt.executeQuery(sql);
%>

			<div class="showarticle">
					<p><strong style="font-weight: bold; color: #333; font-size:15px;">
					&nbsp;&nbsp;<a href="articleshare.jsp">读书分享信息:</a></strong>
				<% for (i=0 ; rs.next() && i<3; ++i) { %>
					<% String put_infor="分享者："+rs.getString("username")+"&nbsp;&nbsp;&nbsp;&nbsp;书名："+rs.getString("bookName")+"</br>"; %>
					<p class="content"><%= put_infor%></p>
				<%
				} //for rs
				%>
				<% if(i==0)
					out.print("<p class='content'>暂时没有信息</p>");
				%>

			</div>


</body>
</html>

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
