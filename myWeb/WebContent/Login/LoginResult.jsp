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
			<a href="">MyPage | Logout
		<%}else { %>
			아이디/비밀번호찾기
		<%} %>
	</div>