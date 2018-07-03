<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>    
<%
 	String login = (String)session.getAttribute("login");	
%>
<html>
<style type="text/css">
.frame{ 
width: 800px; margin: 0 auto;
}
.header{
	border-color: black; border:1px solid; padding:20px 10px; text-align: center; margin-bottom: 20px;
}
.footer {    position:absolute;  bottom:0; width:inherit; height:70px; background:#ccc; text-align: center;
}
.main_contents{
	overflow: hidden; text-align: center; margin-top: 35px; border: 1px solid; height: 550px;
}
</style>
<script src="../Script/Script.js"></script>	<!-- 유효성검사 스크립트 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Index.jsp</title>
</head>
<body>
<div class="frame">
	<div class="header">
 	<%if(login != null) {%>
				<a href = "/myWeb/Mypage/Mypage.jsp">MyPage</a> | 
				<a href = "/myWeb/Login/Logout.jsp">Logout</a> | 
			<%}else { %>
				<a href = "/myWeb/Login/LoginForm.jsp">Login</a> | 
				<a href = "/myWeb/Member/JoinForm.jsp">Join</a> | 
			<%} %>
				<a href = "/myWeb/Board/BoardList.jsp">Board</a> | 
			<a href = "/myWeb/index.jsp">Home</a> 
			
			<!-- <a href = "/myWeb/Login/Logout.jsp">Logout</a> | <a href = "/myWeb/Login/LoginForm.jsp">Login</a> | <a href = "/myWeb/Member/JoinForm.jsp">Join</a> | <a href = "/myWeb/index.jsp">Home</a>  -->
			
	</div>
