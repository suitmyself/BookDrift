<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
	
	try
	{
		String bookID = java.net.URLDecoder.decode(request.getParameter("bookID"), "UTF-8");
		
		String sql = "SELECT * FROM book WHERE bookID='"+bookID+"'";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next())
		{
			if(rs.getString("now_username").equals(userID) == false || rs.getInt("state") == 1)
			{
				out.println("fail");
			}
			else
			{
				String update_sql = "update book set state = 1 where bookID = "+bookID;
				stmt.executeUpdate(update_sql);
				out.println("success");
				
			}
		}
		else
		{
			out.println("无法找到书籍");
		}
		
	}
	catch(Exception e)
	{
		//Handle errors for Class.forName
		out.println("<p>sorry,数据库错误</P>");
		e.printStackTrace();
	}
%> 
