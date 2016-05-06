<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>个人分享</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="description" content="user.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>	

<style type="text/css">
	.PostButton, .commet {
	   
		height: 30px;
		margin-left: 10px;
		adding: 0px 30px;
		display: inline-block;
        font-size: 14px;
        line-height: 28px;
        color: #666;
		text-align: center;
		vertical-align: middle;
		cursor: pointer;
		background: linear-gradient(to bottom, #FEFEFE 0px, #F8F8F8 100%) repeat scroll 0% 0% #FBFBFB;
		border: 1px solid #A7ACB5;
		border-radius: 3px;
		box-shadow: 0px 1px 0px rgba(0, 0, 0, 0.15);
		
		/*position: relative;*/
		/*bottom: 10px;*/
		
		
		float: right;
		margin-right: 29px;
		
	}
	.commet
	{
		margin-right: 48px;
	}
	
	.postPaid
	{
		width:50%;
		/*height:180px;*/
		margin-left: auto;
		margin-right: auto;
		
		display: block;
		margin-bottom: 20px;
		margin-top: 25px;
		padding-bottom: 40px;
		/*width: 500px;*/
		background-color: #FFF;
		border: 1px solid  	#E1DFDF ;
		border-radius: 2px;
		box-shadow: 2px 4px 4px #CCC;
		word-break: break-all;
		font: 12px/18px arial,STHeiti,"Microsoft YaHei",宋体;
		color: #333;
	}

	#myPost {
		width: 90%;
		height:100px;
		margin-left: 30px;
		margin-top: 20px;
		padding-top: 10px;
		padding-bottom: 10px;
		margin-bottom:15px;
		border: 1px solid #E1E1E1;
	}
	
	#post_title, #book_title {
		width: 90%;
		height:30px;
		margin-left: 30px;
		margin-top: 20px;
		padding-top: 3px;
		padding-bottom: 3px;
		border: 1px solid #E1E1E1;
	}

	.postBoard {
		width: 80%;
		height: 100%;
		float: right;
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

	.replies {
		width: 89%;
		float: left;
		background-color: silver;
		border-radius: 5px;
		margin-left: 40px;
		margin-top: 2px;
		padding-top: 5px;
		padding-bottom: 5px;
	}

	.replyText
	{
		padding-top: 5px;
		padding-bottom: 5px;
		padding-left: 10px;
	}
	
	.to_ReplayText
	{
		width: 90%;
		height: 30px;
		margin-left: 30px;
		margin-top: 0px;
		padding-top: 5px;
		padding-bottom: 5px;
		margin-bottom:5px;
		border: 1px solid green;
		
	}
	
	.inputReply
	{
		margin-top:10px;
	}

	.toReply {
		width: 91.5%;
		float: left;
		background-color: #E6E6FA;
		border-radius: 5px;
		margin-left: 20px;
		padding-top: 5px;
		padding-bottom: 5px;
		margin-top:5px;
	}

</style>

<script type="text/javascript">
		updatePostBoard();
		setInterval("updatePostBoard();updateSystemMessage();", 3000);

		function updatePostBoard() {
			var xmlhttp;
			if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			}
			else {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
											if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
												document.getElementById("dynamics").innerHTML=xmlhttp.responseText;
										 };
			xmlhttp.open("GET", "askDriftReturn.jsp?t=" + Math.random(), true);
			xmlhttp.send();
		}

		function submitPost() {
			var myPost = document.getElementById("myPost");
			var post_content = myPost.value;
			var book_title = document.getElementById("book_title");
			book_title = book_title.value;
			
			if (post_content != "") {
				var xmlhttp;
				if (window.XMLHttpRequest) 
					xmlhttp = new XMLHttpRequest();
				else 
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");

				if (xmlhttp != null) {
					xmlhttp.onreadystatechange = function() {
						if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
							updatePostBoard();
						}
					};
					var send_content = "submitAskDrift.jsp?book_title="+book_title+"&post_content="+post_content;
					//invoke encodeURI is necessary
					send_content = encodeURI(send_content);
					send_content = encodeURI(send_content);
					xmlhttp.open("POST", send_content, true);
					xmlhttp.send();
					
					document.getElementById("myPost").value= "想要的书找不到，来求漂吧";
					document.getElementById("myPost").style.color= "#C8C8C8";
					document.getElementById("myPost").style.borderColor="#E1E1E1";
					
					document.getElementById("book_title").value= "书名";
					document.getElementById("book_title").style.color= "#C8C8C8";
					document.getElementById("book_title").style.borderColor="#E1E1E1";
				}
			} else {
				alert("请输入内容！");
			}
		}
		
		function postBookTitleOnblur(text_)
		{
			if(text_.value=="")
			{	
				text_.value= "书名";
				text_.style.color= "#C8C8C8";
				text_.style.borderColor="#E1E1E1";
			}
		}
		
		function postBookTitleOnfocus(text_)
		{
			if(text_.value=="书名")
				text_.value= "";
			text_.style.color="black";
			text_.style.borderColor="green";
		}
		
		function postOnblur(text_)
		{
			if(text_.value=="")
			{
				text_.value= "想要的书找不到，来求漂吧";
			
				text_.style.color= "#C8C8C8";
				text_.style.borderColor="#E1E1E1";
			}
		}
		
		function postOnfocus(text_)
		{
			if(text_.value.substring(0,14)=="想要的书找不到，来求漂吧")
				text_.value= "";
			text_.style.color="black";
			text_.style.borderColor="green";
		}

		var autoTextarea = function (elem, extra, maxHeight) 
		{
	        extra = extra || 0;
	        var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
	        isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
	                addEvent = function (type, callback) {
	                        elem.addEventListener ?
	                                elem.addEventListener(type, callback, false) :
	                                elem.attachEvent('on' + type, callback);
	                },
	                getStyle = elem.currentStyle ? function (name) {
	                        var val = elem.currentStyle[name];
	 
	                        if (name === 'height' && val.search(/px/i) !== 1) {
	                                var rect = elem.getBoundingClientRect();
	                                return rect.bottom - rect.top -
	                                        parseFloat(getStyle('paddingTop')) -
	                                        parseFloat(getStyle('paddingBottom')) + 'px';        
	                        };
	 
	                        return val;
	                } : function (name) {
	                                return getComputedStyle(elem, null)[name];
	                },
	                minHeight = parseFloat(getStyle('height'));
	 
	        elem.style.resize = 'none';
	 
	        var change = function () 
	        {
	                var scrollTop, height,
	                        padding = 0,
	                        style = elem.style;
	 
	                if (elem._length === elem.value.length) return;
	                elem._length = elem.value.length;
	 
	                if (!isFirefox && !isOpera) {
	                        padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
	                };
	                scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
	 
	                elem.style.height = minHeight + 'px';
	                if (elem.scrollHeight > minHeight) {
	                        if (maxHeight && elem.scrollHeight > maxHeight) {
	                                height = maxHeight - padding;
	                                style.overflowY = 'auto';
	                        } else {
	                                height = elem.scrollHeight - padding;
	                                style.overflowY = 'hidden';
	                        };
	                        style.height = height + extra + 'px';
	                        scrollTop += parseInt(style.height) - elem.currHeight;
	                        document.body.scrollTop = scrollTop;
	                        document.documentElement.scrollTop = scrollTop;
	                        elem.currHeight = parseInt(style.height);
	                };
	        };
	 
	        addEvent('propertychange', change);
	        addEvent('input', change);
	        addEvent('focus', change);
	        change();
		};
</script>

<body style="background-color:#D9D9D9">
    <%@ include file="navigator.jsp" %>
  	<%@ include file="module.jsp" %>
	<div class="postPaid">
	    <textarea id="book_title" onfocus="postBookTitleOnfocus(this)" onblur="postBookTitleOnblur(this)" style="color:#C8C8C8">书名</textarea>
		<textarea id="myPost" onfocus="postOnfocus(this)" onblur="postOnblur(this)" style="color:#C8C8C8">想要的书找不到，来求漂吧</textarea>
		<script> 
        	var text = document.getElementById("myPost");
       	 	autoTextarea(text);// 调用
    	</script>
		<br/>
		<button onclick="submitPost()" class="postButton">发布</button>
	</div>
	<div class="postBoard" id="dynamics"></div>

</body>
</html>
	