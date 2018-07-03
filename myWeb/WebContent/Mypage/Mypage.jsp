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
		<form action="MemberUpdate.jsp" method="post">
			<table border="1">
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
				<tr align="right">
					<td colspan="2">
					<input type="button" value="수정" onclick="javascript:location.href='Update.jsp'">
					<input type="button" value="탈퇴" onclick="javascript:location.href='Delete.jsp'">
					<input type="button" value="back" onclick="javascript:history.back()">
					</td>			
				</tr>
			</table>
		</form>
	</div>
	

</body>
</html>