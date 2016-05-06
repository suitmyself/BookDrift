<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="accessDB.jsp" %>

<%
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");

String post_title = java.net.URLDecoder.decode(request.getParameter("post_title"), "UTF-8");
String book_title = java.net.URLDecoder.decode(request.getParameter("book_title"), "UTF-8");
String post_content = java.net.URLDecoder.decode(request.getParameter("post_content"), "UTF-8");

//System.out.println(post_title);
//System.out.println(book_title);
//System.out.println(post_content);


if (post_title != null) 
{
	String userID = (String) session.getAttribute("userID");
	try
	{
		String sql = "INSERT INTO article (username, article_title, bookName, article_details, article_score) "
	               + "VALUE( '"+userID+"','"+post_title+"','"+book_title+"','"+post_content+"',"+0+")";
	    
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