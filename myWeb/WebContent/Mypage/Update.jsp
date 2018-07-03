<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<%@include file="../footer.jsp" %>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%
	String id = (String)session.getAttribute("login");
	
	MemberDTO dto = new MemberDAO().memberInfo(id);
%>

<script>
	function checkJoin(){
		if(document.joinUpdate.id.value == ""){
			alert("아이디를 입력하십시오!");
		}else if(document.joinUpdate.password.value == ""){
			alert("비밀번호를 입력하십시오!");
		}else if(document.joinUpdate.repw.value == ""){
			alert("비밀번호확인을 입력하십시오!");
		}else if(document.joinUpdate.name.value == ""){
			alert("이름을 입력하십시오!");
		}else if(document.joinUpdate.email.value == ""){
			alert("이메일을 입력하십시오!");
		}else if(document.joinUpdate.tel1.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.joinUpdate.tel2.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.joinUpdate.tel3.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.joinUpdate.password.value != document.joinUpdate.repw.value){
			alert("비밀번호가 일치하지 않습니다.");
		}else{
			document.joinUpdate.submit();
		}
	}
</script>
<div align="center">
	<form action="/myWeb/Mypage/UpdateResult.jsp" method="post" name = "joinUpdate">
	<input type="hidden" name="no" value="<%=dto.getNo()%>">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name = "id" value="<%= dto.getId() %>" readonly="readonly"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name = "password" value="<%= dto.getPassword() %>"></td>
			</tr>
			<tr>
				<th>rePW</th>
				<td><input type="password" name = "repw"></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" name = "name" value="<%= dto.getName() %>"></td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td><input type="text" name = "email" value="<%= dto.getEmail() %>"> </td>
			</tr>
			<tr>
				<th>TEL</th>
				<td>
					<select name = "tel1">
						<option value="010">010</option>
						<option value="010">011</option>
						<option value="010">016</option>
						<option value="010">019</option>
					</select>
					-<input type="text" size = "5" maxlength="4" name = "tel2">
					-<input type="text" size = "5" maxlength="4" name = "tel3">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right"> 
					<input type="button" value="수정" onclick="javascript:checkJoin()"> 
					<input type="button" value="Reset" onclick="document.joinUpdate.reset()">
				</td>
			</tr>
		</table>
	</form>
</div>