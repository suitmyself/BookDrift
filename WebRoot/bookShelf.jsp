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
    <title>个人书架</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="read_history.jsp">
</head>

<style type="text/css">
	.book_shelf
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
  	
  	.drift_book_button
  	{
  		/*height: 30px;*/
		margin-left: 10px;
		margin-top: 5px;
		margin-bottom: 5px;
		adding: 0px 30px;
		display: inline-block;
        font-size: 14px;
        line-height: 28px;
        color: #666;
		text-align: center;
		vertical-align: middle;
		cursor: pointer;
		/*background: linear-gradient(to bottom, #FEFEFE 0px, #F8F8F8 100%) repeat scroll 0% 0% #FBFBFB;*/
		border: 1px solid #A7ACB5;
		border-radius: 3px;
		box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.15);
		/*position: relative;*/
		/*bottom: 10px;*/
		/*float: right;*/
		/*margin-right: 29px;*/
  	}
</style>

<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript">
	
	var global_button;
	
	function driftBook(thisButton) 
	{
		var url = "submitDriftBook_ajax.jsp?"
       				+"&bookID="+thisButton.id;
       	
		url = encodeURI(url);
		url = encodeURI(url);
        send_request("GET", url, null, "text", showFeedbackInfo2);
        
        global_button = thisButton;    
	}
	
	function showFeedbackInfo2() 
	{
		if (http_request.readyState == 4) 
    	{       // 判断对象状态
    		if (http_request.status == 200) 
       		{    // 信息已经成功返回，开始处理信息
       			 //alert(http_request.responseText.replace(/(^\s*)(\s*$)/g,""));        
       			 //需注意，利用这种方式可以查看返回的内容，alert()是一个用来调试的很好的函数，
        		 var message=http_request.responseText;
        		 
        		 if(message.indexOf("success")!=-1)//获得返回的内容
        		 {
        		    global_button.disabled = true;
        			global_button.value = "已放漂";
        			global_button.style="background-color: #FF4500";
        		 	alert("已放漂");
        		 }
        		 else if(message.indexOf("fail")>=0)//获得返回的内容
        		 {
        		 	alert("失败");
        		 }
        	}

    	}
	}
</script>  

<body>
	<%@ include file="navigator.jsp" %>
  	<%@ include file="module.jsp" %>
  	<div class="book_shelf">
  	<center><h3>个人书架</h3></center>
  	<center>(包括你拥有的书籍以及得到别人放漂的书籍)</center>
  	<center>
  	<%
  	try
  	{
  		String sql = "select * from book where own_username = '"+userID+"'";
  		String sql2 = "select * from book where now_username = '"+userID+"' and own_username != '"+userID+"'";
  		
  		ResultSet rs = stmt.executeQuery(sql);
  		boolean is_null = true;
  		
  		if(rs.next()) 
		{
			out.println("<table>");
	        out.println("<tr>");
	        out.println("<th>书籍编号</th> <th>ISBN</th> <th>书名</th> <th>作者</th> <th>出版社</th><th>出版时间</th><th>拥有者用户名</th><th>当前所在用户名</th></th><th>放漂</th>");
	        out.println("</tr>");
	        is_null = false;
	    }
		
		rs.beforeFirst();
   
        while(rs.next())
        {

        	out.println("<tr>");
	        out.println("<td>"+rs.getString("bookID")+"</td> ");
	        out.println("<td>"+rs.getString("ISBN")+"</td> ");
	        out.println("<td>"+rs.getString("bookName")+"</td> ");
	        out.println("<td>"+rs.getString("author")+"</td> ");
	        out.println("<td>"+rs.getString("publishment")+"</td> ");
	        out.println("<td>"+rs.getString("publish_time")+"</td> ");
	        out.println("<td>"+rs.getString("own_username")+"</td> ");
	        out.println("<td>"+rs.getString("now_username")+"</td> ");
			
			if(rs.getString("now_username").equals(userID) && rs.getInt("state") == 0)
			{
			%>
				<td><input type="button" class="drift_book_button" value="放漂" id="<%= rs.getString("bookID")%>" onclick="driftBook(this)"></td>
 			<%
 			}
 			else
 			{
 			%>
        		<td><input type="button" class="drift_book_button" value="放漂中" id="<%= rs.getString("bookID")%>" disabled onclick="driftBook(this)" style="background-color: #FF4500"></td>
       		<%
 			}
	        	
	        out.println("</tr>");
        }
        
        ResultSet rs2 = stmt.executeQuery(sql2); 
        
        if(rs2.next() && is_null == true) 
		{
			out.println("<table>");
	        out.println("<tr>");
	        out.println("<th>书籍编号</th> <th>ISBN</th> <th>书名</th> <th>作者</th> <th>出版社</th><th>出版时间</th><th>拥有者用户名</th><th>当前所在用户名</th></th><th>放漂</th>");
	        out.println("</tr>");
	        is_null = false;
	    }
	    
	    if (is_null == true)
		{
			out.println("你还没有书籍哦，赶紧去求漂或者放漂吧~");
		} 
        
        rs2.beforeFirst();
        while(rs2.next())
        {
        	out.println("<tr>");
	        out.println("<td>"+rs2.getString("bookID")+"</td> ");
	        out.println("<td>"+rs2.getString("ISBN")+"</td> ");
	        out.println("<td>"+rs2.getString("bookName")+"</td> ");
	        out.println("<td>"+rs2.getString("author")+"</td> ");
	        out.println("<td>"+rs2.getString("publishment")+"</td> ");
	        out.println("<td>"+rs2.getString("publish_time")+"</td> ");
	        out.println("<td>"+rs2.getString("own_username")+"</td> ");
	        out.println("<td>"+rs2.getString("now_username")+"</td> ");
			
			if(rs2.getInt("state") == 0)
			{
			%>
				<td><input type="button" class="drift_book_button" value="放漂" id="<%= rs2.getString("bookID")%>" onclick="driftBook(this)"></td>
 			<%
 			}
 			else
 			{
 			%>
        		<td><input type="button" class="drift_book_button" value="放漂中" id="<%= rs2.getString("bookID")%>" disabled onclick="driftBook(this)" style="background-color: #FF4500"></td>
       		<%
 			}
	        	
	        out.println("</tr>");
        }
        
		out.println("</table");

		rs.close();
		rs2.close();
		stmt.close();
		conn.close();
  		
  	}
	catch (SQLException e)
  	{
  		System.out.println("数据库错误");
  		out.println("数据库错误");
  		e.printStackTrace();
  	}
  	%>
  	</center>
  	</div>
</body>
</html>

