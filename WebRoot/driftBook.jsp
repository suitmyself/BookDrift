<%@ page language="java"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>放漂</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="description" content="driftBook.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<style type="text/css">
	
	.bookName, .isbn, .author, .publiser
	{
		padding: 7px 10px;
		width: 233px;
		height: 35px;
		line-height: 25px;
		border-radius: 1px;
		margin-right: 7px;
		border: 1px solid #BDC7D8;
	}
	.submit
	{
		width: 100px;
		height: 43px;
		margin: 10px 10px 10px 10px;
		display: block;
		cursor: pointer;
		color: blue;
		font-size: 18px;
		font-weight: 700;
		font-family: "微软雅黑";
		border: 1px solid #3B6E22;
		border-radius: 3px;
		background-color:#00FF00;
		position: relative;
		right: -25px;
	}
	td
	{
		padding-bottom: 10px;
		padding-top:10px;
		text-align: center;
	}
	.book_drift_pannel
	{
		width: 80%;
		height: 600px;
		float: left;
		background-color: #D9D9D9;
		border-radius: 8px;
		margin-left: 15px;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	
</style>

<body>
<%@ include file="navigator.jsp" %>
<%@ include file="module.jsp" %>

<div class = "book_drift_pannel">
	<h1 align="center">放漂书籍</h1>
	<hr>
	<br>
	<center>
		<form id="form" name="form" class="form" action="submitBook.jsp" method="POST">
			<table>
				<tr>
					<td>书名:</td>
					<td>
						<input id="bookName" name="bookName" class="bookName" style="vertical-align: middle" size="19">
					</td>
				</tr>
				
				<tr>
					<td>ISBN:</td>
					<td>
						<input type="text" name="isbn" id="isbn" class="isbn">
					</td>
				</tr>
				
				<tr>
					<td>作者:</td>
					<td>
						<input type="text" name="author" id="author" class="author">
					</td>
				</tr>
				
				<tr>
					<td>出版社:</td>
					<td>
						<input type="text" name="publiser" id="publiser" class="publiser">
					</td>
				</tr>
				
				<tr>
					<td>出版时间:&nbsp;&nbsp;&nbsp; </td>
					<td id = "parent">
					&nbsp;&nbsp;&nbsp;
					年&nbsp;&nbsp;
					<select id="year" name="year" style = "width: 100px;">
							<% for(int i=1900;i<=2016;i++){%>
							<option value="<%= i%>">
								<%=i %>
							</option>
							<%}%>
					</select>
                    &nbsp;&nbsp;&nbsp;&nbsp;
					月&nbsp;&nbsp;<select id="mouth" name="mouth">
							<% for(int i=1;i<=12;i++)
                            {%>
							<option value="<%= i%>">
								<%=i %>
							</option>
							<%}%>
					</select>
					</td>
				</tr>
			</table>
			<input type="submit" name="submit" onclick= "return true" class="submit" value="放漂">
		</form>
	</center>
	</div>

</body>
</html>

