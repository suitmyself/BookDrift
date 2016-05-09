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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="description" content="askdriftshow.jsp">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<title>求漂展览区</title>
	<style type="text/css">
	.askdriftBoard {
		width: 80%;
		height: 100%;
		float: left;
		background-color: #D9D9D9;
		border-radius: 8px;
		margin-left: 15px;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	.postItem 
	{
		margin-left: auto;
		margin-right: auto;
		
		display: block;
		margin-bottom: 20px;
		/*width: 500px;*/
		background-color: #FFF;
		border: 1px solid #E1DFDF;
		border-radius: 2px;
		box-shadow: 0px 2px 2px #CCC;
		word-break: break-all;
		font: 12px/18px arial,STHeiti,"Microsoft YaHei",宋体;
		color: #333;
	
	
		width: 90%;
		float: left;
		border-radius: 5px;
		margin-left: 20px;
		padding-top: 10px;
		padding-bottom: 20px;
	}
	.originalText {
		width: 90%;
		float: left;
		background-color: #FFF;
		border-radius: 5px;
		margin-left: 20px;
		padding-top: 10px;
		padding-bottom: 0px;
	}
	.content
	{
		background-color:FFCCCC;
		font-size:14px;
		width:100%;
		min-height:80px;
		padding-left:10px;
		padding-top:10px;
		border-radius: 2px;
		margin-bottom: 5px;
	}

	
	</style>
	<script type="text/javascript" src="jquery-1.8.0.min.js"></script>
	<script type="text/javascript">
	showAllaskdrift();
	
	function showAllaskdrift()
	{
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		}
		else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("showlist").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET", "getaskdriftinfor.jsp?t=" + Math.random(), true);
		xmlhttp.send();
		
	}
	function addnum(id)
	{
		$('#' + id).hide();
		
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		}
		else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.open("GET", "askdriftaddnum.jsp?id=" + id, true);
		xmlhttp.send();

	}

	</script>

</head>
<body style="background-color:#D9D9D9">
    <%@ include file="navigator.jsp" %>
  	<%@ include file="module.jsp" %>
	<h1><center>求漂展览&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center></h1>
	<div class="askdriftBoard" id="showlist"></div>

</body>
</html>