<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="member.MemberDTO" %>   
<%@ page import="member.MemberDAO" %>   
<%
	String id = (String)session.getAttribute("login");
	out.write("<script>");
	
	if(new MemberDAO().delete(id)){
		session.invalidate();
		Cookie[] cks = request.getCookies();
		if(cks != null){
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
		out.write("alert('회원 탈퇴!!');");
		out.write("location.href = '/myWeb/index.jsp';");
	}else{
		out.write("alert('회원탈퇴 실패!');");
		out.write("history.back();");	
	}
	out.write("</script>");

%>
    
