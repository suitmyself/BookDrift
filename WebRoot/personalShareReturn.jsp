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
	String sql = "SELECT * FROM article WHERE username = '"+ userID + "' ORDER BY sharetime DESC";

	//System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
    for ( ; rs.next(); ) 
    {
    	String post_id = rs.getString("articleID");
    	String username = userID;
    	String sharetime = rs.getString("sharetime");
    	String post_title = rs.getString("article_title");
    	String book_title = rs.getString("bookName");
    	String post_content = rs.getString("article_details");
    	String post_score = rs.getString("article_score");
    	
     %>
		<div class="postItem">
			<div class="postContent" id='<%= "PC_" + post_id %>' >
				<div class="originalText">
					<p>
						<strong style="font-weight: bold; color: #333; font-size:15px;">
							&nbsp;&nbsp;<%= username %>
						</strong> &nbsp;发布文章  
						&nbsp;&nbsp; 时间:  <i><%= sharetime %></i>
						&nbsp;&nbsp; <font color="red">点赞数:  <i><%=  post_score%></i> </font>
					</p>
					
					<p class="post_title"> &nbsp;&nbsp; 文章名:<%= post_title %> </p>
					<p class="book_title"> &nbsp;&nbsp; 书名:<%= book_title %> </p> 
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