<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	session.removeAttribute("login");

	out.write("<script>");
	out.write("alert('로그아웃!');");
	out.write("location.href = '/myWeb/index.jsp';");	
	out.write("</script>");
%>