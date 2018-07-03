<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<%@include file="../footer.jsp" %>
<%@page import="board.BoardDTO" %>
<%@page import="board.BoardDAO" %>

<%
int seq = Integer.parseInt(request.getParameter("seq"));

BoardDAO dao = new BoardDAO();

dao.increaseHit(seq);


%> 



<script>
	alert("조회수 증가 test");
	location.href='BoardList.jsp';
</script>