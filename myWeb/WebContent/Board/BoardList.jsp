<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<%@include file="../footer.jsp" %>

<div align="center">	
		<table border="1">
			<tr>
				<th>번호</th>
				<th>글제목</th>
				<th>아이디</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<tr>	
				<td colspan="6" align="right">		
				<input type="button" value="글쓰기" onclick="javascript:location.href='BoardWrite.jsp'">
				</td>
			</tr>
		</table>		
</div>