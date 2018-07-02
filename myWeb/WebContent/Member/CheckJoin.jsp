<%@page import="member.MemberDAO" %>
<%@page import="member.MemberDTO" %>
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	MemberDTO dto = new MemberDTO();
	dto.setId(request.getParameter("id"));
	dto.setName(request.getParameter("name"));
	dto.setPassword(request.getParameter("password"));
	dto.setEmail(request.getParameter("email"));
	dto.setTel1(request.getParameter("tel1"));
	dto.setTel2(request.getParameter("tel2"));
	dto.setTel3(request.getParameter("tel3"));

	MemberDAO dao = new MemberDAO();
	
	boolean check = dao.insert(dto);
	
	out.write("<script>");
	if(check){
		out.write("alert('회원가입 성공!!로그인페이지로 이동합니다...');");
		out.write("location.href = '/myWeb/Login/LoginForm.jsp?id=" + dto.getId() + "';");	
	}else{
		out.write("alert('회원가입 실패!이전페이지로 이동합니다..');");
		out.write("history.back();");	
	}
	out.write("</script>");
%>












