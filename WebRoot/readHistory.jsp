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
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>  
    <title>读者足迹</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="read_history.jsp">
</head>

<style type="text/css">
	.read_history
	{
		width: 80%;
		height: 100%;
		float: left;
		background-color: #D9D9D9;
		border-radius: 8px;
		margin-left: 15px;
		padding-top: 20px;
		padding-bottom: 20px;
	}

    table
    {
  		font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
  		width:95%;
  		border-collapse:collapse;
  	}

	td,  th 
  	{
  		font-size:1em;
  		border:1px solid #98bf21;
 		/*padding:3px 7px 2px 7px;*/
 		/*width: 40px;*/
 		height:35px; 
 		text-align:center;
  	}

	th 
  	{
 		font-size:0.8em;
  		
  		padding-top:5px;
  		padding-bottom:4px;
  		background-color:#A7C942;
  		color:#ffffff;
  	}
</style>  

<body>
	<%@ include file="navigator.jsp" %>
  	<%@ include file="module.jsp" %>
  	<div class="read_history">
  	<center><h3>你的阅览足迹</h3></center>
  	<center>
  	<%
  	try
  	{
  		String sql = "select * from book, user_step where username = '"+userID+"'";
  		ResultSet rs = stmt.executeQuery(sql);
  		
  		if(rs.next()) 
		{
			out.println("<table>");
	        out.println("<tr>");
	        out.println("<th>书籍编号</th> <th>ISBN</th> <th>书名</th> <th>作者</th> <th>出版社</th><th>出版时间</th><th>拥有者用户名</th><th>当前所在用户名</th>");
	        out.println("</tr>");
	        out.println("<tr>");
	        out.println("<td>"+rs.getString("bookID")+"</td> ");
	        out.println("<td>"+rs.getString("ISBN")+"</td> ");
	        out.println("<td>"+rs.getString("bookName")+"</td> ");
	        out.println("<td>"+rs.getString("author")+"</td> ");
	        out.println("<td>"+rs.getString("publishment")+"</td> ");
	        out.println("<td>"+rs.getString("publish_time")+"</td> ");
	        //out.println("<td>"+rs.getString("state")+"</td> ");
	        out.println("<td>"+rs.getString("own_username")+"</td> ");
	        out.println("<td>"+rs.getString("now_username")+"</td> ");
	        out.println("</tr>");
	        
	        while(rs.next())
	        {
	        	out.println("</tr>");
	        	out.println("<tr>");
	        	out.println("<td>"+rs.getString("bookID")+"</td> ");
	        	out.println("<td>"+rs.getString("ISBN")+"</td> ");
	        	out.println("<td>"+rs.getString("bookName")+"</td> ");
	        	out.println("<td>"+rs.getString("author")+"</td> ");
	        	out.println("<td>"+rs.getString("publishment")+"</td> ");
	        	out.println("<td>"+rs.getString("publish_time")+"</td> ");
	        	//out.println("<td>"+rs.getString("state")+"</td> ");
	       	 	out.println("<td>"+rs.getString("own_username")+"</td> ");
	        	out.println("<td>"+rs.getString("now_username")+"</td> ");
	        	out.println("</tr>");
	        }
	        
			out.println("</table");
		}
		else
		{
			out.println("你还没有阅读过书籍哦");
		}

		rs.close();
		stmt.close();
		conn.close();
  		
  	}
  	catch (Exception e)
  	{
  		out.println("数据库错误");
  		e.printStackTrace();
  	}
  	%>
  	</center>
  	</div>
</body>
</html>
