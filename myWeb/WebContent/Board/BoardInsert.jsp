<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../header.jsp" %>
<%@include file="../footer.jsp" %>
<%@page import="board.BoardDTO" %>
<%@page import="board.BoardDAO" %>

<%
	BoardDTO dto = new BoardDTO();

	String id = (String)session.getAttribute("login");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String passwd = request.getParameter("passwd");
	int hit = 0;
	
	if(id==null) {
		out.print("<script>");
		out.print("alert('로그인되어있지 않습니다');");
		out.write("history.back();");	
		out.write("</script>");		
	}else{
		
		dto.setId(id);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPasswd(passwd);
		dto.setHit(hit);
		
		System.out.println(id);
		
		BoardDAO dao = new BoardDAO();
		
		int su = dao.insertBoard(dto);
		
		out.print("<script>");
		if(su!=0){
			out.write("alert('글쓰기 성공!! 글목록 페이지로 이동합니다');");
			out.write("javascript:location.href='BoardList.jsp'");	
		}else{
			out.write("alert('글쓰기 실패!이전페이지로 이동합니다');");
			out.write("history.back();");	
		}
		out.write("</script>");
		
	}
	


%>