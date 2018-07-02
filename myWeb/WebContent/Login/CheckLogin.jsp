<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPassword(password);
	
	MemberDAO dao = new MemberDAO();
	String name = dao.login(dto);
	boolean check = false;
	String msg = null;
	
	if(name != null){
		check = true;
		msg = name + "님이 로그인하셨습니다.";
		session.setAttribute("login", id);
	}else{
		msg = "아이디 혹은 비밀번호가 잘못되셨습니다.";
	}
	
	request.setAttribute("name", name);
	request.setAttribute("check", check);
	request.setAttribute("msg", msg);
	
	String ckid = request.getParameter("ckid");
	System.out.println(ckid);
	if(ckid != null){
		Cookie ck = new Cookie("ckid",id);
		ck.setMaxAge(60 * 60);
		response.addCookie(ck);
	}else{
		Cookie[] cks = request.getCookies();
		for(Cookie ck : cks){
			if(ck.getName().equals("ckid")){
				if(ck.getValue().equals(id)){
					ck.setMaxAge(0);
					response.addCookie(ck);
					break;
				}
			}
		}
	}
	
	pageContext.forward("/Login/LoginResult.jsp");
	
%>















