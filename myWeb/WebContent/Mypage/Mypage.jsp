<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<%@include file="../footer.jsp" %>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>

<%	
	MemberDTO dto = new MemberDTO();
	MemberDAO dao = new MemberDAO();
		
	dto = dao.memberInfo(login);	 
%> 
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<table>
		<tr>
			<td>번호</td>
			<td><%=dto.getNo() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=dto.getTel1() %> - <%=dto.getTel2() %> - <%=dto.getTel3() %></td>
		</tr>
	</table>
	</div>
	

</body>
</html>