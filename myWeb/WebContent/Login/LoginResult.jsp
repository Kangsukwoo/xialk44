<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<%@include file="../footer.jsp" %>
<%
	String name = (String)request.getAttribute("name");
	String msg = (String)request.getAttribute("msg");
	boolean check = (boolean)request.getAttribute("check");
%>    

	<div align="center">
		<%=msg %><br>
		<%if(check) {%>
			<a href="/myWeb/Mypage/Mypage.jsp">MyPage</a> | <a href = "/myWeb/Login/Logout.jsp">Logout</a>
		<%}else { %>
			아이디/비밀번호찾기
		<%} %>
	</div>