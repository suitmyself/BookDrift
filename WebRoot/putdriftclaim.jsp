<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
response.setCharacterEncoding("UTF-8");
request.setCharacterEncoding("UTF-8");

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String userID = (String) session.getAttribute("userID");
if (session.isNew() || userID == null)
{
	response.sendRedirect("login.jsp");
	//System.out.println("转向到登录页面");
	return;
}
%>
<%@ include file="accessDB.jsp" %>

<%
String put_driftID=request.getParameter("put_driftID");
String bookID=request.getParameter("bookID");
String username=request.getParameter("username");
//删除put_driftID指向的放漂信息，把bookID指向的book状态修改并且修改当前所在用户为username
try {
	//Query posts
	

	// delete from put_drift where put_driftID=2;
	String sql = "delete from put_drift where put_driftID="+put_driftID;
	stmt.executeUpdate(sql);
	//System.out.println(sql);
	// update book set state=0,now_username='david' where bookID=2;
	
	sql = "select * from book where bookID = " + bookID;
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	String ori_username = rs.getString("now_username");
	
	sql="update book set state=0,now_username='"+username+"' where bookID="+bookID;
	stmt.executeUpdate(sql);
	
	//insert into user_step(username,bookID) values('davidblus',1);
	sql="insert into user_step(username,bookID) values('"+username+"',"+bookID+")";
	stmt.executeUpdate(sql);
	
	sql = "insert into system_message(status,content,to_username)values(0,'"+
                 ori_username+" receive your book!(bookID ="+bookID+")','"+username+"')";
    stmt.executeUpdate(sql);
    
    sql = "insert into system_message(status,content,to_username)values(0,'"+
                 username+" get your book!(bookID ="+bookID+")','"+ori_username+"')";
    stmt.executeUpdate(sql);
	
	
%>

<%
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
