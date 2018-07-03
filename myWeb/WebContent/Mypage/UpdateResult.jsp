<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%
	MemberDTO dto = new MemberDTO();
	
	dto.setNo(Integer.parseInt(request.getParameter("no")));
	dto.setPassword(request.getParameter("password"));
	dto.setName(request.getParameter("name"));
	dto.setEmail(request.getParameter("email"));
	dto.setTel1(request.getParameter("tel1"));
	dto.setTel2(request.getParameter("tel2"));
	dto.setTel3(request.getParameter("tel3"));

	MemberDAO dao = new MemberDAO();
	
	int su = dao.updateMember(dto);

	out.write("<script>");
	if(su!=0){
		out.write("alert('회원수정 성공!! 회원정보페이지로 이동합니다');");
		out.write("javascript:location.href='Mypage.jsp'");	
	}else{
		out.write("alert('회원가입 실패!이전페이지로 이동합니다');");
		out.write("history.back();");	
	}
	out.write("</script>");

%>
    