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
<meta http-equiv="description" content="articleshare.jsp">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<title>读书分析展览区</title>
	<style type="text/css">
	.putdriftBoard {
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
	showAllaskdrift("article_score");
	
	function showAllaskdrift(order)
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
		xmlhttp.open("GET", "articleinfor.jsp?order=" + order, true);
		xmlhttp.send();
		
	}
	function addscore(id)
	{
		$('#' + id).hide();
		
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		}
		else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.open("GET", "articleaddscore.jsp?id=" + id, true);
		xmlhttp.send();

		alert("点赞成功!!!");
	}
	</script>

</head>
<body style="background-color:#D9D9D9">
    <%@ include file="navigator.jsp" %>
  	<%@ include file="module.jsp" %>
	<h1><center>读书分享&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</center></h1>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button onclick="showAllaskdrift('article_score')">按评分排序</button>
	<button onclick="showAllaskdrift('sharetime')">按时间排序</button>
	<div class="putdriftBoard" id="showlist"></div>

</body>
</html>