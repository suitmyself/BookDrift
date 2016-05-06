<%@ page language="java"  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="accessDB.jsp" %>

<%
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");


	String userID = (String) session.getAttribute("userID");
	if (session.isNew() || userID == null)
	{
		response.sendRedirect("login.jsp");
		return;
	}
	
	String bookName = request.getParameter("bookName");
	String isbn = request.getParameter("isbn");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publiser");
	String year = request.getParameter("year");
	String mouth = request.getParameter("mouth");
	
	
	
	String sql = "insert into book (bookName, isbn, author, publishment, publish_time, own_username, now_username) value "
	           + "('"+bookName+"','"+isbn+"','"+author+"','"+publisher+"','"+year+"-"+mouth+"-1','"
	           + userID +"','"+userID +"')";
	
	System.out.println(sql);
	
	try
	{
		stmt.executeUpdate(sql);
		
		response.sendRedirect("driftBook.jsp");
		conn.close();
		stmt.close();
		
		
	}
	catch(Exception e)
	{
		out.println("数据库错误");
		e.printStackTrace();
		
	}
	
%>
