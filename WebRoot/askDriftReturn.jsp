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
	//Query posts
	String sql = "SELECT * FROM ask_drift WHERE username = '"+ userID + "' ORDER BY ask_time DESC";

	//System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
    for ( ; rs.next(); ) 
    {
    	String post_id = rs.getString("ask_driftID");
    	String username = userID;
    	String ask_time = rs.getString("ask_time");
    	//String book_title = rs.getString("bookName");
    	String post_content = rs.getString("ask_infor");
    	String ask_num = rs.getString("ask_num");
    	
     %>
		<div class="postItem">
			<div class="postContent" id='<%= "PC_" + post_id %>' >
				<div class="originalText">
					<p>
						<strong style="font-weight: bold; color: #333; font-size:15px;">
							&nbsp;&nbsp;<%= username %>
						</strong> &nbsp;发布求漂
						&nbsp;&nbsp; 时间:  <i><%= ask_time %></i>
						&nbsp;&nbsp; <font color="red">点赞数:  <i><%=  ask_num%></i> </font>
					</p>
					
					<p class="content"><%= post_content %></p>
				</div>	
			</div>
		</div>
	<%
	}

	rs.close();
	stmt.close();
	conn.close();
} //try

catch(Exception e) {
	//Handle errors for Class.forName
	out.println("<p>sorry,数据库错误</P>");
	e.printStackTrace();
}
%>
