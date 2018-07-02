<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<%@include file="../footer.jsp" %>
<script>
	function checkJoin(){
		if(document.join.id.value == ""){
			alert("아이디를 입력하십시오!");
		}else if(document.join.password.value == ""){
			alert("비밀번호를 입력하십시오!");
		}else if(document.join.repw.value == ""){
			alert("비밀번호확인을 입력하십시오!");
		}else if(document.join.name.value == ""){
			alert("이름을 입력하십시오!");
		}else if(document.join.email.value == ""){
			alert("이메일을 입력하십시오!");
		}else if(document.join.tel1.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.join.tel2.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.join.tel3.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.join.password.value != document.join.repw.value){
			alert("비밀번호가 일치하지 않습니다.");
		}else{
			document.join.submit();
		}
	}
</script>
<div align="center">
	<form action="/myWeb/Member/CheckJoin.jsp" method="post" name = "join">
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name = "id"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name = "password"></td>
			</tr>
			<tr>
				<th>rePW</th>
				<td><input type="password" name = "repw"></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" name = "name"></td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td><input type="text" name = "email"></td>
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
					<input type="button" value="Join" onclick="javascript:checkJoin()">
					<input type="button" value="Reset" onclick="document.join.reset()">
				</td>
			</tr>
		</table>
	</form>
</div>