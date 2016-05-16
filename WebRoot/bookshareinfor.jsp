<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");

	String userID = (String) session.getAttribute("userID");
	if (session.isNew() || userID == null)
	{
		response.sendRedirect("login.jsp");
		return;
	}
	
	String bookName=request.getParameter("bookName");//仅仅显示当前bookName的读书分享文章

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
    <title>书籍评价</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="read_history.jsp">
</head>

<style type="text/css">

	.putdriftBoard {
		width: 80%;
		height: 100%;
		float: left;
		background-color: #D9D9D9;
		border-radius: 8px;
		margin-left: 15px;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	.postItem 
	{
		margin-left: auto;
		margin-right: auto;
		
		display: block;
		margin-bottom: 20px;
		/*width: 500px;*/
		background-color: #FFF;
		border: 1px solid #E1DFDF;
		border-radius: 2px;
		box-shadow: 0px 2px 2px #CCC;
		word-break: break-all;
		font: 12px/18px arial,STHeiti,"Microsoft YaHei",宋体;
		color: #333;
	
	
		width: 90%;
		float: left;
		border-radius: 5px;
		margin-left: 20px;
		padding-top: 10px;
		padding-bottom: 20px;
	}
	.originalText {
		width: 90%;
		float: left;
		background-color: #FFF;
		border-radius: 5px;
		margin-left: 20px;
		padding-top: 10px;
		padding-bottom: 0px;
	}
	.content
	{
		background-color:FFCCCC;
		font-size:14px;
		width:100%;
		min-height:80px;
		padding-left:10px;
		padding-top:10px;
		border-radius: 2px;
		margin-bottom: 5px;
	}
</style>  

	<script type="text/javascript" src="jquery-1.8.0.min.js"></script>
	<script type="text/javascript">
	function addscore(id)
	{
		$('#' + id).hide();
		
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		}
		else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.open("GET", "articleaddscore.jsp?id=" + id, true);
		xmlhttp.send();

		alert("点赞成功!!!");
	}
	</script>

<body>
	<%@ include file="navigator.jsp" %>
  	<%@ include file="module.jsp" %>
  	<div class="putdriftBoard">
  	<h1><center>读书评价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center></h1>
  	
<%
try {
	//Query posts
	/*
	select username,sharetime,article_title,article_details,bookName from article order by article_score desc;
	*/
	
	String sql = "select articleID,username,sharetime,article_title,article_details,bookName from article where bookName='"+bookName+"' order by article_score desc";
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
  	</div>
</body>
</html>
