<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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

String book_title = java.net.URLDecoder.decode(request.getParameter("book_title"), "UTF-8");
String post_content = java.net.URLDecoder.decode(request.getParameter("post_content"), "UTF-8");

//System.out.println(post_title);
//System.out.println(book_title);
//System.out.println(post_content);


if (book_title != null) 
{
	try
	{
		/*
		String sql = "INSERT INTO ask_drift (username, bookName, ask_info, ask_num) "
	               + "VALUE( '"+userID+"','"+book_title+"','"+post_content+"',"+0+")";
	    */
	    
	    String sql = "INSERT INTO ask_drift (username, ask_infor, ask_num) "
	               + "VALUE( '"+userID+"','"+post_content+"',"+0+")";
	    //System.out.println(sql);
		stmt.execute(sql);
		conn.close();
		stmt.close();
	}
	catch(Exception e)
	{
		out.println("数据库错误");
		e.printStackTrace();
	}
	
}
%>