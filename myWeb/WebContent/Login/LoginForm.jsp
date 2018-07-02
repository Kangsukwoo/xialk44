<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<%@include file="../footer.jsp" %>
<%
	String id = request.getParameter("id");
	boolean cki = false;
	if(id == null){
		Cookie[] cks = request.getCookies();
		if(cks != null){
			for(Cookie ck : cks){
				if(ck.getName().equals("ckid")){
					id = ck.getValue();
					cki = true;
					break;
				}
			}
		}
	}
%>
<script>
	function checkLogin() {
		if(document.login.id.value=="") {
		alert("아이디 미입력!");
	}else if(document.login.password.value==""){
		alert("비밀번호 미입력!");
	}else {
		document.login.submit();
	}
	}//checkLogin()end
</script>
<div align="center">
<form action="CheckLogin.jsp" method="post" name="login">
	<table border="1">
			<tr>
				<th>ID</th>
				<td><input type="text" name = "id" value="<%=id != null ? id : "" %>"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name = "password"></td>
			</tr>
			<tr>
				<td colspan="2">
					<span align="left">
						<%if(cki) {%>
							<input type="checkbox" value = "true" name = "ckid" checked="checked">
						<%}else { %>
							<input type="checkbox" value = "true" name = "ckid">
						<%} %>
						<font size="2">아이디 기억하기</font>
					</span>
					<span align="right">
						<input type="button" value="Login" onclick = "javascript:checkLogin()">
						<input type="button" value="Reset" onclick="document.login.reset()">
					</span>
				</td>
			</tr>
		</table>
</form>
</div>
</body>
</html>